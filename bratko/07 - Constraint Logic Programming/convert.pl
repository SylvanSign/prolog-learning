:- use_module(library(clpr)).

convert(C, F) :-
    { C=(F-32)*5/9
    }.

/*
  {Ta=<0,
  Ta+2=<Tb,
  Ta+2=<Tc,
  Tb+3=<Td,
  Tc+5=<Tf,
  Td+4=<Tf},
minimize(Tf).
*/
