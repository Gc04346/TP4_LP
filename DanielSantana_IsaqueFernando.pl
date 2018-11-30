% Primeiro exercício. Numero de elementos na lista.
nelementos([],0).
nelementos([_|L],Tam) :- nelementos(L,Tam1), Tam is Tam1+1.

% Segundo exercício. Maior elemento da lista.
maior([X|L],M) :- maior2(L, X, M).
maior2([],M,M).
maior2([X|L], T, M) :- X > T, maior2(L, X, M).
maior2([X|L], T, M) :- X =< T, maior2(L, T, M).

%% Terceiro exercicio. Media de dois números.
%% Função para obter o tamanho de uma lista.
tamLista([],0).
tamLista([_|L],S) :- tamLista(L,N), S is N+1.

%% Soma dos elementos da lista
somaElementos([], 0).
somaElementos([X|L], S) :- somaElementos(L, M), S is M+X.

%% Media de ums lista.
media(X,M) :- tamLista(X,N), somaElementos(X,Y), M is Y/N. 

%% Quarto exercicio. Inserir elemento no final da lista
%% Quarto exercício. Inserir elemento no final da lista.
inserirfim(Y, [], [Y]).
inserirfim(Y,[X|L], M) :- inserirfim(Y,L,W), M = [X|W].