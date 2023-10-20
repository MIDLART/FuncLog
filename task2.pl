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

%Для каждого предмета, найти количество не сдавших студентов

list([grade(Sub,2)|_],Sub).
list([_|T],Sub):-
    list(T,Sub).

not_passed_subject(Subject,Count):- 
    subject(Abb,Subject),
    findall(Marks,(student(_,_,Marks),list(Marks,Abb)),All_marks),
    length(All_marks,Count).

%Для каждой группы, найти студента (студентов) с максимальным средним баллом

max_average_students(Group, Students) :-
    findall(Average-Student, (student(Group, Student, _), average_mark(Student, Average)), StudentAverages),
    max_member(MaxAverage-_, StudentAverages),
    findall(Student, member(MaxAverage-Student, StudentAverages), Students).
