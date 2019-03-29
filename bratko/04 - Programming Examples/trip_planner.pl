:- op(100, xfx, at).
:- op(50, xfx, :).

% Part of a timetable between the Notrthern towns of Lago di Garda, eg:
% Start from Riva at 8:00, land in Limone at 8:35, continue to Malcesine, land at 8:55
timetable([ riva at 8:00,  limone  at 8:35,  malcesine at 8:55                      ]).
timetable([ riva at 9:10,  torbole at 9:25,  limone    at 9:55,  malcesine at 10:15 ]).
timetable([ riva at 9:45,  torbole at 10:00, limone    at 10:30, malcesine at 10:50 ]).
timetable([ riva at 11:45, torbole at 12:00, limone    at 12:30, malcesine at 12:50 ]).
timetable([ riva at 13:10, limone  at 13:32, malcesine at 13:45                     ]).
timetable([ riva at 14:05, limone  at 14:40, malcesine at 15:00                     ]).
timetable([ riva at 15:00, limone  at 15:36, malcesine at 15:57, campione  at 16:13 ]).
timetable([ riva at 16:20, torbole at 16:35, limone    at 17:05, malcesine at 17:25 ]).

timetable([ malcesine at 9:00, limone at 9:20, tobole at 9:50, riva at 10:05 ]).
timetable([ malcesine at 10:25, limone at 10:50, tobole at 11:20, riva at 11:35 ]).
timetable([ malcesine at 11:25, limone at 11:45, riva at 12:20 ]).
timetable([ campione at 12:55, malcesine at 13:12, limone at 13:34, riva at 14:10 ]).
timetable([ malcesine at 13:45, limone at 13:59, riva at 14:20 ]).
timetable([ malcesine at 15:05, limone at 15:25, riva at 16:00 ]).
timetable([ malcesine at 16:30, limone at 16:50, tobole at 17:20, riva at 17:35 ]).
timetable([ malcesine at 18:15, limone at 18:35, tobole at 19:05, riva at 19:20 ]).
timetable([ malcesine at 19:15, limone at 19:35, tobole at 20:05, riva at 20:20 ]).
