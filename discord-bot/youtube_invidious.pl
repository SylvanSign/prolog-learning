:- module(youtube_invidious, [youtube/2]).

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(dcg/basics)).

youtube(MessageWithYoutubeLink, InvidiousReply) :-
  phrase(youtube_invidious(InvidiousReply), MessageWithYoutubeLink).

youtube_invidious(InvidiousUrl) -->
  string(StartOfMessage),
  protocol, "://", subdomain, domain, remainder(EndOfMessage),
  { format(atom(InvidiousUrl), '~shttps://invidious.xyz~s', [StartOfMessage, EndOfMessage]) }.

protocol --> "http", ("s" | "").

subdomain --> "" | "m." | "www.".

domain --> "youtube.com" | "youtu.be".
