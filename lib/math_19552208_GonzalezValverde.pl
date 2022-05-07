
%funcion F para calcular las cartas en base a elementos por carta 
/**
*@descripción: obtiene la cantidad de cartas a generar por elementos por carta 
*@relación: no cuenta 
*@entrada: NumE X MaxC
*@salida: MaxC
*/
f(NumE,MaxC):-
    MaxC is ((NumE-1) * (NumE-1)) + (NumE-1) + 1. 

