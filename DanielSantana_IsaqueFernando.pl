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

%% Nono exercício. Incrementar em uma unidade cada elemento de uma lista de inteiros.
incrementar([], []).
incrementar([X|L], M) :- incrementar(L, N), Y is X+1, M = [Y|N].

%% Décimo exercício. Linearizar uma lista de inteiros. Dica: use o predicado concatenar.
%% Função para concatenar uma lista.
concatenar([], L, L).
concatenar([X|L1], L2, [X|L3]) :- concatenar(L1, L2, L3).

linearizar([], []).
linearizar([X|L], M) :- L = [], concatenar(X,L,M).
linearizar([X|L], M) :- L \= [], linearizar(L, N), concatenar(X,N,M).

%% Décimo primeiro exercício. Anexar uma lista em outra.
anexar(L,X,M) :- concatenar(L,X,M).

%% Décimo segundo exercício. Remover de uma lista um elemento (todas as suas ocorrências)
remover(_, [], []).
remover(M, [X|L], N) :- X == M, remover(M, L, Z), N = Z.
remover(M, [X|L], N) :- X \= M, remover(M, L, Z), N = [X|Z].

%% Décimo terceiro exercício. Rotacionar uma lista uma posição.
rotacionar([], []).
rotacionar([X|L], M) :- concatenar(L, [X], M). 

%% Décimo quarto exercício. Rotacionar uma lista n posições.
rotacionar(0, L, L).
rotacionar(_, [], []).
rotacionar(M, [X|L], N) :- concatenar(L, [X], P), Q is M-1, rotacionar(Q, P, N). 

%% Décimo quinto exercício. Ordenar uma lista de inteiros.
%% Função para retirar elementos.
retira([], [], []).
retira([X|L], X, L).

ordenar([], []).
ordenar(L, M) :- retira(L, A, B), retira(B, C, D), C = [], M = [A].
ordenar(L, M) :- retira(L, A, B), retira(B, C, D), D = [], A > C, M = [C|A].
ordenar(L, M) :- retira(L, A, B), retira(B, C, D), D = [], A <= C, M = [A|C].

%% Décimo quinto exercício. Ordenar uma lista de Elementos.
ordena([]).
ordena([_]).
ordena([X,Y|L]) :- X =< Y, ordena([Y|L]). % Confere se uma lista está ordenada crescente.

% Das listas permutadas ele procura a permutação que os elementos estão em ordem crescente.
% Quando há o casamento dos padrões há o retorno da lista L que satisfaz as duas condições.
ordenar(A,L) :- permutation(A, L), ordena(L).