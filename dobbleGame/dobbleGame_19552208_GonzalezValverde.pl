
%TDA JUEGO

%crea un juego dobble donde valida el modo de juego 
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
dobbleGame(NumPlayers, CardsSet, Mode, Seed, [NumPlayers, CardsSet, Mode, Seed] ):-
    Mode = "modoX".

%obtiene el numero de jugadores 
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
getNumPlayer([NumPlayers,_,_,_], NumPlayers). 

%obtiene el las cartas del juego 
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
getCardsSetByGame([_,CardsSet,_,_], CardsSet).

%ontiene el modo de juego 
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
getModeGame([_,_,Mode,_], Mode).

%obtiene el seed generado aleatorio 
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
getSeedGame([_,_,_,Seed], Seed).

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
%addUserGame(Usuario, DobbleGame , [ [Usuario|_] ,DobbleGame] ):-
    
/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
dobbleGameRegister(Usuario, DobbleGame, [ Usuarios , DobbleGame] ):-
    push(Usuario, Usuarios).

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
doobleTituloJuego(Titulo):-
    atom_concat("JUEGO DOBBLE", " " , Titulo). 

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
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

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
%dobbleGameWhoseTurnIsIt():-!.

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
%dobbleGamePlay():-.!

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
%dobbleGameStatus():-.!

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
%dobbleGameScore():-.!

/**
*@descripción: 
*@relación: 
*@entrada: 
*@salida: 
*/
%dobbleGameToString():-.!