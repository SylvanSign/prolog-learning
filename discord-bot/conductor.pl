:- set_prolog_flag(double_quotes, chars).

:- use_module(better_bot, [jump/1]).
:- use_module(train_jargon, [random_train_definition/2]).

start :-
    jump(reply_to_message).

train_talk --> [train] | [trains].

train_talk_reply -->
      "I ", ("_really_ " | ""), "like trains"
    | "Do you guys not have trains?"
    | "I'm down for trains"
    | "My trains are a bit rusty"
    | "Are we train boys?"
    | "https://youtu.be/y7h4OtFDnYE" % trains on track
    | "I always order my lattes with extra foam"
    | "CHOO CHOO!".

at_foamer --> "<,@", extra, id, ">".
extra --> "" | "!" | "&".
id --> [635274576904978442] | [635303518361616384].

random_phrase(Grammar, Phrase) :-
    bagof(P, phrase(Grammar, P), Phrases),
    random_member(PhraseAtomList, Phrases),
    atomic_list_concat(PhraseAtomList, Phrase).

train_slang(Reply) :-
    random_train_definition(Phrase, Definition),
    format(atom(Reply), '> ~a:~n> ~a', [Phrase, Definition]).

% This is the heart of the bot. ie. where the NLP happens
reply_to_message(Data, Reply) :-
    \+ should_skip_reply(Data),
    Content = Data.content,
    tokenize_as_atoms_downcase(Content, DowncaseWords),
    writeln(DowncaseWords),
    reply(DowncaseWords, Reply).

reply(DowncaseWords, Reply) :-
    phrase(train_talk, TrainTalk),
    sublist(TrainTalk, DowncaseWords),
    maybe(0.2),
    random_phrase(train_talk_reply, Reply).
reply(DowncaseWords, Reply) :-
    phrase(at_foamer, AtFoamer),
    sublist(AtFoamer, DowncaseWords),
    train_slang(Reply).

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

sublist(S,L) :-
    append(_,L2,L),
    append(S,_,L2).
