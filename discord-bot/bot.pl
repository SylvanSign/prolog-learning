:- dynamic [
        alive/0,
        last_heartbeat_acked/0
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

connect(Fresh, Fresh1, Fresh2) :-
    gateway_url(GatewayURL),
    string_concat(GatewayURL, "/?v=6&encoding=json", WebsocketURL),
    http_open_websocket(WebsocketURL, WebSocket, []),
    ws_receive(WebSocket, Response, [format(json)]),
    HeartbeatMs is Response.data.d.heartbeat_interval / 1_000,
    heartbeat(WebSocket, HeartbeatMs),
    identify(WebSocket),
    ws_receive(WebSocket, Fresh, [format(json)]),
    ws_receive(WebSocket, Fresh1, [format(json)]),
    ws_receive(WebSocket, Fresh2, [format(json)]).

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

heartbeat(WebSocket, HeartbeatMs) :-
    assert(alive),
    assert(last_heartbeat_acked),
    thread_create(pulse(WebSocket, HeartbeatMs, null), _).

pulse(WebSocket, HeartbeatMs, D) :-
    alive,
    (   last_heartbeat_acked
    ->  retractall(last_heartbeat_acked),
        writeln("making a heartbeat"),
        payload(1, D, Payload),
        ws_send(WebSocket, Payload),
        writeln("now sleep"),
        sleep(5),
        writeln("done sleep"),
        NewD is D + 1,
        pulse(WebSocket, HeartbeatMs, NewD)
    ;   reconnect(WebSocket)
    ).

kill :-
    retractall(alive).

reconnect(WebSocket) :-
    ws_close(WebSocket, 9000, ack_missed),
    writeln(connect).
    % connect.

payload(Opcode, EventData, _{
    opcode: Opcode,
    format: json,
    data: _{
        op: Opcode,
        d: EventData
    }
}).
