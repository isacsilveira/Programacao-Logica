% PREDICADO lsort

% Calcula o tamanho de uma lista

tamanho([],0).

tamanho([_|T],N) :-
    tamanho(T,N1),
    N is N1 + 1.


% Associa uma lista ao seu tamanho

associa_tamanho(L, Tam-L) :-
    tamanho(L,Tam).


% Converte todas as sublistas para Tam-Lista

cria_pares([],[]).

cria_pares([H|T],[Par|R]) :-
    associa_tamanho(H,Par),
    cria_pares(T,R).


% Remove os tamanhos após a ordenação

remove_tamanhos([],[]).

remove_tamanhos([_-Lista|T],[Lista|R]) :-
    remove_tamanhos(T,R).


% Predicado principal

lsort(InList,OutList) :-
    cria_pares(InList,Pares),
    keysort(Pares,Ordenados),
    remove_tamanhos(Ordenados,OutList).



%PREDICADO lfsort

% Conta quantas vezes um elemento aparece

conta(_, [], 0).

conta(X,[X|T],N) :-
    conta(X,T,N1),
    N is N1 + 1.

conta(X,[Y|T],N) :-
    X \= Y,
    conta(X,T,N).


% Obtém os tamanhos das sublistas

lista_tamanhos([],[]).

lista_tamanhos([L|T],[Tam|R]) :-
    tamanho(L,Tam),
    lista_tamanhos(T,R).


% Cria pares Frequencia-Lista

cria_freq([],_,[]).

cria_freq([L|T],Tams,[Freq-L|R]) :-
    tamanho(L,Tam),
    conta(Tam,Tams,Freq),
    cria_freq(T,Tams,R).


% Remove frequências

remove_freq([],[]).

remove_freq([_-L|T],[L|R]) :-
    remove_freq(T,R).


% Predicado principal

lfsort(InList,OutList) :-
    lista_tamanhos(InList,Tams),
    cria_freq(InList,Tams,Pares),
    keysort(Pares,Ordenados),
    remove_freq(Ordenados,OutList).