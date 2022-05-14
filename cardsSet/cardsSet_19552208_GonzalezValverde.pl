/**
*@descripción: genera el mazo completo de cartas a partir de los hechos de cartas 
*@relación: carta, generarCarta
*@entrada: Elementos X NumE X MaxC 
*@salida: cardsSet
*/
generarMazo(_,_,0,[]) :- !.
generarMazo(Elementos, NumE, MaxC, [Carta|Cartas]):-
    MaxC > 0, 
    generarCarta(Elementos, NumE, MaxC, Carta), 
    SiguienteCarta is MaxC-1, 
    generarMazo(Elementos, NumE, SiguienteCarta, Cartas).


%cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ) 
/**
*@descripción: genera el mazo de carta en formato solicitado por requerimiento por cartas aleatorias y MaxC 
*@relación: random_between, generarMazo, rotar 
*@entrada: Elementos X  NumE X MaxC X Seed 
*@salida: cardsSet 
*/
cardsSet(Elementos, NumE, MaxC, Seed , CS ) :-
    NumE =< 10,
    number(Seed), 
    random_between(1,MaxC,Rotacion),  
    generarMazo(Elementos, NumE, MaxC, CardsSet), 
    rotar(CardsSet, CS, Rotacion). 


%cardsSet([ "A","B", "C", "D", "E", "D" ,"G" ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS).
/**
*@descripción: valida si un mazo de carta es valido 
*@relación: notRepetido, lib mymember 
*@entrada: CardsSet
*@salida: boolean 
*/
cardsSetIsDobble([]):-!.
cardsSetIsDobble([Carta|CardsSet]):- 
    notRepetido(Carta), 
    cardsSetIsDobble(CardsSet).


%cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), cardsSetNthCard(CS, 4, Carta).
/**
*@descripción: obtiene una carta del set de carta del total -1 
*@relación: getElement0 en utils 
*@entrada: CardsSet X Indice
*@salida: Carta
*/
cardsSetNthCard(CardsSet, Indice, Carta):-
    getElement0(CardsSet, Indice, Carta).


%cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), cardsSetNthCard(  CS, 2, C2), cardsSetFindTotalCards( C2, TC).
/**
*@descripción: ontiene el total de cartas a generar a partir de un mazo 
*@relación: length, f 
*@entrada: Carta
*@salida: Total de cartas que debe tener el mazo 
*/
cardsSetFindTotalCards(Carta, TC ):-
    length(Carta,Cantidad),
    f(Cantidad,TC).


%cardsSet([a, b, c, d, e, f, g, h, … ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).
/**
*@descripción: genera un string de cardsSet en formato 
*@relación: cardsSetToFormat 
*@entrada: CardsSet 
*@salida: String de cartas 
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
*@relación:  cardsSetNthCard, unionList
*@entrada: cardsSet
*@salida: Elementos 
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


