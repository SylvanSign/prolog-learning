:- module(better_bot, [jump/1]).

:- use_module(library(http/websocket)).
:- use_module(library(http/json)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).
:- use_module(library(prolog_stack)).


% TODO remove this; for debugging only
:- op(920,fy, *).
*_.

send_json(WebSocket, Payload) :-
    ws_send(WebSocket, Payload).

receive_json(WebSocket, Response) :-
    ws_receive(WebSocket, Response, [format(json)]).

jump(ReplyCallback) :-
    connect(WebSocket),
    identify(WebSocket, SessionId, S),
    create_listener(WebSocket),
    catch_with_backtrace(
        main(ReplyCallback, SessionId, WebSocket, S, true),
        Error,
        print_message(error, Error)
    ),
    kill_threads,
    !,
    jump(ReplyCallback).

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

main(ReplyCallback, SessionId, WebSocket, S, LastHeartbeatAcked) :-
    thread_get_message(M),
    handle_message(M, ReplyCallback, SessionId, s(WebSocket, S, LastHeartbeatAcked), s(NewWebSocket, NewS, HeartbeatAcked, NewSessionId)),
    !,
    main(ReplyCallback, NewSessionId, NewWebSocket, NewS, HeartbeatAcked).

handle_message(heartbeat, _, SessionId, s(WebSocket, S, true), s(WebSocket, S, false, SessionId)) :-
    * writeln('handling heartbeat message'),
    op(heartbeat, Op),
    generic_payload(Op, S, Payload),
    send_json(WebSocket, Payload).
handle_message(heartbeat, _, SessionId, s(WebSocket,  S, false), s(NewWebSocket, S, true, SessionId)) :-
    writeln('last heartbeat went unacked. Resuming...'),
    ws_close(WebSocket, 9000, ack_missed),
    kill_threads,
    connect(NewWebSocket),
    create_listener(NewWebSocket),
    resume(NewWebSocket, SessionId, S).
handle_message(close, _, _, _, s(NewWebSocket, S, true, NewSessionId)) :-
    kill_threads,
    connect(NewWebSocket),
    identify(NewWebSocket, NewSessionId, S),
    resume(NewWebSocket, NewSessionId, S).
handle_message(discord(M), ReplyCallback, SessionId, s(W,_,LastAcked), s(W,S,Acked, SessionId)) :-
    dispatch_payload(Op, D, S, T, M),
    * format('got discord ~p Op ~p~n', [T, Op]),
    handle_discord_message(Op, ReplyCallback, D, T, LastAcked, Acked).
handle_message(_, _, _, _, _) :-
    * writeln('handling unknown message').

handle_discord_message(11, _, _, _, _, true).
handle_discord_message(0, ReplyCallback, D, T, Acked, Acked) :-
    handle_op0_event(T, ReplyCallback, D).

handle_op0_event("GUILD_CREATE", _, Data) :-
    Name = Data.name,
    * writeln(Name).
handle_op0_event("MESSAGE_CREATE", ReplyCallback, Data) :-
    * prolog_pretty_print:print_term(Data, []),
    reply(ReplyCallback, Data).
handle_op0_event(What, _, Data) :-
    * writeln('Unknown Op0 Event'),
    * writeln(What),
    * writeln(Data).

reply(ReplyCallback, Data) :-
    format(string(URL), "https://discordapp.com/api/channels/~s/messages", [Data.channel_id]),
    getenv(token, Token),
    format(string(AuthHeader), "Bot ~s", [Token]),
    Options = [request_header(authorization=AuthHeader)],
    (  call(ReplyCallback, Data, Reply)
    -> http_post(URL, json(_{content:Reply}), _Response, Options)
    ).

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

catch_report_continue(Goal) :-
    catch(Goal, E, writeln(E)).

kill_threads :-
    writeln('BEGIN kill_threads'),
    kill_listener,
    kill_heartbeat,
    writeln('END kill_threads').

kill_heartbeat :-
    catch_report_continue(thread_send_message(heartbeat, kill)),
    catch_report_continue(thread_join(heartbeat, HeartbeatStatus)),
    write('heartbeat thread joined with '), write(HeartbeatStatus), nl.

kill_listener :-
    catch_report_continue(thread_send_message(listener, kill)),
    catch_report_continue(thread_join(listener, ListenerStatus)),
    write('listener thread joined with '), write(ListenerStatus), nl.

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
    writeln('BEGIN receive_json'),
    receive_json(WebSocket, Response),
    writeln('END receive_json'),
    (  Response.opcode == close
    -> thread_send_message(main, close)
    ;  thread_send_message(main, discord(Response)),
       !,
       listener(WebSocket)
    ).

api_url('https://discordapp.com/api/gateway').

gateway_url(Url) :-
    api_url(Api),
    http_get(Api,
             _{url:UrlPrefix},
             [json_object(dict)]),
    string_concat(UrlPrefix, "/?v=6&encoding=json", Url).
