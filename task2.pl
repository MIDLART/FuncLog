% Task 2: Relational Data

% The line below imports the data
:- ['three.pl'].

sum([],0). 
sum([grade(_,Mark)|T],Sum):-
    sum(T,Sum1), 
    Sum is Sum1 + Mark.

%Для каждого студента, найти средний балл, и сдал ли он экзамены или нет

%Средний балл

average_mark(Student, Average):-
    student(_,Student,Marks),
    sum(Marks,Sum),
    length(Marks,Len),
    Average is Sum/Len.

%Сдал ли экзамены

passed(Student):-
    student(_,Student,Marks),
    not(member(grade(_,2),Marks)).
