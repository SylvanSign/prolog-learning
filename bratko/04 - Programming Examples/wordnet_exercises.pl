sense_definitions(Word, SenseDefinition) :-
    s(Synset, _, Word, _, _, _),
    g(Synset, SenseDefinition).

sense_synonyms(Word, SenseSynonym) :-
    s(Syn1, _, Word, _, _, _),
    sim(Syn1, Syn2),
    s(Syn2, _, SenseSynonym, _, _, _).
