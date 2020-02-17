:- module(er, [joke_er/2, joke_list/1]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(clpfd)).
:- use_module(library(dcg/basics)).

:- dynamic jokes/1.

joke_list(Reply) :-
  (  bagof(Joke, jokes(Joke), RawJokes)
  -> maplist(atomic_list_concat, RawJokes, Jokes),
     atomic_list_concat([''|Jokes], '\n- ', F),
     atom_concat('I\'ve made jokes about', F, Reply)
  ;  Reply = 'I haven''t made any jokes yet...'
  ).


joke_er(Chars, Phrase) :-
  phrase(er(Trigger), Chars, Phrase),
  novel_joke(Trigger).

novel_joke(Trigger) :-
  not(jokes(Trigger)),
  asserta(jokes(Trigger)).

er(Trigger), CapitalizedWithoutEr, ErSound, "? I hardly know her!" -->
  prefix,
  without_er(WithoutEr),
  { length(WithoutEr, L), L #> 1 },
  er_sound(ErSound),
  ender,
  {
    capitalized(WithoutEr, CapitalizedWithoutEr),
    append(WithoutEr, ErSound, Trigger)
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
