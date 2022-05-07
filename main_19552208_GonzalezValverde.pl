%utilities 
:- consult('lib/math_19552208_GonzalezValverde.pl').
:- consult('lib/utils_19552208_GonzalezValverde.pl').

%cards
:- consult('cards/cardsHechos_19552208_GonzalezValverde.pl').
:- consult('cards/cards_19552208_GonzalezValverde.pl').

%cardsSet
:- consult('cardsSet/cardsSet_19552208_GonzalezValverde.pl').

%test para pruebas 

%crea un set de cartas donde los elementos pueden ser numeros, atomos o string 
:- cardsSet([ "A","B", "C", "D", "E", "F" ,"G" ], 3, 7, 1323 , CS ), write(CS).

%valida si un cards set es valido 
%:- cardsSet([ uno, dos, tres, cuatro, cinco, seis, siete ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS). 

%valida 
:- cardsSet([ 1, 3, 3, 3, 4, 5, 6 ], 3, 7, 1323 , CS ), cardsSetIsDobble(CS). 
