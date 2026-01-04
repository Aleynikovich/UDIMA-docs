#include "jugador.h"
#include <iostream>

using namespace std;

void solicitarJugador(Jugador& jugador) {
    cout << "Introduzca el nombre: ";
    cin >> jugador.nombre_usuario;
    jugador.tiradas_ganadas = 0; // Inicializacion de contador
}

void actualizarPartidasGanadas(Jugador& jugador) {
    jugador.tiradas_ganadas++;
}