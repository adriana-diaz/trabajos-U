#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

int main() {
    srand(time(0));

    char eleccion; //variable

    while (true) {
        cout << "{{{{MENU}}}}}" << endl;
        cout << "1) JUGAR PARTIDA" << endl;
        cout << "2) SALIR" << endl;
        cin >> eleccion;

        switch (eleccion) {
        case '1': {
            string palabraSecreta;
            cout << "Ingrese la palabra a adivinar (maximo 10 caracteres): ";
            cin >> palabraSecreta;

            if (palabraSecreta.length() > 10) {
                cout << "La palabra debe tener 10 caracteres o menos. Inténtalo de nuevo.\n";
                break; // Regresar al menú principal
            }

            vector<char> letrasAdivinadas(palabraSecreta.length(), '_');

            int intentos = 0;
            bool juegoTerminado = false;
            while (!juegoTerminado) {
                cout << "--- Juego del Ahorcado ---";
                for (char letra : letrasAdivinadas) {
                    cout << letra << " ";
                }
                cout << "Intentos restantes: " << intentos << endl; // cree variable intentos
                cout << "1. Adivinar letra ";
                cout << "2. Adivinar palabra ";

                cout << "Seleccione una opcion: ";
                cin >> eleccion;

                switch (eleccion) {
                case '1': {
                    char letra;
                    cout << "Ingrese una letra: ";
                    cin >> letra;

                    // Verificar si la letra ya fue adivinada
                    bool letraAdivinada = false;
                    for (int i = 0; i < palabraSecreta.length(); ++i) {
                        if (palabraSecreta[i] == letra && letrasAdivinadas[i] == '_') {
                            letrasAdivinadas[i] = letra;
                            letraAdivinada = true;
                        }
                    }
                    if (!letraAdivinada) {
                        cout << "Incorrecto, La letra no está en la palabra secreta";
                        intentos++;
                    }
                    break;

                }
                case '2': { //advinar palabra
                    string palabra;
                    cout << "Ingrese la palabra completa: ";
                    cin >> palabra;

                    if (palabra == palabraSecreta) {
                        cout << "Felicidades! Adivino la palabra";
                    }
                    juegoTerminado = true;
                    break;
                }
                }
            }
        }
        }
    }
}
