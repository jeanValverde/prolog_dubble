
%genera el mazo de cartas por elementos, numeros de elementos, 
%cantidad de cartas 
generarMazo(_,_,0,[]) :- !.
generarMazo(Elementos, NumE, MaxC, [Carta|Cartas]):-
    MaxC >= 0, 
    generarCarta(Elementos, NumE, MaxC, Carta), 
    SiguienteCarta is MaxC-1, 
    generarMazo(Elementos, NumE, SiguienteCarta, Cartas).


%cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ) 
cardsSet(Elementos, NumE, MaxC, Seed , CS ) :-
    MaxC =< 10,
    number(Seed), 
    random_between(1,MaxC,Rotacion),  
    generarMazo(Elementos, NumE, MaxC, CardsSet), 
    rotar(CardsSet, CS, Rotacion). 


%cardsSet([ "A","B", "C", "D", "E", "D" ,"G" ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS).
cardsSetIsDobble([]):-!.
cardsSetIsDobble([Carta|CardsSet]):- 
    notRepetido(Carta), 
    cardsSetIsDobble(CardsSet).


%cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), cardsSetNthCard(CS, 4, Carta).
cardsSetNthCard(CardsSet, Indice, Carta):-
    getElement0(CardsSet, Indice, Carta).


%cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), cardsSetNthCard(  CS, 2, C2), cardsSetFindTotalCards( C2, TC).
cardsSetFindTotalCards(Carta, TC ):-
    length(Carta,Cantidad),
    f(Cantidad,TC).


%cardsSet([a, b, c, d, e, f, g, h, … ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).
cardsSetToString(CardsSet, String):- 
    cardsSetToFormat(CardsSet, CardsString ),
    atomics_to_string(CardsString,String).

%obtener elementos por carta 
getElementByCardsSet([],_):-  !.
getElementByCardsSet([Card|CardsSet] ,[Elemento|_] ) :- 
    cardsSetNthCard(CardsSet,0,SegundaCarta),
    unionList(Card,SegundaCarta,Elemento),
    getElementByCardsSet(CardsSet,Elemento).


%cardsSet([a, b, c, d, e, f, g, h ], 3, 3, 92175, CS), cardsSetMissingCards( CS, CS3).
%cardsSetMissingCards(CardsSet, CardsSet):- 


