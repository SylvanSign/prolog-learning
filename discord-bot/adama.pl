:- use_module(better_bot, [jump/1]).

start :-
    jump(reply_to_message).

adama --> [so,say,we,all], ([!] ; []).

% This is the heart of the bot. ie. where the NLP happens
reply_to_message(Data, Reply) :-
    \+ should_skip_reply(Data),
    Content = Data.content,
    tokenize_as_atoms(Content, Words),
    writeln(Words),
    phrase(adama, Words),
    Reply = "SO SAY WE ALL!".

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
