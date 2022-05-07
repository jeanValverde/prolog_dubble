# Dobble en PROLOG 

_Juego dobble en lenguaje prolog_


Para realizar pruebas con DrRacket abrir el archivo main. 

En la versión actual de este sistema se encuentran las siguientes funciones implementadas: 

* **cardsSet** 
* **cardsSetIsDobble** 
* **cardsSetNthCard** 
* **cardsSetFindTotalCards** 
* **cardsSetToString** 

* **dobbleGame**
* **dobbleGameToString**


Ejemplos de uso: 


* **cardsSet** 
```
cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ).

[[A,F,G],[A,D,E],[A,B,C],[C,E,F],[C,D,G],[B,E,G],[B,D,F]]
```


* **cardsSetIsDobble** 
```
 cardsSet([ uno, dos, tres, cuatro, cinco, seis, siete ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS). 
 
 true
```

* **cardsSetNthCard** 
```
cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), cardsSetNthCard(CS, 4, Carta).

Carta = [A,B,C]
```

* **cardsSetFindTotalCards**
```
cardsSet([a, b, c, d, e, f, g, h], 3, 3, 92175, CS), cardsSetNthCard(  CS, 2, C2), cardsSetFindTotalCards( C2, TC).

TC = 7
```

* **cardsSetToString**
```
cardsSet([a, b, c, d, e, f, g, h, … ], 3, 3, 92175, CS), cardsSetToString(CS, CS_STR), write(CS_STR).

carta: a-d-e- carta: a-b-c- carta: a-f-g-

```

* **dobbleGame**
```


```

* **dobbleGameToString**
```

```


Árbol de directorio del repositorio:

```
│   Autoevaluacion.txt
│   main_19552208_GonzalezValverde.pl
│   README.md
│
├───cards
│       cardsHechos_19552208_GonzalezValverde.pl
│       cards_19552208_GonzalezValverde.pl
│
├───cardsSet
│       cardsSet_19552208_GonzalezValverde.pl
│
├───dobbleGame
│       dobbleGame_19552208_GonzalezValverde.pl
│
├───dobbleJs
│       dobble.js
│
└───lib
        math_19552208_GonzalezValverde.pl
        utils_19552208_GonzalezValverde.pl
```


Algoritmo para implementar esta solución fue de: 

* [The Dobble Algorithm](https://mickydore.medium.com/the-dobble-algorithm-b9c9018afc52)
* [DOBBLE: Un juego de mesa que esconde un tesoro matemático](https://www.etilmercurio.com/em/dobble-un-juego-de-mesa-que-esconde-un-tesoro-matematico)

```

let n = 8  //order of plane, must be a prime number
let cards = [] //the deck of cards
let card = []; //the current card we are building

//to start, we build the first card
for (i = 1; i <= n+1; i++) {
    card.push(i)
}
cards.push(card)


//then we build the next n number of cards
for (j=1; j<=n; j++) {
    card = []
    card.push(1)
    
    for (k=1; k<=n; k++) {
        card.push(n * j + (k+1))
    }
    cards.push(card)
}


//finally we build the next n² number of cards
for (i= 1; i<=n; i++) {
    for (j=1; j<=n; j++) {
        card = []
        card.push(i+1)
        
        for (k=1; k<= n; k++) {
            card.push(n+2+n*(k-1)+(((i-1)*(k-1)+j-1)%n))
        }
        cards.push(card)
    }
}
 
for (k=0; k<= cards.length; k++) {
    console.log('carta(' + (k+1) + ',' + (n+1) + ', [' + cards[k] + ']).');
}

//resultado 

carta(1,4, [1,2,3,4]).
carta(2,4, [1,5,6,7]).
carta(3,4, [1,8,9,10]).
carta(4,4, [1,11,12,13]).
carta(5,4, [2,5,8,11]).
carta(6,4, [2,6,9,12]).
carta(7,4, [2,7,10,13]).
carta(8,4, [3,5,9,13]).
carta(9,4, [3,6,10,11]).
carta(10,4, [3,7,8,12]).
carta(11,4, [4,5,10,12]).
carta(12,4, [4,6,8,13]).
carta(13,4, [4,7,9,11]).

```
