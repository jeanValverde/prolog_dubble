
%TDA JUEGO

%game([NumPlayers, CardsSet, "modoA" , Seed, Usuarios, Status]).

/**
*@descripción: genera el juego de cartas donde se valida NumPlayes y modos de juego 
*@relación: cardsSetIsDobble 
*@entrada: NumPlayers X CardsSet X Modo X Seed
*@salida: dobbleGame
*/
dobbleGame(NumPlayers, CardsSet, "modoA", Seed , [NumPlayers, CardsSet, "modoA" , Seed, [], creado] ):-!. 
dobbleGame(NumPlayers, CardsSet, "modoB", Seed , [NumPlayers, CardsSet, "modoB" , Seed,  [], creado] ):-!. 
dobbleGame(NumPlayers, CardsSet, "modoX", Seed , [NumPlayers, CardsSet, "modoX" , Seed, [], creado] ):-!. 


/**
*@descripción: obtieme cantidad de jugadores 
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: NumPlayers (number)
*/
getNumPlayer([NumPlayers,_,_,_,_,_], NumPlayers). 


/**
*@descripción: obtiene cardsSet
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: CardsSet
*/
getCardsSetByGame([_,CardsSet,_,_,_,_], CardsSet).


/**
*@descripción: obtiene modo de juego 
*@relación: no cuenta 
*@entrada: dobbleGame 
*@salida: Modo
*/
getModeGame([_,_,Mode,_,_,_], Mode).


/**
*@descripción: obtiene el seed generado aleatorio 
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: Seed
*/
getSeedGame([_,_,_,Seed,_,_], Seed).


/**
*@descripción: obtiene los usuarios 
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: Usuarios
*/
getUsuariosGame([_,_,_,_,Usuarios,_], Usuarios).

/**
*@descripción: obtener el estado de un juego 
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: Status
*/
getStatusGame([_,_,_,_,_,Status], Status).


%cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS),  dobbleGame( 2, CS, "modoX", 4222221, G), dobbleGameRegister( "user1" , G , GR).
/**
*@descripción: registra un usuario al juego cuado hay cupos en el juego 
*@relación:  
*@entrada: Usuario X dobbleGame 
*@salida: dobbleGameRegister
*/
dobbleGameRegister( Usuario ,  [NumPlayers, CardsSet, Modo , Seed, Usuarios, Status]  , DobbleGame  ):-
    length(Usuarios, CountUsuariosCurrent), 
    CountUsuariosCurrent < NumPlayers, 
    DobbleGame = [NumPlayers, CardsSet, Modo , Seed, [ [Usuario,0] |Usuarios], Status]. 


/**
*@descripción: define el turno 
*@relación: Game
*@entrada: Usuario X dobbleGame 
*@salida: Usuario
*/ 
dobbleGameWhoseTurnIsIt(DobbleGame, Usuario):-
    getUsuariosGame(DobbleGame, Usuarios ),
    member(Usuario, Usuarios ), 
    length(Usuarios, CantidadUsuarios),
    random_between(1,CantidadUsuarios,Rotacion),   
    rotar(Usuarios, [Usuario|_], Rotacion ). 


/**
*@descripción: obtiene el estado de juego 
*@relación:  
*@entrada: Usuario X dobbleGame 
*@salida: dobbleGameRegister
*/ 
dobbleGameStatus(DobbleGame, Status):-
    getStatusGame(DobbleGame, Status).


/**
*@descripción: Obtiene un puntaje de un usuario 
*@relación:  
*@entrada: DobbleGame X Username X  Score
*@salida: dobbleGameRegister
*/ 
dobbleGameScore(DobbleGame, Username, Score) :- 
    getUsuariosGame(DobbleGame, [[Username,Score]|_] ). 


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
%dobbleGamePlay():-.!

 

 

 
