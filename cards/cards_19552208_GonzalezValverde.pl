%hechos de cartas en cardsHechos 

%generarCarta([a,b,c,d,s,f,j,y,t],2,1,C).
generarCarta(Elementos, NumE, MaxC, CartaNueva):-
   carta(MaxC,NumE,Carta), 
   rem(Carta,NumE,Elementos,CartaNueva). 


%carta en string 
cardString(Carta, CardString ):- 
    mergeList(Carta,"-",CartaSeparda),  
    atomics_to_string(CartaSeparda, CardStringSola), 
    atom_concat(" carta: ",CardStringSola,CardString). 


%formato carta en formato 
cardsSetToFormat([],[]):-!.
cardsSetToFormat([Carta|CardsSet], [String|Resultado] ):- 
    cardString(Carta, String ),
    cardsSetToFormat(CardsSet, Resultado ).




