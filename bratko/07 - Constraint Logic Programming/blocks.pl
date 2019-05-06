:- use_module(library(clpr)).

block(b1, dim(5.0, 3.0)).
block(b2, dim(2.0, 6.0)).
block(b3, dim(1.0, 2.4)).
block(b4, dim(1.0, 5.0)).

box(box1, dim(6.0, 6.0)).
box(box2, dim(7.0, 5.0)).
box(box3, dim(6.0, 5.0)).

rotate(rect(Pos, Dim), rect(Pos, Dim)).
rotate(rect(Pos, dim(X, Y)), rect(Pos, dim(Y, X))).

block_rectangle(BlockName, rect(Pos, Dim)) :-
    block(BlockName, Dim0),
    rotate(rect(Pos, Dim0), rect(Pos, Dim)).

inside(rect(pos(X1, Y1), dim(Dx1, Dy1)), rect(pos(X2, Y2), dim(Dx2, Dy2))) :-
    { X1>=X2,
      Y1>=Y2,
      X1+Dx1=<X2+Dx2,
      Y1+Dy1=<Y2+Dy2
    }.

no_overlap(rect(pos(X1, Y1), dim(Dx1, Dy1)), rect(pos(X2, Y2), dim(Dx2, Dy2))) :-
    { (   X1+Dx1=<X2
      ;   X2+Dx2=<X1
      ;   Y1+Dy1=<Y2
      ;   Y2+Dy2=<Y1
      )
    }.

fit(BoxName, Block1, Block2, Block3, Block4) :-
    box(BoxName, Dim),
    Box=rect(pos(0.0, 0.0), Dim),
    block_rectangle(b1, Block1),
    inside(Block1, Box),
    block_rectangle(b2, Block2),
    inside(Block2, Box),
    block_rectangle(b3, Block3),
    inside(Block3, Box),
    block_rectangle(b4, Block4),
    inside(Block4, Box),
    no_overlap(Block1, Block2),
    no_overlap(Block1, Block3),
    no_overlap(Block1, Block4),
    no_overlap(Block2, Block3),
    no_overlap(Block2, Block4),
    no_overlap(Block3, Block4).
