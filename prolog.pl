member(X,[X|T]).
member(X,[H|T]):- member(X,T).

a2b([],[]).
a2b([a|L1],[b|L2]):- a2b(L1,L2).

addThreeAndDouble(X, Y):-
Y is (X+3) * 2.

len([],0).
len([_|L],N):-
len(L,X),
N is X + 1.


accMax([H|T],A,Max):-
H > A,
accMax(T,H,Max).
accMax([H|T],A,Max):-
H =< A,
accMax(T,A,Max).
accMax([],A,A).

append([ ], L, L).
append([H|L1], L2, [H|L3]):-
append(L1, L2, L3).

prefix(P,L):-
append(P,_,L).

suffix(S,L):-
append(_,S,L).

sublist(Sub,List):-
suffix(Suffix,List),
prefix(Sub,Suffix).

naiveReverse([],[]).
naiveReverse([H|T],R):-
naiveReverse(T,RT),
append(RT,[H],R).

accReverse([ ],L,L).
accReverse([H|T],Acc,Rev):-
accReverse(T,[H|Acc],Rev).

reverse(L1,L2):-
accReverse(L1,[ ],L2).

myst([],[]).
myst([X],[]).
myst([F,S|T],R):- myst(T, Temp),
R = [F | Temp ].

ss(X,Y,R) :- R is X*X + Y*Y.

letterGrade(X,Y) :- X =< 50, char_code(Y,67).
letterGrade(X,Y) :- X =< 85, X > 50, char_code(Y,66).
letterGrade(X,Y) :- X > 85, char_code(Y,65).

add([], A, A).
add([F|R], A, Res):- NewA is A+F,
add(R, NewA, Res).

counthowmany(_, [], 0).
counthowmany(S, [S|T], C) :- counthowmany(S, T, C1), C is C1+1.
counthowmany(S, [_|T], C) :- counthowmany(S, T, C).

reversePairs([],[]).
reversePairs([X,Y|T], [Y,X|RT]) :- reversePairs(T, RT).

split([],_,[],[]).
split(X,0,[],X).
split([H|T],N,[H|X],Z) :- N > 0, M is N - 1, split(T,M,X,Z).

min(X,Y,Min) :- X < Y, Min = X.
min(X,Y,Min) :- Min = Y.
max(X,Y,Max) :- X > Y, Max = X.
max(X,Y,Max) :- Max = Y.
minMax([],[],[]).
minMax([X],X,X).
minMax([X,Y|List],Max,Min) :- min(X,Y,Min1), minMax([Min1|List],_,Min), max(X,Y,Max1), minMax([Max1|List],Max,_).
              
vector_add([],[],[]).
vector_add([X|T],[Y|T1],[Z|R]) :- vector_add(T, T1, R), Z is X + Y.