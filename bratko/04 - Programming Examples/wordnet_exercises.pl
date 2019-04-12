% :-
%    [ './wordnet/wn_s',
%      './wordnet/wn_g',
%      './wordnet/wn_sim',
%      './wordnet/wn_hyp',
%      './wordnet/wn_mp',
%      './wordnet/wn_mm'
%    ].

sense_definitions(Word, SenseDefinition) :-
    s(Synset, _, Word, _, _, _),
    g(Synset, SenseDefinition).

sense_synonyms(Word, SenseSynonym) :-
    s(Syn1, _, Word, _, _, _),
    sim(Syn1, Syn2),
    s(Syn2, _, SenseSynonym, _, _, _).

rephrase(Sentence, Word, NewSentence) :-
    append(Prefix, [Word|Postfix], Sentence),
    s(Syn1, _, Word, _, _, _),
    sim(Syn1, Syn2),
    s(Syn2, _, SimilarWord, _, _, _),
    append(Prefix, [SimilarWord|Postfix], NewSentence).

r0(Syn1, Syn2, rel(Rel, S1, S2)) :-
    (S1 = Syn1, S2 = Syn2;
     S1 = Syn2, S2 = Syn1),
    (hyp(S1, S2), Rel=hyp;
     mm(S1, S2), Rel=mm;
     mp(S1, S2), Rel=mp).

r(W1/T1/Sen1, W2/T2/Sen2, MaxLength, WordPath) :-
    length(MaxList, MaxLength),
    append(SynPath, _, MaxList),
    s(Syn1, _, W1, T1, Sen1, _),
    s(Syn2, _, W2, T2, Sen2, _),
    s_path(Syn1, Syn2, SynPath),
    word_path(SynPath, WordPath),
    mentioned(W1/T1/Sen1, WordPath),
    mentioned(W2/T2/Sen2, WordPath).

s_path(Syn, Syn, []).
s_path(Syn1, Syn2, [Rel|L]) :-
    s_path(Syn1, Syn, L),
    r0(Syn, Syn2, Rel),
    \+ mentioned(Syn2, L).

word_path([], []).
word_path([rel(Rel, Syn1, Syn2)|SynRels], [rel(Rel, W1/T1/Sen1, W2/T2/Sen2)|WordRels]) :-
    s(Syn1, _, W1, T1, Sen1, _),
    s(Syn2, _, W2, T2, Sen2, _),
    word_path(SynRels, WordRels).

mentioned(X, L) :-
    member(Rel, L),
    (Rel = rel(_, X, _); Rel = rel(_, _, X)).
