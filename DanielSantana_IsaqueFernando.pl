% 1
nelementos([],0).
nelementos([_|L],Tam) :- nelementos(L,Tam1), Tam is Tam1+1.

% 2
maior([X|L],M) :- maior2(L, X, M).
maior2([],M,M).
maior2([X|L], T, M) :- X > T, maior2(L, X, M).
maior2([X|L], T, M) :- X =< T, maior2(L, T, M).

%3
media([X|L],M) :- soma(L, X, 1, M).
soma([], S, C, M) :- M is S / C.
soma([X|L], S, C, M) :- S is X+S1, C is Contador+1, soma(L, S1, Contador, M).
