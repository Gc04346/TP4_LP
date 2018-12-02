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

%% Quinto exercício. Obter último elemento da lista.
ultimo([X|L],M) :- L = [], M is X.
ultimo([_|L],M) :- L \= [], ultimo(L,M).

%% Sexto exercício. Comparar se dois elementos são adjacentes.
%% Função para retirar elemento.
retiraprimeiro([X|L],X,L).

adjacente(X,Y,L) :- retiraprimeiro(L,A,L1), X == A, retiraprimeiro(L1,B,_), Y == B.
adjacente(X,Y,L) :- retiraprimeiro(L,A,L1), X \= A, adjacente(X,Y,L1).

%% Sétimo exercício. Gerar uma lista com elementos em uma faixa L. Inclusive
gerar(Y,Y,[Y]).
gerar(X,Y,L) :- X > Y, L is 0.
gerar(X,Y,L) :- L = [X|M], Z is X+1, gerar(Z,Y,M).

%% Oitavo exercício. Reverter uma lista. Dica: use o predicado concatenar.
%% Função para concatenar duas listas.
concatenar([], L, L).
concatenar([X|L1], L2, [X|L3]) :- concatenar(L1, L2, L3).

reverter([], []).
reverter([X|L], M) :- L = [], concatenar([], [X], M).
reverter([X|L], M) :- reverter(L, N), concatenar(N,[X],M).