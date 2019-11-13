:- use_module(library(yall)).

upgrades(B, U) :-
    lookup(B, BT),
    tile_upgrade(BT, UT),
    lookup(U, UT).

lookup(Id, Tile) :-
    Tile=tile(Id, _, _, _),
    Tile.

tile(1, yellow, double_town-10, [town([0, 2]), town([3, 5])]).
tile(2, yellow, double_town-10, [town([0, 3]), town([1, 2])]).
tile(3, yellow, town-10, [town([0, 1])]).
tile(4, yellow, town-10, [town([0, 3])]).
tile(7, yellow, plain-0, [plain(0, 1)]).
tile(8, yellow, plain-0, [plain(0, 2)]).
tile(9, yellow, plain-0, [plain(0, 3)]).
tile(55, yellow, double_town-10, [town([0, 3]), town([2, 5])]).
tile(56, yellow, double_town-10, [town([0, 2]), town([1, 3])]).
tile(57, yellow, city-20, [city([0, 3])]).
tile(58, yellow, town-10, [town([0, 2])]).
tile(69, yellow, double_town-10, [town([0, 2]), town([1, 4])]).

tile(14, green, city-30, [city([0, 2, 3, 5])]).
tile(15, green, city-30, [city([0, 1, 2, 3])]).
tile(16, green, plain-0, [plain(0, 2), plain(1, 3)]).
tile(18, green, plain-0, [plain(0, 3), plain(1, 2)]).
tile(19, green, plain-0, [plain(0, 2), plain(1, 4)]).
tile(20, green, plain-0, [plain(0, 3), plain(2, 5)]).

tile_upgrade(B, U) :-
    B=tile(_, BColor, Type-_, BTrack),
    U=tile(_, UColor, Type-_, UTrack),
    B,
    U,
    color_upgrade(BColor, UColor),
    track_upgrade(Type, BTrack, UTrack).

color_upgrade(yellow, green).
color_upgrade(green, brown).
color_upgrade(brown, grey).


track_upgrade(plain-0, B, U) :-
    station_upgrade(B, U).

track_upgrade(Type, B, U) :-
    dif(Type, plain),
    permutation(B, BPerm),
    station_track_upgrade(BPerm, U).

station_track_upgrade([], []).
station_track_upgrade([B|BT], [U|UT]) :-
    B=..[_, Bs],
    U=..[_, Us],
    station_upgrade(Bs, Us),
    station_track_upgrade(BT, UT).

station_upgrade([], _).
station_upgrade([H|T], U) :-
    member(H, U),
    station_upgrade(T, U).
