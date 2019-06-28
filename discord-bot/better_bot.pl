:- use_module(library(http/websocket)).
:- use_module(library(http/json)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).

% TODO remove this; for debugging only
:- op(920,fy, *).
*_.

send_json(WebSocket, Payload) :-
    writeln('sending JSON:'),
    json_write(current_output, Payload), nl,
    ws_send(WebSocket, Payload).

receive_json(WebSocket, Response) :-
    ws_receive(WebSocket, Response, [format(json)]),
    writeln('received JSON:'),
    json_write(current_output, Response), nl.

jump :-
    gateway_url(Url),
    http_open_websocket(Url, WebSocket, []),
    heartbeat_seconds(WebSocket, HeartbeatSeconds),
    thread_create(heartbeat(HeartbeatSeconds), _HeartbeatId),
    % thread_create(listener(WebSocket), _ListenerId),
    identify(WebSocket, SessionId),
    main(WebSocket, null).

identify(WebSocket, SessionId) :-
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
    dispatch_payload(Op, D, S, T, Response),
    SessionId = D.session_id.

main(WebSocket, S) :-
    thread_get_message(M),
    handle_message(M, WebSocket, S, NewS),
    main(WebSocket, NewS).

handle_message(heartbeat, WebSocket, S, NewS) :-
    writeln('handling heartbeat message'),
    op(heartbeat, Op),
    generic_payload(Op, S, Payload),
    send_json(WebSocket, Payload),
    NewS = S.

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

heartbeat(HeartbeatSeconds) :-
    sleep(HeartbeatSeconds),
    thread_send_message(main, heartbeat).

heartbeat_seconds(WebSocket, HeartbeatSeconds) :-
    receive_json(WebSocket, Response),
    HeartbeatSeconds is Response.data.d.heartbeat_interval / 1_000.

% listener(WebSocket) :-
%     Seconds = 10,
%     thread_send_message(main, msg('tester')),
%     sleep(Seconds),
%     listener.

api_url('https://discordapp.com/api/gateway').

gateway_url(Url) :-
    api_url(Api),
    http_get(Api,
             _{url:UrlPrefix},
             [json_object(dict)]),
    string_concat(UrlPrefix, "/?v=6&encoding=json", Url).


ready(websocket{data:_13924{d:_13884{'_trace':["[\"gateway-prd-main-xjp2\",{\"micros\":23137,\"calls\":[\"discord-sessions-prd-1-21\",{\"micros\":20264,\"calls\":[\"start_session\",{\"micros\":18451,\"calls\":[\"api-prd-main-cv2r\",{\"micros\":15670,\"calls\":[\"get_user\",{\"micros\":1569},\"add_authorized_ip\",{\"micros\":5},\"get_guilds\",{\"micros\":1923},\"coros_wait\",{\"micros\":2}]}]},\"guilds_connect\",{\"micros\":2,\"calls\":[]},\"presence_connect\",{\"micros\":711,\"calls\":[]}]}]}]"],guilds:[_13802{id:"407066821460754433",unavailable:true},_13844{id:"418568366106869770",unavailable:true}],presences:[],private_channels:[],relationships:[],session_id:"a41e5869b307656e5d699a84d6b2b1e0",user:_13636{avatar:"5fbff694a7e54a13a8d7d4a05c93325f",bot:true,discriminator:"4507",email:null,id:"589543207377829901",mfa_enabled:false,username:"Adama",verified:true},user_settings:_13524{},v:6},op:0,s:1,t:"READY"},format:json,opcode:text}).
