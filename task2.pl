% Task 2: Relational Data

% The line below imports the data
:- ['three.pl'].

group(X,L) :- findall(Z,student(X,Z),L).
