% :- set_prolog_flag(double_quotes, chars).
:- use_module(better_bot, [jump/1]).
:- use_module(eliza, [eliza/2]).

:- dynamic apparently_is/2.
:- dynamic eliza_on/0.

% TODO remove these; for debugging only
:- debug.
:- op(920,fy, *).
*_.

:- debug(websocket).

start :-
    jump(reply_to_message).

are_you_alive --> [are,you,alive,?].

so_say_we_all --> [so,say,we,all], tail_punctuation.

starbuck_exchange --> whatya, [hear], target, tail_punctuation.
whatya --> [whatya].
whatya --> [whatdya].
whatya --> [what,do], ([ya] | [you]).
target --> [] | [starbuck] | [adama] | [commander] | [admiral].

uncertainty --> [idk].
uncertainty --> [i], ([don,'\'',t] | [dunno]).

tail_punctuation --> [] | [!] | [?].

learn_apparently_is -->
    starter, ([] | [,]), [X,is,Y], finisher, [.],
    { remember(apparently_is(X, Y)) }.

starter --> [].
starter --> [also].
starter --> [and].

finisher --> [].
finisher --> [also].
finisher --> [as,well].
finisher --> [,], finisher.

query_apparently_is(X) -->
    [what,is,X,?].

teach_apparently_is(X, AllThings) -->
    {
        list_things(AllThings, ThingsList)
    },
    [X,is|ThingsList].

list_things_first_pass([Only], [OnlyWithPeriod]) :-
    atomic_concat(Only, '.', OnlyWithPeriod).
list_things_first_pass([First,Last], [First,and,LastWithPeriod]) :-
    atomic_concat(Last, '.', LastWithPeriod).

list_things(AllThings, ListThings) :-
    list_things_first_pass(AllThings, ListThings),
    !.
list_things(AllThings, ListThings) :-
    list_things_second_pass(AllThings, ListThings).

list_things_second_pass([], []).
list_things_second_pass([Last], [and,LastWithPeriod]) :-
    !,
    atomic_concat(Last, '.', LastWithPeriod).
list_things_second_pass([T|Rest], [First|RestList]) :-
    atomic_concat(T, ',', First),
    list_things_second_pass(Rest, RestList).

remember(X) :-
    retractall(X),
    assert(X).

% This is the heart of the bot. ie. where the NLP happens
reply_to_message(Data, Reply) :-
    \+ should_skip_reply(Data),
    Content = Data.content,
    tokenize_as_atoms_downcase(Content, DowncaseWords),
    writeln(DowncaseWords),
    reply(Data, DowncaseWords, Reply).

reply(_Data, [!,eliza,on], 'ELIZA mode ON') :-
    retractall(eliza_on),
    assert(eliza_on).
reply(_Data, [!,eliza,off], 'ELIZA mode OFF') :-
    retractall(eliza_on).
reply(_Data, DowncaseWords, Reply) :-
    eliza_on,
    eliza(DowncaseWords, ReplyWords),
    atomic_list_concat(ReplyWords, ' ', Reply).
reply(_Data, DowncaseWords, Reply) :-
    phrase(so_say_we_all, DowncaseWords),
    Reply = 'SO SAY WE ALL!'.
reply(_Data, DowncaseWords, Reply) :-
    phrase(are_you_alive, DowncaseWords),
    Reply = 'Yes.'.
reply(_Data, DowncaseWords, Reply) :-
    phrase(starbuck_exchange, Starbuck),
    prefix(Starbuck, DowncaseWords),
    Reply = 'Nothing but the rain.'.
reply(_Data, DowncaseWords, Reply) :-
    phrase(uncertainty, UncertainPhrase),
    sublist(UncertainPhrase, DowncaseWords),
    Reply = 'Sometimes you gotta roll the hard six.'.
reply(_Data, DowncaseWords, Reply) :-
    bad(Bad),
    member(Bad, DowncaseWords),
    Reply = 'PULL YOURSELF TOGETHER!'.
reply(_Data, DowncaseWords, Reply) :-
    phrase(query_apparently_is(Subject), DowncaseWords),
    (   bagof(What, apparently_is(Subject, What), AllThings)
    ->  phrase(teach_apparently_is(Subject, AllThings), ReplyWords),
        atomic_list_concat(ReplyWords, ' ', Reply)
    ;   Reply = 'I wish I knew...'
    ).
reply(_Data, DowncaseWords, Reply) :-
    phrase(learn_apparently_is, DowncaseWords),
    Reply = 'Thank you. I now understand the lore better.'.

bad(sorry).
bad(inted).
bad(inting).
bad(woops).
bad(anime).
bad(yikes).

sublist(S,L) :-
    append(_,L2,L),
    append(S,_,L2).

% This prevents bot from ruining other people's experience ;)
should_skip_reply(Data) :-
    Data.author.get(bot).

tokenize_as_atoms_downcase(Input, DowncaseWords) :-
    tokenize_atom(Input, OriginalWords),
    maplist(my_downcase, OriginalWords, DowncaseWords).

my_downcase(Token, Token) :-
    number(Token),
    !.
my_downcase(Token, Word) :-
    downcase_atom(Token, Word).
