:- use_module(library(http/websocket)).
:- use_module(library(http/json)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).

% TODO remove this; for debugging only
:- op(920,fy, *).
*_.

send_json(WebSocket, Payload) :-
    writeln('sending JSON:'),
    * json_write(current_output, Payload), nl,
    ws_send(WebSocket, Payload).

receive_json(WebSocket, Response) :-
    ws_receive(WebSocket, Response, [format(json)]),
    writeln('received JSON:'),
    * json_write(current_output, Response), nl.

jump :-
    connect(WebSocket),
    identify(WebSocket, SessionId, S),
    create_listener(WebSocket),
    main(SessionId, WebSocket, S, true).

create_listener(WebSocket) :-
    thread_create(listener(WebSocket), _, [alias(listener)]).

connect(WebSocket) :-
    gateway_url(Url),
    http_open_websocket(Url, WebSocket, []),
    heartbeat_seconds(WebSocket, HeartbeatSeconds),
    thread_create(heartbeat(HeartbeatSeconds), _, [alias(heartbeat)]).

identify(WebSocket, SessionId, S) :-
    getenv(token, Token),
    EventData = _{
        token: Token,
        compress: false,
        properties: _{
            '$os': windows,
            '$browser': adama,
            '$device': adama
        }
    },
    op(identify, IdentifyOp),
    generic_payload(IdentifyOp, EventData, Payload),
    send_json(WebSocket, Payload),
    receive_json(WebSocket, Response),
    dispatch_payload(0, D, S, "READY", Response),
    SessionId = D.session_id.

main(SessionId, WebSocket, S, LastHeartbeatAcked) :-
    thread_get_message(M),
    handle_message(M, SessionId, s(WebSocket, S, LastHeartbeatAcked), s(NewWebSocket, NewS, HeartbeatAcked)),
    main(SessionId, NewWebSocket, NewS, HeartbeatAcked).

handle_message(heartbeat, _, s(WebSocket, S, true), s(WebSocket, S, false)) :-
    writeln('handling heartbeat message'),
    op(heartbeat, Op),
    generic_payload(Op, S, Payload),
    send_json(WebSocket, Payload).
handle_message(heartbeat, SessionId, s(WebSocket,  S, false), s(NewWebSocket, S, true)) :-
    writeln('last heartbeat went unacked. Resuming...'),
    ws_close(WebSocket, 9000, ack_missed),
    kill_threads,
    connect(NewWebSocket),
    create_listener(WebSocket),
    resume(NewWebSocket, SessionId, S).
handle_message(discord(M), _, s(W,_,LastAcked), s(W,S,Acked)) :-
    dispatch_payload(Op, D, S, T, M),
    format('got discord ~p Op ~p~n', [T, Op]),
    handle_discord_message(Op, D, T, LastAcked, Acked).
handle_message(_, _, Acked, Acked) :-
    writeln('handling unknown message').

handle_discord_message(11, _, _, _, true).
handle_discord_message(0, D, T, Acked, Acked) :-
    handle_op0_event(T, D).

handle_op0_event("GUILD_CREATE", Data) :-
    Name = Data.name,
    writeln(Name).
handle_op0_event("MESSAGE_CREATE", Data) :-
    prolog_pretty_print:print_term(Data, []),
    (  Data.author.get(bot)
    -> writeln('skipping reply to bot')
    ;  reply(Data)
    ).
handle_op0_event(What, Data) :-
    writeln('Unknown Op0 Event'),
    writeln(What),
    writeln(Data).

reply(Data) :-
    format(string(URL), "https://discordapp.com/api/channels/~s/messages", [Data.channel_id]),
    getenv(token, Token),
    format(string(AuthHeader), "Bot ~s", [Token]),
    Options = [request_header(authorization=AuthHeader)],
    http_post(URL, json(_{content:Data.content}), Response, Options),
    writeln(Response).

resume(WebSocket, SessionId, S) :-
    getenv(token, Token),
    EventData = _{
        token: Token,
        session_id: SessionId,
        seq: S
    },
    op(resume, ResumeOp),
    generic_payload(ResumeOp, EventData, Payload),
    send_json(WebSocket, Payload).

kill_threads :-
    thread_send_message(heartbeat, kill),
    thread_send_message(listener, kill),
    thread_join(heartbeat),
    thread_join(listener).

generic_payload(Op, D, _{
    format: json,
    opcode: Op,
    data: _{
        op: Op,
        d: D
    }
}).

dispatch_payload(Op, D, S, T, _{
    format: json,
    opcode: _,
    data: _{
        op: Op,
        d: D,
        s: S,
        t: T
    }
}).

op(heartbeat, 1).
op(identify, 2).
op(resume, 6).

heartbeat(HeartbeatSeconds) :-
    sleep(HeartbeatSeconds),
    \+ thread_peek_message(kill),
    thread_send_message(main, heartbeat),
    heartbeat(HeartbeatSeconds).

heartbeat_seconds(WebSocket, HeartbeatSeconds) :-
    receive_json(WebSocket, Response),
    HeartbeatSeconds is Response.data.d.heartbeat_interval / 1_000.

listener(WebSocket) :-
    \+ thread_peek_message(kill),
    receive_json(WebSocket, Response),
    thread_send_message(main, discord(Response)),
    listener(WebSocket).

api_url('https://discordapp.com/api/gateway').

gateway_url(Url) :-
    api_url(Api),
    http_get(Api,
             _{url:UrlPrefix},
             [json_object(dict)]),
    string_concat(UrlPrefix, "/?v=6&encoding=json", Url).
