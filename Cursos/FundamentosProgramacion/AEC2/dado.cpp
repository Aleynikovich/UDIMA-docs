#include "dado.h"
#include <iostream>
#include <cstdlib>

using namespace std;

// Funcion que genera un valor aleatorio y lo asigna al enumerado
resultadoDado tirarDado() {
    int numeroDado = 1 + rand() % 6;
    return (resultadoDado)numeroDado;
}

// Muestra el nombre literal de la carta obtenida
void mostrarDado(resultadoDado carta) {
    switch (carta) {
        case as:    cout << "As";    break;
        case king:  cout << "King";  break;
        case queen: cout << "Queen"; break;
        case jota:  cout << "Jota";  break;
        case diez:  cout << "Diez";  break;
        case nueve: cout << "Nueve"; break;
        default:    cout << "Error"; break;
    }
}