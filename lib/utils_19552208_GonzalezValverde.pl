
%agrega un elemento a la lista 
push(Elemento, [Elemento|_]).

%FUNCION SI ELEMNTO X PERTENECE A LA LISTA 
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

%ROTAR LA LISTA VAJO EL X NUMBER DENTRO DEL RANGO 
rotar(X,X,0):-!.
rotar([X|Y], L, N):- 
    N1 is N-1, 
    append(Y,[X],Y1), 
    rotar(Y1, L, N1).

%RETONRA BOOLEAN SI EL ELMENTOS ESTA REPETIDO EN LA LISTA
notRepetido([]):-!.
notRepetido([ILista|ICola]):-
    not(mymember(ILista,ICola)), 
    notRepetido(ICola).



%OBTIENE UN ELEMENTO DE LA LISTA DONDE INDICE => 1
getElement([Resultado|_],1,Resultado) :- !.
getElement([_|Cola],IndiceAbuscar,Resultado) :-
    IndiceAbuscar > 1, 
    IndiceActual is IndiceAbuscar-1,
    getElement(Cola,IndiceActual,Resultado).


%OBTIENE UN ELEMENTO DE LA LISTA DONDE INDICE => 0
getElement0([Resultado|_],0,Resultado) :- !.
getElement0([_|Cola],IndiceAbuscar,Resultado) :-
    IndiceAbuscar > 0, 
    IndiceActual is IndiceAbuscar-1,
    getElement0(Cola,IndiceActual,Resultado).


%CREA UNA LISTA A PARTIR DE SUB INDICES 
%rem([0,2,5],3,[a,b,c,d,s,f],K).
rem(_,0,_,[]) :- !.
rem([ICabeza|ICola], Hasta , Elementos , [Elemento|R] ) :- 
    Hasta > 0,
    getElement(Elementos,ICabeza,Elemento), 
    Acum is Hasta-1, 
    rem(ICola, Acum, Elementos , R ).
      


mergeList([],_,[]):-!.
mergeList([Car|Cdr],Caracter, [Car,Caracter|Resultado] ):-
    mergeList(Cdr, Caracter , Resultado ).


unionList(_,[],_):-!.
unionList([CL1|DL1],[CL2|DL2], [CL1,CL2|Resultado] ):-
    unionList(DL1,DL2, Resultado).
