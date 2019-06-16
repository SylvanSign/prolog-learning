:- (dynamic alive/0).
:- use_module(library(http/websocket)).
:- use_module(library(http/json)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).


gateway_url(URL) :-
    http_get('https://discordapp.com/api/gateway',
             _{url:URL},
             [json_object(dict)]).

connect(Data) :-
    gateway_url(GatewayURL),
    string_concat(GatewayURL, "/?v=6&encoding=json", WebsocketURL),
    http_open_websocket(WebsocketURL, WS, []),
    ws_receive(WS, Data, [format(json)]).

heartbeat :-
    assert(alive),
    thread_create(pulse, _).

kill :-
    retract(alive).

pulse :-
    alive,
    writeln(ping),
    sleep(10),
    pulse.
