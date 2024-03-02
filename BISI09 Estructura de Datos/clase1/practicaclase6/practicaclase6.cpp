#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

int generarNumeroAleatorio(int min, int max) {
    return rand() % (max - min + 1) + min;  //El + 1 se agrega para asegurarse que incluya min como max y el +min despliega el rango
}
int numeroAleatorio = generarNumeroAleatorio(1, 99); // Genera un número aleatorio entre 1 y 99


void inicioCarton(int carton[5][5]) { // declaro mi matriz 
    srand(time(0)); // utiliza para inicializar el generador de números aleatorios 
    for (int fila = 0; fila < 5; ++fila) { 
        for (int columna = 0; columna < 5; ++columna) {// Comienza con i igual a 0, y mientras i sea menor que 5 el bucle se hara
            carton[fila][columna] = generarNumeroAleatorio(1, 99);
        }
    }
}

// Función para imprimir el cartón
void imprimirCarton(int carton[5][5], bool descubiertos[5][5]) {
    cout << "  -------------------" << endl;
    for (int fila = 0; fila < 5; ++fila) { 
        cout << " |";
        for (int columna = 0; columna < 5; ++columna) { // Comienza con i igual a 0, y mientras i sea menor que 5 el bucle se hara
            if (descubiertos[fila][columna]) { // revisa si el número correspondiente en el cartón ha sido descubierto
                cout << (carton[fila][columna] < 10 ? " " : "") << carton[fila][columna]; // añade un espacio si el numero es +10 para q no se corra  
            }
            else {
                cout << " X"; //Si el número no ha sido descubierto, imprime una "X".
            }
            cout << " |";
        }
        cout << endl;
    }
    cout << "  -------------------" << endl;
}

// Función para verificar si el número está en el cartón
bool verificarNumero(int carton[5][5], int numero) {
    for (int fila = 0; fila < 5; ++fila) {
        for (int columna = 0; columna < 5; ++columna) {
            if (carton[fila][columna] == numero) { //si carton[fila][columnas] es igual al numero
                return true; //la función devuelve true, osea que el número está presente en el cartón
            }
        }
    }
    return false;
}

int main() {
    int carton[5][5]; //tamaño de matriz
    bool descubiertos[5][5] = { false }; //tamaño de matriz

    inicioCarton(carton);

    cout << "Bienvenido al juego de Bingo" << endl;
    cout << "Este es su carton:" << endl;
    imprimirCarton(carton, descubiertos); //se imprime el cartón inicial del jugador

    while (true) {
        int numero;
        cout << "Ingresa un numero del 1 al 99: ";
        cin >> numero;

        bool encontrado = verificarNumero(carton, numero);
        cout << "El numero " << numero << (encontrado ? " si" : " no") << " esta en tu carton." << endl;
        //para comprobar si el número ingresado por el usuario (numero) está presente en el cartón de bingo
        if (encontrado) {
            // Marcar el numero como descubierto
            for (int fila = 0; fila < 5; ++fila) {
                for (int columna = 0; columna < 5; ++columna) {
                    if (carton[fila][columna] == numero) {
                        descubiertos[fila][columna] = true;
                    }
                }
            }
            cout << "Asi queda tu carton:" << endl;
            imprimirCarton(carton, descubiertos); //Esto muestra al jugador cómo ha cambiado su cartón cuando descubre un nuevo número.
        }
    }
}