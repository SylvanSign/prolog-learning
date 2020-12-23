:- module(er, [joke_er/2, joke_list/1]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(clpfd)).
:- use_module(library(dcg/basics)).
:- use_module(library(persistency)).

:- persistent
    joke(joke:list(atom)).

:- initialization db_attach('/var/lib/adama/jokes.pl', []).


joke_list(Reply) :-
  (  bagof(Joke, joke(Joke), RawJokes)
  -> maplist(atomic_list_concat, RawJokes, Jokes),
     atomic_list_concat([''|Jokes], '\n- ', F),
     atom_concat('I\'ve made jokes about', F, Reply)
  ;  Reply = 'I haven''t made any jokes yet...'
  ).


joke_er(Chars, Phrase) :-
  phrase(er(Trigger), Chars, Phrase),
  novel_joke(Trigger).

novel_joke(Trigger) :-
  \+ joke(Trigger),
  assert_joke(Trigger).

er(Trigger), CapitalizedTrigger, "? I hardly know her!" -->
  prefix,
  trigger(Trigger),
  ender,
  {
    capitalized(Trigger, CapitalizedTrigger)
  }.

trigger(Trigger) -->
  without_er(WithoutEr),
  er_sound(ErSound),
  {
    append(WithoutEr, ErSound, Trigger)
  }.

er_sound("er") --> string("er").
er_sound("or") --> string("or").
er_sound("ar") --> string("ar").

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

without_er([]) --> [].
without_er([C]) --> good_character(C).
without_er([C|Rest]) --> good_character(C), without_er(Rest).
