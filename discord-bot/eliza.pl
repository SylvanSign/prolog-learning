:- module(eliza, [eliza/2]).

eliza(DowncaseWords, Response) :-
    process(DowncaseWords, Response).

process(In, Out) :-
    once(phrase(utterance(Out), In)).

utterance(Utterance) -->
    [i,am,not], whatever(Whatever),
    { phrase(why_not(Whatever), Utterance) }.
utterance(Utterance) -->
    [i,am], whatever(Whatever),
    { phrase(how_long(Whatever), Utterance) }.
utterance(Utterance) -->
    [i,like], whatever(Whatever),
    { phrase(why_like(Whatever), Utterance) }.
utterance(Utterance) -->
    whatever(_), [i,remember], whatever(Whatever),
    { phrase(do_often_think(Whatever), Utterance) }.
utterance(Utterance) -->
    whatever(_), [X], whatever(_),
    {   important(X),
        phrase(tell_me_more(X), Utterance)
    }.
utterance(['Why',so,negative,?]) -->
    [no].
utterance(['Tell',me,more,.]) -->
    [_].
utterance(['Please',go,on,.]) -->
    whatever(_).

why_not(Whatever) -->
    ['Why','aren''t',you], whatever(Whatever), [?].

how_long(Whatever) -->
    ['How',long,have,you,been], whatever(Whatever), [?].

why_like(Whatever) -->
    ['Why',do,you,like], whatever(Whatever), [?].

do_often_think(Whatever) -->
    ['Do',you,often,think,of], whatever(Whatever), [?].

tell_me_more(X) -->
    ['Please',tell,me,more,about,your,X,.].

important(father).
important(mother).
important(brother).
important(sister).

whatever([]) --> [].
whatever([First|Rest]) --> [First], whatever(Rest).
