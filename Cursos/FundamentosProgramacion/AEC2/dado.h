#ifndef DADO_H
#define DADO_H

// Definicion del enumerado para las caras del dado de Poker
enum resultadoDado { as = 1, king, queen, jota, diez, nueve, otro };

// Prototipos
resultadoDado tirarDado();
void mostrarDado(resultadoDado carta);

#endif