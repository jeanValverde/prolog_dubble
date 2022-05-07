%hechos de cartas en cardsHechos 

/**
*@descripción: genera un carta x en el set 
*@relación: carta, predicado rem en utils 
*@entrada: Elementos X NumE X MaxC 
*@salida: Carta generada 
*/
%generarCarta([a,b,c,d,s,f,j,y,t],2,1,C).
generarCarta(Elementos, NumE, MaxC, CartaNueva):-
   carta(MaxC,NumE,Carta), 
   rem(Carta,NumE,Elementos,CartaNueva). 


/**
*@descripción: cartas en string 
*@relación: mergeList en utils 
*@entrada: carta 
*@salida: carta en formato string 
*/
cardString(Carta, CardString ):- 
    mergeList(Carta,"-",CartaSeparda),  
    atomics_to_string(CartaSeparda, CardStringSola), 
    atom_concat(" carta: ",CardStringSola,CardString). 





