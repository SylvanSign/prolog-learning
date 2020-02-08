:- module(er, [er//0]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(clpfd)).
:- use_module(library(dcg/basics)).

er, CapitalizedWithoutEr, "er? I hardly know her!" -->
  prefix,
  without_er(WithoutEr),
  { length(WithoutEr, L), L #> 0, dif(WithoutEr, "her") },
  string("er"),
  ender,
  {
    capitalized(WithoutEr, CapitalizedWithoutEr)
  }.

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

prefix --> nonblanks(_), blank, prefix.
prefix --> [].

without_er([C]) --> nonblank(C).
without_er([C|Rest]) --> nonblank(C), without_er(Rest).

reply(In) :-
  once(phrase(er, In, Rest)),
  atom_chars(A, Rest),
  writeln(A).