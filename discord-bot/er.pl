:- module(er, [er//0]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(clpfd)).
:- use_module(library(dcg/basics)).

er, CapitalizedWithoutEr, ErSound, "? I hardly know her!" -->
  prefix,
  without_er(WithoutEr),
  { length(WithoutEr, L), L #> 1 },
  er_sound(ErSound),
  ender,
  {
    capitalized(WithoutEr, CapitalizedWithoutEr)
  }.

er_sound("er") --> string("er").
er_sound("or") --> string("or").

capitalized(String, Capitalized) :-
  String = [First|Rest],
  upcase_atom(First, UpFirst),
  Capitalized = [UpFirst|Rest].

ender -->
  [C],
  !,
  { char_code(C, Code),
    (
      Code #< 65
    ; Code #> 122
    )
  },
  remainder(_).
ender --> "".

good_character(C) -->
  [C],
  { char_code(C, Code),
    Code #>= 65,
    Code #=< 122
  }.

prefix --> nonblanks(_), blank, prefix.
prefix --> [].

without_er([C]) --> good_character(C).
without_er([C|Rest]) --> good_character(C), without_er(Rest).

reply(In) :-
  once(phrase(er, In, Rest)),
  atom_chars(A, Rest),
  writeln(A).
