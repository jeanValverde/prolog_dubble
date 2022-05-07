
%TDA JUEGO

/**
*@descripción: genera el juego de cartas donde se valida NumPlayes y modos de juego 
*@relación: cardsSetIsDobble 
*@entrada: NumPlayers X CardsSet X Modo X Seed
*@salida: dobbleGame
*/
dobbleGame(_, _, "modoX", _ , _ ). 
dobbleGame(_, _, "modoA", _ , _ ). 
dobbleGame(_, _, "modoB", _ , _ ). 
dobbleGame(NumPlayers, CardsSet, Mode, Seed, [NumPlayers, CardsSet, Mode, Seed] ):-
    number(NumPlayers),
    cardsSetIsDobble(CardsSet). 


/**
*@descripción: obtieme cantidad de jugadores 
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: NumPlayers (number)
*/
getNumPlayer([NumPlayers,_,_,_], NumPlayers). 


/**
*@descripción: obtiene cardsSet
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: CardsSet
*/
getCardsSetByGame([_,CardsSet,_,_], CardsSet).


/**
*@descripción: obtiene modo de juego 
*@relación: no cuenta 
*@entrada: dobbleGame 
*@salida: Modo
*/
getModeGame([_,_,Mode,_], Mode).


/**
*@descripción: obtiene el seed generado aleatorio 
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: Seed
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
*@descripción: registra un usuario al juego 
*@relación:  
*@entrada: Usuario X dobbleGame 
*@salida: dobbleGameRegister
*/
dobbleGameRegister(Usuario, DobbleGame, [ Usuarios , DobbleGame] ):-
    push(Usuario, Usuarios).

/**
*@descripción: crea el titulo de juego 
*@relación: no cuenta 
*@entrada: Titulo
*@salida: String Titulo
*/
doobleTituloJuego(Titulo):-
    atom_concat("JUEGO DOBBLE", " " , Titulo). 

/**
*@descripción: genera dobbleGame en formato String 
*@relación: doobleTituloJuego, getNumPlayer, getCardsSetByGame, cardsSetToString, getModeGame
*@entrada: DobbleGame
*@salida: String dobbleGame en formato 
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