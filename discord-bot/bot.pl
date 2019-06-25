:- dynamic [
        alive/0,
        last_heartbeat_acked/0,
        session_id/1,
        d/1
    ].
:- use_module(library(http/websocket)).
:- use_module(library(http/json)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).

% Flow:
%   - Request gateway_url
%   - open a websocket connection with that url (version and encoding)
%   - receive op 10 Hello (heartbeat_interval)
%     - op 1 heartbeat every heartbeat_interval ms
%       - listen for op 11 heartbeat ack
%       - if no ack, immediately:
%         - terminate the connection w/ non-1000 close code
%         - reconnect
%         - attempt to resume.
%     - also respond to server heartbeat requests
gateway_url(URL) :-
    http_get('https://discordapp.com/api/gateway',
             _{url:URL},
             [json_object(dict)]).

run :-
    connect(false).

connect(Resume) :-
    gateway_url(GatewayURL),
    string_concat(GatewayURL, "/?v=6&encoding=json", WebsocketURL),
    http_open_websocket(WebsocketURL, WebSocket, []),
    ws_receive(WebSocket, Response, [format(json)]),
    HeartbeatSeconds is Response.data.d.heartbeat_interval / 1_000,
    write('Heartbeating every '), write(HeartbeatSeconds), writeln('ms'),
    heartbeat(WebSocket, HeartbeatSeconds),
    (  Resume
    -> resume(WebSocket)
    ;  identify(WebSocket)
    ),
    loop(WebSocket).

loop(WebSocket) :-
    ws_receive(WebSocket, Response, [format(json)]),
    handle_message(Response),
    !,
    loop(WebSocket).

handle_message(Response) :-
    Response.opcode \= close,
    Op = Response.data.op,
    handle_event(Op, Response.data).
handle_message(Response) :-
    Response.opcode == close,
    writeln('CLOSE CODE !!!').

handle_event(0, Data) :-
    T = Data.t,
    retractall(d(_)),
    assert(d(Data.s)),
    d(D),
    write('D is '), writeln(D),
    handle_op0_event(T, Data),
    !.
handle_event(11, Data) :-
    writeln('heartbeat acked'),
    assert(last_heartbeat_acked).
handle_event(Op, Data) :-
    writeln(Op),
    writeln(Data).

handle_op0_event("READY", Data) :-
    SessionId = Data.d.session_id,
    writeln(SessionId),
    session_id(SessionId).
handle_op0_event("GUILD_CREATE", Data) :-
    Name = Data.d.name,
    writeln(Name).
handle_op0_event("MESSAGE_CREATE", Data) :-
    Data = Data.d,
    writeln(Data).
handle_op0_event(What, Data) :-
    Data = Data.d,
    writeln(What),
    writeln(Data).

identify(WebSocket) :-
    EventData = _{
        token: "NTg5NTQzMjA3Mzc3ODI5OTAx.XQcHTg.kTmlco1Zg6VJbQX33nEhsrrhCJA",
        compress: false,
        properties: _{
            '$os': windows,
            '$browser': adama,
            '$device': adama
        }
    },
    payload(2, EventData, Payload),
    ws_send(WebSocket, Payload).

resume(WebSocket) :-
    session_id(SessionId),
    d(D),
    EventData = _{
        token: "NTg5NTQzMjA3Mzc3ODI5OTAx.XQcHTg.kTmlco1Zg6VJbQX33nEhsrrhCJA",
        session_id: SessionId,
        seq: D
    },
    payload(6, EventData, Payload),
    ws_send(WebSocket, Payload).


heartbeat(WebSocket, HeartbeatSeconds) :-
    assert(alive),
    assert(d(null)),
    assert(last_heartbeat_acked),
    thread_create(pulse(WebSocket, HeartbeatSeconds), _).

pulse(WebSocket, HeartbeatSeconds) :-
    alive,
    d(D),
    (   last_heartbeat_acked
    ->  writeln('heartbeat ack retracted'),
        retractall(last_heartbeat_acked),
        writeln("making a heartbeat"),
        payload(1, D, Payload),
        % ws_send(WebSocket, Payload),
        writeln("now sleep"),
        sleep(HeartbeatSeconds),
        writeln("done sleep"),
        !,
        pulse(WebSocket, HeartbeatSeconds)
    ;   reconnect(WebSocket)
    ).

kill :-
    retractall(alive).

reconnect(WebSocket) :-
    ws_close(WebSocket, 9000, ack_missed),
    kill,
    writeln('would reconnect here'),
    connect(true).

payload(Opcode, EventData, _{
    opcode: Opcode,
    format: json,
    data: _{
        op: Opcode,
        d: EventData
    }
}).
