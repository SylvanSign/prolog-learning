:- dynamic alive/0.
:- use_module(library(http/websocket)).
:- use_module(library(http/json)).

connect :-
  http_open_websocket('wss://gateway.discord.gg/?v=6&encoding=json', WS, []),
  ws_receive(WS, Reply),
  json_read(WS, Term).

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
