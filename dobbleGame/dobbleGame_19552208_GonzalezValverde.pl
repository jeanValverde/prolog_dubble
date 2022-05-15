
%TDA JUEGO

%game([NumPlayers, CardsSet, "modoA" , Seed, Usuarios, Status]).

/**
*@descripción: genera el juego de cartas donde se valida NumPlayes y modos de juego 
*@relación: cardsSetIsDobble 
*@entrada: NumPlayers X CardsSet X Modo X Seed
*@salida: dobbleGame
*/
dobbleGame(NumPlayers, CardsSet, "modoA", Seed , [NumPlayers, CardsSet, "modoA" , Seed, [], created] ):-!. 
dobbleGame(NumPlayers, CardsSet, "modoB", Seed , [NumPlayers, CardsSet, "modoB" , Seed,  [], created] ):-!. 
dobbleGame(NumPlayers, CardsSet, "modoX", Seed , [NumPlayers, CardsSet, "modoX" , Seed, [], created] ):-!. 


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
*@descripción: obtiene un usuario 
*@relación: no cuenta 
*@entrada: dobbleGame
*@salida: Usuario
*/
getUsuarioGameByName([_,_,_,_,[[Username,Puntaje,Turno]|_],_], Username, Usuario ):-
    Usuario = [Username,Puntaje,Turno], !.

getUsuarioGameByName([_,_,_,_,[Usuario|Usuarios],_], Username , Usuario):-
    getUsuarioGameByName([_,_,_,_,Usuarios,_], Username, Usuario).
        

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
    DobbleGame = [NumPlayers, CardsSet, Modo , Seed, [ [Usuario,0,pass]|Usuarios], Status]. 


/**
*@descripción: define el turno 
*@relación: Game
*@entrada: Usuario X dobbleGame 
*@salida: Usuario
*/ 
dobbleGameWhoseTurnIsIt([_ , _ , _ , _, [ [Username, _ , _ ] | _ ] , _ ], Username ):-!. 
dobbleGameWhoseTurnIsIt([_, _, _ , _, [[_,_,pass]|Usuarios] , _], Username):- 
    dobbleGameWhoseTurnIsIt( [_, _, _ , _, Usuarios , _ ] , Username  ).

    




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
dobbleGameScore([_ , _ , _ , _, [ [Username, Score , _ ] | _ ] , _ ], Username, Score ):-!.
dobbleGameScore([_ , _ , _ , _, [ [_ , _ , _ ] | Usuarios ] , _ ], Username, Score) :- 
    dobbleGameScore([_ , _ , _ , _, Usuarios , _ ], Username, Score). 


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
*@descripción: Solo se hace el volteo inicial de cartas según la modalidad de juego activa y no se pasa el turno
*@relación: CardsSet
*@entrada: Game X Null X Game
*@salida: Game
*/
dobbleGamePlay([NumPlayers, CardsSet, Modo , Seed, Usuarios , _ ] , null , GameChangeStatusPtos ):- 
    length(CardsSet, MaxC),
    random_between(1,MaxC,Rotacion),  
    rotar(CardsSet, CardsSetVolteo , Rotacion), 
    GameChangeStatusPtos = [NumPlayers, CardsSetVolteo , Modo , Seed, Usuarios , flip ]. 



/**
*@descripción: indica que se debe realizar la comparación entre las cartas volteadas a partir del elemento indicado por el usuario.
*@relación: 
*@entrada: 
*@salida: 
*/
%dobbleGamePlay(DobbleGame, [spotIt, Usuario, Elemento], GameChangeStatusPtos ). 



/**
*@descripción: Indica que se debe pasar el turno, procurando volver las cartas a su sitio de acuerdo a la modalidad de juego
*@relación: 
*@entrada: 
*@salida: 
*/
%dobbleGamePlay(DobbleGame, [pass], GameChangeStatusPtos ). 




/**
*@descripción: Indica que da término a la partida cambiando el estado del juego a Terminado e indicando ganador/perdedor/empate
*@relación: 
*@entrada: 
*@salida: 
*/
dobbleGamePlay([NumPlayers, CardsSet, Modo , Seed, Usuarios , _], [finish] , GameChangeStatusPtos ):- 
    GameChangeStatusPtos = [NumPlayers, CardsSet, Modo , Seed, Usuarios , finish].



