:- module(twitter_nitter, [twitter/2]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(dcg/basics)).

twitter(MessageWithTwitterLink, NitterReply) :-
  phrase(twitter_nitter(NitterReply), MessageWithTwitterLink).

twitter_nitter(NitterUrl) -->
  string(StartOfMessage),
  protocol, "://", subdomain, "twitter.com", remainder(EndOfMessage),
  { format(atom(NitterUrl), '~shttps://nitter.net~s', [StartOfMessage, EndOfMessage]) }.

protocol --> "http", ("s" | "").

subdomain --> "" | "mobile.".
