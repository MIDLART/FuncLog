% Первая часть задания - предикаты работы со списками

my_length([],0).
my_length([_|T], L) :-
  my_length(T, L1),
  L is L1 + 1.

my_member(X,[X|_]).
my_member(X,[_|T]) :-
  my_member(X,T).

my_append([],L,L).
my_append([H|T],L,[H|R]) :-
  my_append(T,L,R).

my_remove(X,[X|T],T).
my_remove(X,[H|T],[H|Y]) :-
  my_remove(X,T,Y).

my_permute([],[]).
my_permute(X,[H|T1]) :-
  my_remove(H,X,T),
  my_permute(T,T1).

my_sublist(S,R) :-
  my_append(X,_,S),
  my_append(_,R,X).

