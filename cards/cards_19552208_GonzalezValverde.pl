%generarCarta([a,b,c,d,s,f,j,y,t],2,1,C).
generarCarta(Elementos, NumE, MaxC, CartaNueva):-
   carta(MaxC,NumE,Carta), 
   rem(Carta,NumE,Elementos,CartaNueva). 


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

cardString(Carta, CardString ):- 
    mergeList(Carta,"-",CartaSeparda),  
    atomics_to_string(CartaSeparda, CardStringSola), 
    atom_concat(" carta: ",CardStringSola,CardString). 



cardsSetToFormat([],[]):-!.
cardsSetToFormat([Carta|CardsSet], [String|Resultado] ):- 
    cardString(Carta, String ),
    cardsSetToFormat(CardsSet, Resultado ).



%cardsSet([a, b, c, d, e, f, g, h, … ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).
cardsSetToString(CardsSet, String):- 
    cardsSetToFormat(CardsSet, CardsString ),
    atomics_to_string(CardsString,String).


unionList(_,[],_):-!.
unionList([CL1|DL1],[CL2|DL2], [CL1,CL2|Resultado] ):-
    unionList(DL1,DL2, Resultado).


getElementByCardsSet([],_):-  !.
getElementByCardsSet([Card|CardsSet] ,[Elemento|_] ) :- 
    cardsSetNthCard(CardsSet,0,SegundaCarta),
    unionList(Card,SegundaCarta,Elemento),
    getElementByCardsSet(CardsSet,Elemento).



unir([],[],_):-!.
unir([Car|Cdr],[Car2|Cdr2],[Car,Car2|Resultado]):-
    unir(Cdr,Cdr2, Resultado ).


unir2(Lista,_):- length(Lista,Cantidad), Cantidad = 0, !.

unir2([Lista|Listas],Resultado):-
    getElement0(Listas,0,Carta),  
    unir(Lista,Carta,Resultado), 
    unir2(Listas, Resultado ).


%cardsSet([a, b, c, d, e, f, g, h ], 3, 3, 92175, CS), cardsSetMissingCards( CS, CS3).
%cardsSetMissingCards(CardsSet, CardsSet):- 




%cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), cardsSetNthCard(  CS, 2, C2), cardsSetFindTotalCards( C2, TC).
cardsSetFindTotalCards(Carta, TC ):-
    length(Carta,Cantidad),
    f(Cantidad,TC).

