
%TDA JUEGO

%crea un juego dobble donde valida el modo de juego 
dobbleGame(NumPlayers, CardsSet, Mode, Seed, [NumPlayers, CardsSet, Mode, Seed] ):-
    Mode = "ModoUno".

%obtiene el numero de jugadores 
getNumPlayer([NumPlayers,_,_,_], NumPlayers). 

%obtiene el las cartas del juego 
getCardsSetByGame([_,CardsSet,_,_], CardsSet).

%ontiene el modo de juego 
getModeGame([_,_,Mode,_], Mode).

%obtiene el seed generado aleatorio 
getSeedGame([_,_,_,Seed], Seed).


%addUserGame(Usuario, DobbleGame , [ [Usuario|_] ,DobbleGame] ):-
    

dobbleGameRegister(Usuario, DobbleGame, [ Usuarios , DobbleGame] ):-
    push(Usuario, Usuarios).


doobleTituloJuego(Titulo):-
    atom_concat("JUEGO DOBBLE", " " , Titulo). 

dobbleGameToString(DobbleGame, String):-
    doobleTituloJuego(Titulo),
    getNumPlayer(DobbleGame,NumPlayers),
    atom_concat(" CANTIDAD DE JUGADORES: ", NumPlayers , NumPlayerString), 
    getCardsSetByGame(DobbleGame, CardsSet),
    cardsSetToString(CardsSet, CardsSetString),
    getModeGame(DobbleGame, Mode),
    atom_concat(" MODO DE JUEGO: ", Mode , ModeString), 
    atom_concat( Titulo , NumPlayerString , TituloStringPlayers ), 
    atom_concat( TituloStringPlayers , ModeString , ModoPlayerTituloString ),
    atom_concat( ModoPlayerTituloString , " CARTAS DEL MAZO: " , DobbleGameString ),
    atom_concat( DobbleGameString , CardsSetString , String ). 


%dobbleGameWhoseTurnIsIt():-!.

%dobbleGamePlay():-.!

%dobbleGameStatus():-.!

%dobbleGameScore():-.!

%dobbleGameToString():-.!