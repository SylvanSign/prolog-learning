get_sentence(Wordlist) :-
    get_code(Char),
    get_rest(Char, Wordlist).

get_rest(46, []) :- !.       % 46 is ASCII for '.'
get_rest(32, Wordlist) :- !, % 32 is ASCII for ' '
    get_sentence(Wordlist).
get_rest(Char, [Word|Wordlist]) :-
    get_chars(Char, Chars, NextChar),
    name(Word, Chars),
    get_rest(NextChar, Wordlist).

get_chars(46, [], 46) :- !.
get_chars(32, [], 32) :- !.
get_chars(Char, [Char|Chars], NextChar) :-
    get_code(Code),
    get_chars(Code, Chars, NextChar).
