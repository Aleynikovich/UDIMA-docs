/*
 * Practica 1: Fundamentos de programacion con C++
 * Asignatura: Fundamentos de programacion (Cod. 1375)
 * Autor: Alexander Sebastian Kalis
 * Fecha: 14 dic 2025
 *
 * Descripcion:
 * Programa para detectar patrones en series de 4 caracteres introducidos
 * por el usuario y generar series aleatorias de 10 elementos basadas
 * en patrones predefinidos (vocales, numericos, especiales o general).
 */

#include <iostream>
#include <cstdlib> // Necesario para rand() y srand()
#include <ctime>   // Necesario para time()
#include <cctype>  // Necesario para tolower()

using namespace std;

// --- Prototipos de funciones ---
void mostrarMenuPrincipal();
void opcionDetectarPatron();
void opcionGenerarSerie();
bool esVocal(char c);
bool esNumero(char c);
bool esEspecialPermitido(char c);

int main() {
    // Inicializamos la semilla aleatoria una única vez al principio
    srand(time(NULL));

    int opcion = 0;

    do {
        mostrarMenuPrincipal();
        cin >> opcion;

        switch (opcion) {
            case 1:
                opcionDetectarPatron();
                break;
            case 2:
                opcionGenerarSerie();
                break;
            case 3:
                cout << "Se cerrara la aplicacion ..." << endl;
                break;
            default:
                cout << "Opcion incorrecta. Por favor, elija 1, 2 o 3." << endl;
        }
        cout << endl; // Salto de línea estético

    } while (opcion != 3);

    return 0;
}

// --- Implementación de funciones ---

void mostrarMenuPrincipal() {
    cout << "------------------------------------------------------" << endl;
    cout << "1) Detectar un patron en una serie." << endl;
    cout << "2) Generar una serie alfanumerica de entre las posibles." << endl;
    cout << "3) Salir del programa" << endl;
    cout << "Opcion elegida: ";
}

/**
 * Opcion 1: El usuario introduce 4 caracteres.
 * El programa determina si son vocales, numeros, especiales (#$%&) o una mezcla (General).
 */
void opcionDetectarPatron() {
    char serie[4];
    char entrada;
    int contador = 0;

    cout << "Introduce cuatro caracteres de la serie (puedes separarlos por espacios o comas):" << endl;

    // Leemos 4 caracteres válidos.
    // El bucle ignora las comas ',' para que el caso de prueba 1.2 funcione correctamente.
    while (contador < 4) {
        cin >> entrada;
        
        // Convertimos a minuscula inmediatamente para estandarizar
        entrada = tolower(entrada);

        // Si es una coma, la ignoramos y pasamos al siguiente ciclo
        if (entrada == ',') {
            continue;
        }

        serie[contador] = entrada;
        contador++;
    }

    // Banderas para comprobar los tipos. Asumimos que son verdaderas hasta que se demuestre lo contrario.
    bool sonVocales = true;
    bool sonNumeros = true;
    bool sonEspeciales = true;

    for (int i = 0; i < 4; i++) {
        if (!esVocal(serie[i])) {
            sonVocales = false;
        }
        if (!esNumero(serie[i])) {
            sonNumeros = false;
        }
        if (!esEspecialPermitido(serie[i])) {
            sonEspeciales = false;
        }
    }

    // Resultados segun las banderas
    if (sonVocales) {
        cout << "La serie esta formada por vocales" << endl;
    } else if (sonNumeros) {
        cout << "La serie esta formada por caracteres numericos" << endl;
    } else if (sonEspeciales) {
        cout << "La serie esta formada por caracteres especiales" << endl;
    } else {
        // Si no cumple ninguno de los patrones especificos, es General por descarte.
        cout << "La serie es general" << endl;
    }
}

/**
 * Opcion 2: Genera 10 caracteres aleatorios segun el tipo elegido.
 */
void opcionGenerarSerie() {
    int tipo;
    cout << "Introducir el tipo de serie que queremos generar" << endl;
    cout << "1. Serie formada por vocales exclusivamente" << endl;
    cout << "2. Serie formada por caracteres numericos exclusivamente" << endl;
    cout << "3. Serie formada por caracteres especiales exclusivamente" << endl;
    cout << "4. Serie general" << endl; // Corregida la errata "geneal" del enunciado
    cin >> tipo;

    cout << "Serie: ";

    // Definimos los conjuntos de caracteres permitidos
    char vocales[] = {'a', 'e', 'i', 'o', 'u'};
    char especiales[] = {'#', '$', '%', '&'};
    // Nota: Para numeros usamos aritmetica de caracteres ('0' + n)
    // Para general usamos una mezcla

    for (int i = 0; i < 10; i++) {
        char generado;

        switch (tipo) {
            case 1: // Vocales
                generado = vocales[rand() % 5];
                break;
            case 2: // Numeros ('0' a '9')
                generado = '0' + (rand() % 10);
                break;
            case 3: // Especiales (#, $, %, &)
                generado = especiales[rand() % 4];
                break;
            case 4: // General
                // Estrategia: Elegimos aleatoriamente que tipo de caracter generar
                // 0: Vocal, 1: Número, 2: Especial, 3: Consonante
                int subtipo = rand() % 4;
                if (subtipo == 0) {
                    generado = vocales[rand() % 5];
                } else if (subtipo == 1) {
                    generado = '0' + (rand() % 10);
                } else if (subtipo == 2) {
                    generado = especiales[rand() % 4];
                } else {
                    // Generar una letra minuscula cualquiera (a-z)
                    // Validamos que no sea vocal para que sea estrictamente consonante (opcional, pero limpio)
                    do {
                        generado = 'a' + (rand() % 26);
                    } while (esVocal(generado));
                }
                break;
        }

        cout << generado;
        
        // Anadimos coma y espacio si no es el ultimo elemento
        if (i < 9) {
            cout << ", ";
        }
    }
    cout << endl;
}

// --- Funciones auxiliares ---

bool esVocal(char c) {
    // Asumimos que c ya viene en minuscula
    return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u');
}

bool esNumero(char c) {
    // Comprobamos rango ASCII de dígitos
    return (c >= '0' && c <= '9');
}

bool esEspecialPermitido(char c) {
    // Los caracteres especiales que indica el enunciado
    return (c == '#' || c == '$' || c == '%' || c == '&');
}