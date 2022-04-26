%primera carta 
%cardsSet([Elementos], Nume, Maxc, Seed, CS ).

%getPrimeraCarta([Elementos],Nume,Cartas):-!. 


%lib math para calculos globales 

getIndiceUno(N, J, K, Resultado):- 
    Resultado is (((K+1) + J) * N). 
 
getIndiceDos(N, K, I, J, Resultado):-
    Resultado is (  ( N + 2 + N * (K-1) )  +  ((((I-1) * (K-1)) + (J - 1)) mod N)  )   .


push(Elemento, [Cabeza|Cola] , [Elemento, Cabeza|Cola]). 


%DESDE EL 0 HASTA SIZE DE LA COLA 
getElement([Resultado|_],0,Resultado) :- !.

getElement([_|Cola],IndiceAbuscar,Resultado) :-
    IndiceAbuscar > 0, 
    IndiceActual is IndiceAbuscar-1,
    getElement(Cola,IndiceActual,Resultado).
 



 /**TDA CARDS**/

getPrimeraCarta(Elementos, NumE, Card ):- 
    NewNumE = NumE  - 1, 
    select( NewNumE , Elementos , Card).



getSegundaCarta([Resultado|_], 0 , Resultado ):- !.

getSegundaCarta( [_|Elementos] , NumE, Resultado):-
    NumE > 0, 
    Acum is NumE-1,  
    select( Acum , Elementos , Resultado), 
    getSegundaCarta(Elementos, Acum , Resultado). 



