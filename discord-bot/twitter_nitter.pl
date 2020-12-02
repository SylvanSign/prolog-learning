:- module(twitter_nitter, [twitter/2]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(dcg/basics)).

twitter(MessageWithTwitterLink, NitterReply) :-
  phrase(twitter_nitter(NitterReply), MessageWithTwitterLink).

twitter_nitter(NitterUrl) -->
  string(_StartOfMessage),
  protocol, "://", subdomain, "twitter.com", string_without(" ", RestOfUrl),
  remainder(_RestOfMessage),
  { format(atom(NitterUrl), 'https://nitter.net~s', [RestOfUrl]) }.

protocol --> "http", ("s" | "").

subdomain --> "" | "mobile.".
