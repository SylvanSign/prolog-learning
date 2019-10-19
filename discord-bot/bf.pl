:- module(bf, [process/2]).
:- use_module(library(clpfd)).
:- set_prolog_flag(double_quotes, chars).

read_atomic(Atoms) :-
    read_line_to_string(user_input, Input),
    tokenize_atom(Input, Atoms).

go :-
    repeat,
    read_atomic(Program),
    (   Program = [q]
    ->  !
    ;   process(Program, Output),
        format('Output: ~a~n', [Output]),
        false
    ).

bf_command --> "```", bf, "```".

bf --> [].
bf --> command, bf.
bf --> ignored, bf.

command --> [C], { command(C) }.
command --> ['['], bf, [']'].

ignored --> [I], { \+ interpreted(I) }.

command('.').
% command(',').
command('>').
command('<').
command('+').
command('-').

interpreted(K) :- command(K).
interpreted('[').
interpreted(']').

dll([C|R], C-[]-R).
shift(C-L-[R|Rt], R-[C|L]-Rt).

cur(C, C-_-_).
update(_-L-R, C, C-L-R).

process(Program, Output) :-
    parse(Program, Parsed),
    run(Parsed, Output).

parse(In, Bf) :-
    phrase(bf_command, In),
    include(interpreted, In, Bf),
    phrase(bf, Bf).

run(Parsed, Output) :-
    dll(Parsed, P),
    length(State, 30000),
    maplist(=(0), State),
    dll(State, S),
    run(P, S, [], Output).

run(P, S, O, Output) :-
    cur(C, P),
    (   execute(C, P, NextP, S, NewS, O, NewO)
    ->  true
    ;   nl,
        writeln('CRASH'),
        false
    ),
    !,
    (   shift(NextP, NewP)
    ->  run(NewP, NewS, NewO, Output)
    ;   reverse(['`','`','`'|NewO], OutputList),
        atomic_list_concat(['`','`','`'|OutputList], Output)
    ).

execute('.', P, P, S, S, O, [Atom|O]) :-
    cur(Val, S),
    char_code(Atom, Val).
% execute(',', P, P, S, NewS, O, O) :-
%     get_code(In),
%     Val #= In mod 126,
%     update(S, Val, NewS).
execute('+', P, P, S, NewS, O, O) :-
    cur(Val, S),
    NewVal #= (Val + 1) mod 126,
    update(S, NewVal, NewS).
execute('-', P, P, S, NewS, O, O) :-
    cur(Val, S),
    NewVal #= (Val - 1) mod 126,
    update(S, NewVal, NewS).
execute('<', P, P, S, NewS, O, O) :-
    shift(NewS, S).
execute('>', P, P, S, NewS, O, O) :-
    shift(S, NewS).
execute('[', P, P, S, S, O, O) :-
    cur(C, S),
    dif(0, C).
execute('[', P, NewP, S, S, O, O) :-
    cur(0, S),
    shift(P, NextP),
    shift_to_close(NextP, NewP).
execute(']', P, NewP, S, S, O, O) :-
    cur(C, S),
    dif(0, C),
    shift(PrevP, P),
    shift_to_open(PrevP, NewP).
execute(']', P, P, S, S, O, O) :-
    cur(0, S).

shift_to_close(P, P) :-
    cur(']', P).
shift_to_close(P0, P) :-
    cur('[', P0),
    shift(P0, P1),
    shift_to_close(P1, P2),
    shift(P2, P3),
    shift_to_close(P3, P).
shift_to_close(P0, P) :-
    cur(C, P0),
    dif(C, ']'),
    dif(C, '['),
    shift(P0, P1),
    shift_to_close(P1, P).


shift_to_open(P, P) :-
    cur('[', P).
shift_to_open(P0, P) :-
    cur(']', P0),
    shift(P1, P0),
    shift_to_open(P1, P2),
    shift(P3, P2),
    shift_to_open(P3, P).
shift_to_open(P0, P) :-
    cur(C, P0),
    dif(C, '['),
    dif(C, ']'),
    shift(P1, P0),
    shift_to_open(P1, P).
