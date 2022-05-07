%utilities 
:- consult('lib/math_19552208_GonzalezValverde.pl').
:- consult('lib/utils_19552208_GonzalezValverde.pl').

%cards
:- consult('cards/cardsHechos_19552208_GonzalezValverde.pl').
:- consult('cards/cards_19552208_GonzalezValverde.pl').

%cardsSet
:- consult('cardsSet/cardsSet_19552208_GonzalezValverde.pl').

%game
:- consult('dobbleGame/dobbleGame_19552208_GonzalezValverde.pl').

%test para pruebas 


%crea un set de cartas donde los elementos pueden ser numeros, atomos o string 
:- write(" cardsSet: "). 
:- cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), write(CS).


%valida si un cards set es valido 
:- cardsSet([ uno, dos, tres, cuatro, cinco, seis, siete ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS). 


%obtener una carta del mazo cardsSetNthCard 
%cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), cardsSetNthCard(CS, 4, Carta).
:- write("   cardsSetNthCard  ").
:- cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), 
    write(CS), 
    write(" cardsSetNthCard 4: "), 
    cardsSetNthCard(CS, 4, Carta), 
    write(Carta).


%obtiene la cantida de cartas por los elementos 
% cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), cardsSetNthCard(  CS, 2, C2), cardsSetFindTotalCards( C2, TC).
:- write("   cardsSetFindTotalCards  ").
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), 
    write(CS),
    cardsSetNthCard(  CS, 2, C2), 
    write(" cardsSetNthCard 2: "),
    write(C2),  
    cardsSetFindTotalCards( C2, TC), 
    write(" cardsSetFindTotalCards: "),
    write(TC).


%imprime el set de carta en formato 
%cardsSet([a, b, c, d, e, f, g, h, … ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).
:- write("   cardsSetToString  ").
:- cardsSet([a, b, c, d, e, f, g, h ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).


%PRUEBAS PARA GAME 
%cardsSet([a, b, c, d, e, f, g, h ], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX" , 4222221, G).  
:- write("  dobbleGame  ").
:- cardsSet([a, b, c, d, e, f, g ], 3, 3, 92175, CS), dobbleGame( 4, CS, "modoX" , 4222221, G), write(G).