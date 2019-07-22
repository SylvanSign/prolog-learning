:- use_module(better_bot, [jump/1]).

start :-
    jump(reply_to_message).

so_say_we_all --> [so,say,we,all], tail_punctuation.

starbuck_exchange --> whatya, [hear], target, tail_punctuation.
whatya --> [whatya].
whatya --> [whatdya].
whatya --> [what,do], ([ya] ; [you]).
target --> [] ; [starbuck] ; [adama] ; [commander] ; [admiral].

uncertainty --> [idk].
uncertainty --> [i], ([don,'\'',t] ; [dunno]).

tail_punctuation --> [] ; [!] ; [?].

% This is the heart of the bot. ie. where the NLP happens
reply_to_message(Data, Reply) :-
    \+ should_skip_reply(Data),
    Content = Data.content,
    tokenize_as_atoms(Content, Words),
    writeln(Words),
    reply(Data, Words, Reply).

reply(_Data, Words, Reply) :-
    phrase(so_say_we_all, Words),
    Reply = "SO SAY WE ALL!".
reply(_Data, Words, Reply) :-
    phrase(starbuck_exchange, Starbuck),
    prefix(Starbuck, Words),
    Reply = "Nothing but the rain.".
reply(_Data, Words, Reply) :-
    phrase(uncertainty, UncertainPhrase),
    sublist(UncertainPhrase, Words),
    Reply = "Sometimes you gotta roll the hard six.".
reply(_Data, Words, Reply) :-
    bad(Bad),
    member(Bad, Words),
    Reply = "PULL YOURSELF TOGETHER!".

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

tokenize_as_atoms(Input, Words) :-
    tokenize_atom(Input, Tokens),
    maplist(my_downcase, Tokens, Words).

my_downcase(Token, Token) :-
    number(Token),
    !.
my_downcase(Token, Word) :-
    downcase_atom(Token, Word).
