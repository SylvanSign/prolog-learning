read_atomic(Atoms) :-
    read_line_to_string(user_input, Input),
    tokenize_atom(Input, Atoms).

go :-
    repeat,
    read_atomic(Program),
    (   Program = [q]
    ->  !
    ;   process(Program),
        false
    ).

bf --> [].
bf --> (command | ignored), bf.

command --> [C], { command(C) }.
command --> ['['], bf, [']'].

ignored --> [I], { \+ interpreted(I) }.

command('.').
command(',').
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

process(Program) :-
    parse(Program, Parsed),
    run(Parsed).

parse(In, Bf) :-
    include(interpreted, In, Bf),
    phrase(bf, Bf).

run(Parsed) :-
    dll(Parsed, P),
    length(State, 30000),
    maplist(=(0), State),
    dll(State, S),
    run(P, S).

run(P, S) :-
    cur(C, P),
    (   execute(C, P, NextP, S, NewS)
    ->  true
    ;   nl,
        writeln('CRASH'),
        false
    ),
    !,
    (   shift(NextP, NewP)
    ->  run(NewP, NewS)
    ;   nl
    ).

execute('.', P, P, S, S) :-
    cur(Val, S),
    put_code(Val).
execute(',', P, P, S, NewS) :-
    get_code(In),
    Val #= In mod 126,
    update(S, Val, NewS).
execute(+, P, P, S, NewS) :-
    cur(Val, S),
    NewVal #= (Val + 1) mod 126,
    update(S, NewVal, NewS).
execute(-, P, P, S, NewS) :-
    cur(Val, S),
    NewVal #= (Val - 1) mod 126,
    update(S, NewVal, NewS).
execute(<, P, P, S, NewS) :-
    shift(NewS, S).
execute(>, P, P, S, NewS) :-
    shift(S, NewS).
execute('[', P, P, S, S) :-
    cur(C, S),
    dif(0, C).
execute('[', P, NewP, S, S) :-
    cur(0, S),
    shift(P, NextP),
    shift_to_close(NextP, NewP).
execute(']', P, NewP, S, S) :-
    cur(C, S),
    dif(0, C),
    shift(PrevP, P),
    shift_to_open(PrevP, NewP).
execute(']', P, P, S, S) :-
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
