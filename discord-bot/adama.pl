:- set_prolog_flag(double_quotes, chars).
:- use_module(library(http/http_client)).
:- use_module(library(uri)).

:- use_module(better_bot, [jump/1, catch_report_continue/1]).
:- use_module(eliza, [eliza/2]).
:- use_module(bf, [process/2]).
:- use_module(er, [joke_er/2, joke_list/1]).
:- use_module(twitter_nitter, [twitter/2]).
:- use_module(reddit_teddit, [reddit/2]).
:- use_module(youtube_invidious, [youtube/2]).

:- dynamic apparently_is/2.
:- dynamic eliza_on/0.

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

whatever --> [].
whatever --> [_], whatever.

something([X]) --> [X].
something([X|Rest]) --> [X], something(Rest).

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

translate_to_gif(Phrase) -->
    """", something(Phrase), """".
translate_to_gif(Phrase) -->
    "\u201c", something(Phrase), "\u201d".

wc3_lookup(Unit) -->
    "[", something(Unit), "]".

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

reply(_, DowncaseWords, Reply) :-
    catch_report_continue(
        call_with_time_limit(
            5,
            bf:process(DowncaseWords, Reply)
        )
    ).
reply(_, [!,eliza,on], 'ELIZA mode ON') :-
    retractall(eliza_on),
    assert(eliza_on).
reply(_, [!,eliza,off], 'ELIZA mode OFF') :-
    retractall(eliza_on).
reply(_, [!,jokes], Reply) :-
  joke_list(Reply).

reply(Data, _DowncaseWords, Gif) :-
    string_chars(Data.content, ContentChars),
    phrase(translate_to_gif(Phrase), ContentChars),
    atomic_list_concat(Phrase, PhraseAtom),
    giphy_translate(PhraseAtom, Gif).
reply(Data, _DowncaseWords, Reply) :-
    string_chars(Data.content, ContentChars),
    twitter(ContentChars, Reply).
reply(Data, _DowncaseWords, Reply) :-
    string_chars(Data.content, ContentChars),
    reddit(ContentChars, Reply).
reply(Data, _DowncaseWords, Reply) :-
    string_chars(Data.content, ContentChars),
    youtube(ContentChars, Reply).
reply(_Data, DowncaseWords, Url) :-
    phrase(wc3_lookup(UnitWords), DowncaseWords),
    wc3_wiki(UnitWords, Url).
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
    maybe(0.05),
    Reply = 'Sometimes you gotta roll the hard six.'.
reply(_Data, DowncaseWords, Reply) :-
    bad(Bad),
    member(Bad, DowncaseWords),
    maybe(0.05),
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
reply(Data, _DowncaseWords, Reply) :-
    string_chars(Data.content, ContentChars),
    maplist(downcase_atom, ContentChars, DowncaseChars),
    joke_er(DowncaseChars, Phrase),
    atomic_list_concat(Phrase, Reply).
reply(_Data, DowncaseWords, Reply) :-
    member(interesting, DowncaseWords),
    maybe(0.25),
    Reply = 'That''s INTeresting'.

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


% % giphy_random/1 and random_gif/1 are no longer used, but I'm keeping the code for fun
% giphy_random('https://api.giphy.com/v1/gifs/random').
% random_gif(Gif) :-
%     getenv(giphy, Key),
%     giphy_random(UrlPrefix),
%     uri_query_components(QueryString, [
%         api_key=Key,
%         tag='bsg+battlestar+galactica',
%         rating='R'
%     ]),
%     atomic_list_concat([UrlPrefix, ?, QueryString], Url),
%     http_get(Url,
%              Data,
%              [status_code(Status), json_object(dict)]),
%     Status = 200,
%     Gif = Data.data.url.

giphy_translate('https://api.giphy.com/v1/gifs/translate').
giphy_translate(Words, Gif) :-
    getenv(giphy, Key),
    giphy_translate(UrlPrefix),
    uri_query_components(QueryString, [
        api_key=Key,
        s=Words
    ]),
    atomic_list_concat([UrlPrefix, ?, QueryString], Url),
    http_get(Url,
             Data,
             [status_code(Status), json_object(dict)]),
    (  Status = 200
    -> Gif = Data.data.url
    ;  Gif = 'I''m sorry, Dave. I''m afraid I can''t do that.'
    ).

wc3_wiki(UnitWords, Url) :-
    format_unit(UnitWords, Unit),
    format(atom(WikiUrl), 'https://wow.gamepedia.com/~a_(Warcraft_III)', [Unit]),
    http_head(WikiUrl, Status),
    Status = 200,
    Url = WikiUrl.

format_unit(Words, Unit) :-
    maplist(capitalize_atom, Words, CapitalizedWords),
    atomic_list_concat(CapitalizedWords, '_', Unit).

capitalize_atom(a, a).
capitalize_atom(and, and).
capitalize_atom(of, of).
capitalize_atom(the, the).
capitalize_atom(in, in).
capitalize_atom(Atom, CapitalizedAtom) :-
    atom_codes(Atom, Codes),
    capitalize(Codes, CapitalCodes),
    atom_codes(CapitalizedAtom, CapitalCodes).

capitalize([], []).
capitalize([H1|T], [H2|T]):-
  code_type(H2, to_upper(H1)).

http_head(URL, Status) :-
    http_get(URL, _, [method(head), status_code(Status)]).
