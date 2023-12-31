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

%Замена всех элементов списка с указанным значением на другое значение

replace(_, _, [], []). 

replace(Old, New, [Old|T], [New|T1]) :- 
    replace(Old, New, T, T1).

replace(Old, New, [H|T], [H|T1]) :- 
    H \= Old,
    replace(Old, New, T, T1).

%Стандартные предикаты
replace(_, _, [], []). 

replace(Old, New, [Old|T], Y) :-  
    replace(Old, New, T, T1),    
    append([New], T1, Y).
 
replace(Old, New, [H|T], Y) :-     
    H \= Old,
    replace(Old, New, T, T1),   
    append([H], T1, Y).


%Разделение списка на два по порядковому принципу (первый-второй)

split_list([], [], []).
split_list([X], [X], []).
split_list([X, Y|T], [X|T1], [Y|T2]) :- 
    split_list(T, T1, T2).

%Стандартные предикаты

split_list([], [], []).
split_list([X], [X], []).
split_list([X, Y|[]], [X], [Y]).
split_list([X, Y|T], L1, L2) :- 
    split_list(T, T1, T2),
    append([X], T1, L1),
    append([Y], T2, L2).

%Совместное использование
%Разделение списка на два новых и обмен между ними элементами равными значениям первого в каждом списке

sharing(L, R1, R2) :-
    split_list(L, [H1|T1], [H2|T2]),
    replace(H1, H2, [H1|T1], R1),
    replace(H2, H1, [H2|T2], R2).
