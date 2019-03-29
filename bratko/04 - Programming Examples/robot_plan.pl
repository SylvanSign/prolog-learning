% State of the robot's world = state(RobotLocation, BasketLocation, RubbishLocation)
% action(State, Action, NewState): Action in State produces NewState
% We assume robot never drops rubbish to floor and never pushes rubbish
% R = RobotPos, B = BasketPos, T = Together (Robot & Basket same pos)
action(state(R, B, floor(R)), pickup, state(R, B, held)).
action(state(P, P, held), drop, state(P, P, in_basket)).
action(state(T, T, Loc), push(T, NewT), state(NewT, NewT, Loc)).
action(state(R, B, Loc), go(R, NewR), state(NewR, B, Loc)).

plan(State, State, []).

plan(State1, GoalState, [Action1|RestOfPlan]) :-
    action(State1, Action1, State2),
    plan(State2, GoalState, RestOfPlan).

list([]).
list([_|T]) :-
    list(T).
