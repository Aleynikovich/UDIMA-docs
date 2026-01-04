#ifndef JUGADOR_H
#define JUGADOR_H
#include <string>

struct Jugador {
    std::string nombre_usuario;
    int puntos_parciales;
    int tiradas_ganadas;
};

void solicitarJugador(Jugador& jugador);
void actualizarPartidasGanadas(Jugador& jugador);

#endif