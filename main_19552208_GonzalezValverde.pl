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


%test

%cardsSet
:- cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), write(CS).
:- cardsSet([ uno, dos, tres, cuatro, cinco, seis, siete ], 3, 7, 1323 , CS ),  write(CS).
:- cardsSet([ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ], 4, 7, 1323 , CS ),  write(CS).

%cardsSetIsDobble
:- cardsSet([ uno, dos, tres, cuatro, cinco, seis, siete ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS). 

%cardsSetNthCard
:- cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), cardsSetNthCard(CS, 4, Carta), write(Carta).

%cardsSetFindTotalCards
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), cardsSetNthCard(  CS, 2, C2), cardsSetFindTotalCards( C2, TC), write(TC).

%cardsSetToString
:- cardsSet([a, b, c, d, e, f, g, h ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).

%dobbleGame
:- cardsSet([a, b, c, d, e, f, g ], 3, 3, 92175, CS), dobbleGame( 4, CS, "modoX" , 4222221, G), write(G).

%dobbleGameRegister
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX", 4222221, G), dobbleGameRegister( "user1", G, G2), dobbleGameRegister("user3" , G2 , G3),  write(G3).

%dobbleGameWhoseTurnIsIt
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX", 4222221, G), dobbleGameRegister( "user1", G, G2), dobbleGameRegister("user3" , G2 , G3), dobbleGameWhoseTurnIsIt(G3, UsuarioTurno), write(UsuarioTurno).

%dobbleGameStatus
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX", 4222221, G), dobbleGameStatus(G,Status), write(Status).

%dobbleGameScore
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX", 4222221, G), dobbleGameRegister( "user1", G, G2), dobbleGameRegister("user3" , G2 , G3), dobbleGameScore(G3, "user3", Score ), write(Score).

%dobbleGameToString
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX", 4222221, G), dobbleGameToString(G, Str), display(Str). 

%dobbleGamePlay (null)
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX", 4222221, G), dobbleGameRegister( "user1", G, G2), dobbleGameRegister("user3" , G2 , G3), dobbleGamePlay(G3, null, G4), write(G4).

%dobbleGamePlay [finish]
:- cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 4, CS, "modoX", 4222221, G), dobbleGameRegister( "user1", G, G2), dobbleGameRegister("user3" , G2 , G3), dobbleGamePlay(G3, [finish] , G4), write(G4).






