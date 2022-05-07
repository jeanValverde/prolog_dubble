%hechos de cartas en cardsHechos 

/**
*@descripción: genera un carta x en el set 
*@relación: 
*@entrada: Elementos X NumE X MaxC 
*@salida: Carta generada 
*/
%generarCarta([a,b,c,d,s,f,j,y,t],2,1,C).
generarCarta(Elementos, NumE, MaxC, CartaNueva):-
   carta(MaxC,NumE,Carta), 
   rem(Carta,NumE,Elementos,CartaNueva). 


/**
*@descripción: cartas en string 
*@relación: 
*@entrada: 
*@salida: 
*/
cardString(Carta, CardString ):- 
    mergeList(Carta,"-",CartaSeparda),  
    atomics_to_string(CartaSeparda, CardStringSola), 
    atom_concat(" carta: ",CardStringSola,CardString). 


/**
*@descripción: carta en formato 
*@relación: 
*@entrada: 
*@salida: 
*/
cardsSetToFormat([],[]):-!.
cardsSetToFormat([Carta|CardsSet], [String|Resultado] ):- 
    cardString(Carta, String ),
    cardsSetToFormat(CardsSet, Resultado ).




