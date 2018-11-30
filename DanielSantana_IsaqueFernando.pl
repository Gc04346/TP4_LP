% 1
nelementos([],0).
nelementos([_|L],Tam) :- nelementos(L,Tam1), Tam is Tam1+1.

% 2
maior([X|L],M) :- maior2(L, X, M).
maior2([],M,M).
maior2([X|L], T, M) :- X > T, maior2(L, X, M).
maior2([X|L], T, M) :- X =< T, maior2(L, T, M).

%% Terceiro exercicio. Media de dois números.
media([X|L],M) :- soma(L, X, 1, M).
soma([], S, C, M) :- M is S / C.
soma([X|L], S, C, M) :- S is X+S1, C is Contador+1, soma(L, S1, Contador, M).

%% Quarto exercicio. Inserir elemento no final da lista
%% Função para obter o tamanho de uma lista.
tamLista([],0).
tamLista([_|L],S) :- tamLista(L,N), S is N+1.

%% Soma dos elementos da lista
somaElementos([], 0).
somaElementos([X|L], S) :- somaElementos(L, M), S is M+X.

%% Media de ums lista.
media(X,M) :- tamLista(X,N), somaElementos(X,Y), M is Y/N. 
