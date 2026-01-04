#include <iostream>
#include <ctime>
#include <cstdlib>
#include "jugador.h"
#include "tirada.h"

using namespace std;

int main() {
    srand(time(NULL));

    Jugador listaJugadores[2]; 
    Tirada tiradaActual;
    char seleccion = 's';

    cout << "--- CONFIGURACION DE PARTIDA ---" << endl;
    for(int i = 0; i < 2; i++) {
        cout << "JUGADOR " << i + 1 << ":" << endl;
        solicitarJugador(listaJugadores[i]);
    }

    // Bucle principal de juego
    while (seleccion == 's' && listaJugadores[0].tiradas_ganadas < 5 && listaJugadores[1].tiradas_ganadas < 5) {
        
        for (int i = 0; i < 2; i++) {
            cout << "\nTURNO DE: " << listaJugadores[i].nombre_usuario << endl;
            listaJugadores[i].puntos_parciales = realizarTirada(tiradaActual);
            cout << "Puntuacion obtenida: " << listaJugadores[i].puntos_parciales << endl;
        }

        // Logica de victoria por ronda
        if (listaJugadores[0].puntos_parciales > listaJugadores[1].puntos_parciales) {
            cout << "\nGana la ronda: " << listaJugadores[0].nombre_usuario << endl;
            actualizarPartidasGanadas(listaJugadores[0]);
        } else if (listaJugadores[1].puntos_parciales > listaJugadores[0].puntos_parciales) {
            cout << "\nGana la ronda: " << listaJugadores[1].nombre_usuario << endl;
            actualizarPartidasGanadas(listaJugadores[1]);
        } else {
            cout << "\nEmpate en esta ronda." << endl;
        }

        cout << "MARCADOR: " << listaJugadores[0].nombre_usuario << " [" << listaJugadores[0].tiradas_ganadas << "] - ";
        cout << listaJugadores[1].nombre_usuario << " [" << listaJugadores[1].tiradas_ganadas << "]" << endl;

        if (listaJugadores[0].tiradas_ganadas < 5 && listaJugadores[1].tiradas_ganadas < 5) {
            cout << "\nDesea continuar (s/n)?: ";
            cin >> seleccion;
        }
    }

    // Verificacion de ganador final
    if (listaJugadores[0].tiradas_ganadas == 5) 
        cout << "\nEL GANADOR FINAL ES " << listaJugadores[0].nombre_usuario << endl;
    else if (listaJugadores[1].tiradas_ganadas == 5) 
        cout << "\nEL GANADOR FINAL ES " << listaJugadores[1].nombre_usuario << endl;

    return 0;
}