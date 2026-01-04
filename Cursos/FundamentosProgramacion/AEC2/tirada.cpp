#include "tirada.h"
#include <iostream>

using namespace std;

int realizarTirada(Tirada& tirada) {
    cout << "Resultado de la tirada:" << endl;
    for (int i = 0; i < 5; i++) {
        tirada[i] = tirarDado();
        cout << "- ";
        mostrarDado(tirada[i]);
        cout << endl;
    }

    // Algoritmo de comparacion de parejas sugerido en el enunciado
    int contadorParejas = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = i + 1; j < 5; j++) {
            if (tirada[i] == tirada[j]) {
                contadorParejas++;
            }
        }
    }

    // Asignacion de puntos segun el numero de coincidencias encontradas
    int pts = 0;
    if (contadorParejas == 1) pts = 1;       // Pareja
    else if (contadorParejas == 2) pts = 2;  // Dobles
    else if (contadorParejas == 3) pts = 3;  // Trio
    else if (contadorParejas == 4) pts = 4;  // Full
    else if (contadorParejas == 6) pts = 6;  // Poker
    else if (contadorParejas == 10) pts = 10;// Repoker
    
    return pts;
}