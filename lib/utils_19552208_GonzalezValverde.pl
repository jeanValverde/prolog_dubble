
%FUNCION SI ELEMNTO X PERTENECE A LA LISTA 
/**
*@descripción: implmentacion propia mymember 
*@relación: mymember
*@entrada: Elemento X Lista
*@salida: Lista 
*/
mymember(X,[X|_]) :- !.
mymember(X,[_|T]) :- mymember(X,T).

not(A) :- \+ call(A).

set([],[]).
set([H|T],[H|Out]) :-
    not(mymember(H,T)),
    set(T,Out).
set([H|T],Out) :-
    mymember(H,T),
    set(T,Out).


/**
*@descripción: rotal la lista bajo el X numero dentro del rango de la lista 
*@relación: append 
*@entrada: Lista X Elemento, Rango  
*@salida: Lista 
*/
rotar(X,X,0):-!.
rotar([X|Y], L, N):- 
    N1 is N-1, 
    append(Y,[X],Y1), 
    rotar(Y1, L, N1).


/**
*@descripción: elemetos repetidos de la lista 
*@relación: mymember
*@entrada: Lista 
*@salida: boolean 
*/
notRepetido([]):-!.
notRepetido([ILista|ICola]):-
    not(mymember(ILista,ICola)), 
    notRepetido(ICola).


/**
*@descripción: obtiene un elemento de la lista donde indice => 1
*@relación: no cuenta 
*@entrada: Lista X Indice 
*@salida: Elemento 
*/
getElement([Resultado|_],1,Resultado) :- !.
getElement([_|Cola],IndiceAbuscar,Resultado) :-
    IndiceAbuscar > 1, 
    IndiceActual is IndiceAbuscar-1,
    getElement(Cola,IndiceActual,Resultado).


/**
*@descripción: obtiene un elemento de la lista donde indice => 0
*@relación: no cuenta 
*@entrada: Lista X Indice 
*@salida: Elemento 
*/
getElement0([Resultado|_],0,Resultado) :- !.
getElement0([_|Cola],IndiceAbuscar,Resultado) :-
    IndiceAbuscar > 0, 
    IndiceActual is IndiceAbuscar-1,
    getElement0(Cola,IndiceActual,Resultado).


/**
*@descripción: crea una lista a partir de sub indices y los remplaza 
*@relación: getElement
*@entrada: Lista X NumE XLista Elementos
*@salida: Lista reemplazada
*/
rem(_,0,_,[]) :- !.
rem([ICabeza|ICola], Hasta , Elementos , [Elemento|R] ) :- 
    Hasta > 0,
    getElement(Elementos,ICabeza,Elemento), 
    Acum is Hasta-1, 
    rem(ICola, Acum, Elementos , R ).
      

/**
*@descripción: une dos listas 
*@relación: no cuenta 
*@entrada: Lista X Lista 
*@salida: Lista unida 
*/
mergeList([],_,[]):-!.
mergeList([Car|Cdr],Caracter, [Car,Caracter|Resultado] ):-
    mergeList(Cdr, Caracter , Resultado ).


/**
*@descripción: ne dos listas 
*@relación: no cuenta 
*@entrada: Lista X Lista 
*@salida: Lista unida 
*/
unionList(_,[],_):-!.
unionList([CL1|DL1],[CL2|DL2], [CL1,CL2|Resultado] ):-
    unionList(DL1,DL2, Resultado).


%agrega un elemento a la lista 
/**
*@descripción: agrega un elemto a la lista 
*@relación: no cuenta 
*@entrada: Elemento 
*@salida: Lista 
*/
push(Elemento, [Elemento|_]).
