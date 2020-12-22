:- module(reddit_teddit, [reddit/2]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(dcg/basics)).

reddit(MessageWithRedditLink, TedditReply) :-
  phrase(reddit_teddit(TedditReply), MessageWithRedditLink).

reddit_teddit(TedditUrl) -->
  string(StartOfMessage),
  protocol, "://", subdomain, "reddit.com", remainder(EndOfMessage),
  { format(atom(TedditUrl), '~shttps://teddit.net~s', [StartOfMessage, EndOfMessage]) }.

protocol --> "http", ("s" | "").

subdomain --> "" | "old." | "i." | "m.".
