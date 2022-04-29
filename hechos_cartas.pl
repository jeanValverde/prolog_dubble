%hechos 
carta(1,2,[1,2]).
carta(2,2,[1,3]).
carta(3,2,[2,3]).

%hechos sol 2 
carta(1,2,1,2).
carta(2,2,1,3).
carta(3,2,2,3).

size([],0).
size([_|Y], N):-
    size(Y, N1), 
    N is N1+1.



getElement([Resultado|_],0,Resultado) :- !.

getElement([_|Cola],IndiceAbuscar,Resultado) :-
    IndiceAbuscar > 0, 
    IndiceActual is IndiceAbuscar-1,
    getElement(Cola,IndiceActual,Resultado).


remplazarLista(_,0,ListaCambio,Resultado) :-
    size(ListaCambio, CountListaCambio),
    size(Resultado, CountResultado ),
    CountListaCambio = CountResultado,  !.

remplazarLista(ListaIndices, Hasta , ListaCambio , [_|Resultado] ) :-
    Hasta > 0, 
    Acum is Hasta-1, 
    getElement(ListaIndices,Acum,Elemento), 
    remplazarLista(ListaIndices, Acum, ListaCambio, [Elemento|Resultado] ).



