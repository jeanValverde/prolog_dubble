
%genera el mazo de cartas por elementos, numeros de elementos, 
%cantidad de cartas 
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
generarMazo(_,_,0,[]) :- !.
generarMazo(Elementos, NumE, MaxC, [Carta|Cartas]):-
    MaxC >= 0, 
    generarCarta(Elementos, NumE, MaxC, Carta), 
    SiguienteCarta is MaxC-1, 
    generarMazo(Elementos, NumE, SiguienteCarta, Cartas).


%cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ) 
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
cardsSet(Elementos, NumE, MaxC, Seed , CS ) :-
    MaxC =< 10,
    number(Seed), 
    random_between(1,MaxC,Rotacion),  
    generarMazo(Elementos, NumE, MaxC, CardsSet), 
    rotar(CardsSet, CS, Rotacion). 


%cardsSet([ "A","B", "C", "D", "E", "D" ,"G" ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS).
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
cardsSetIsDobble([]):-!.
cardsSetIsDobble([Carta|CardsSet]):- 
    notRepetido(Carta), 
    cardsSetIsDobble(CardsSet).


%cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), cardsSetNthCard(CS, 4, Carta).
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
cardsSetNthCard(CardsSet, Indice, Carta):-
    getElement0(CardsSet, Indice, Carta).


%cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), cardsSetNthCard(  CS, 2, C2), cardsSetFindTotalCards( C2, TC).
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
cardsSetFindTotalCards(Carta, TC ):-
    length(Carta,Cantidad),
    f(Cantidad,TC).

%cardsSet([a, b, c, d, e, f, g, h, … ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
cardsSetToString(CardsSet, String):- 
    cardsSetToFormat(CardsSet, CardsString ),
    atomics_to_string(CardsString,String).


%cardsSet([a, b, c, d, e, f, g, h ], 3, 3, 92175, CS), cardsSetMissingCards( CS, CS3).
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
%cardsSetMissingCards(CardsSet, CardsSet):- 


/**
*@descripción: obtener elementos por carta 
*@relación: 
*@entrada: 
*@salida: 
*/
getElementByCardsSet([],_):-  !.
getElementByCardsSet([Card|CardsSet] ,[Elemento|_] ) :- 
    cardsSetNthCard(CardsSet,0,SegundaCarta),
    unionList(Card,SegundaCarta,Elemento),
    getElementByCardsSet(CardsSet,Elemento).

/**
*@descripción: carta en formato 
*@relación: cardString
*@entrada: cardsSet
*@salida: formato de para string cartas
*/
cardsSetToFormat([],[]):-!.
cardsSetToFormat([Carta|CardsSet], [String|Resultado] ):- 
    cardString(Carta, String ),
    cardsSetToFormat(CardsSet, Resultado ).


