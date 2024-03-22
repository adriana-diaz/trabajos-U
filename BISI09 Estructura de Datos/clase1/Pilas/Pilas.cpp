// Pilas.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
#include <stack>
#include <iostream>
#include <string>
using namespace std;

void Menu() {
    cout << "ESCOGE UNA OPCION" << endl;
    cout << "1/ Insertar un caracter a la pila" << endl;
    cout << "2/ Eliminar todos los elementos de la pila" << endl;
    cout << "3/ Mostrar el primer elemento de la pila" << endl;
    cout << "4/ Mostrar el ultimo elemento de la pila" << endl;
    cout << "5/ Mostrar el tamano de la pila" << endl;
    cout << "6/ Salir" << endl;

}


    int main() {
        stack<char> pila;
        int opcion;
        char caracter;

        do {
            Menu();
            cout << "Ingrese su opcion: ";
            cin >> opcion; // escoge la opcion 

            switch (opcion) {
            case 1:
                cout << "Ingrese el caracter a insertar: ";
                cin >> caracter;
                pila.push(caracter);
                cout << "Este es el caracter insertado:" << caracter;
                cout << "\n";
                break;
            case 2:
                while (!pila.empty()) { // mientras no este vacia
                    pila.pop();
                }
                cout << "Se han eliminado todos los elementos de la pila" << endl;
                break;
            case 3:
                if (!pila.empty()) { // mientras no este vacia
                    cout << "El primer elemento de la pila es: " << pila.top() << endl;
                }
                else {
                    cout << "La pila esta vacia." << endl;
                }
                break;
            case 4:
                if (!pila.empty()) {// mientras no este vacia
                    stack<char> aux = pila; //Se crea una nueva pila llamada aux y se inicializa con una copia de la pila original pila.
                    while (aux.size() > 1) { //Este bucle elimina elementos de la pila aux hasta que solo queda un elemento en ella
                        aux.pop();
                    }
                    cout << "El último elemento de la pila es: " << aux.top() << endl;
                }
                else {
                    cout << "La pila está vacía.\n";
                }
                break;
            case 5:
                cout << "El tamano de la pila es: " << pila.size() << endl;
                break;
            case 6:
                cout << "SALIR" << endl;
                break;
            default:
                cout << "Opcion no valida. Por favor,escoge uan opcion valida" << endl;
            }
        } while (opcion != 6);

        return 0;
    }

//insertar push() y quitar pop()
// elemento de arriba top() y size() cuando elemetos tiene la pila, saber si esta vacia empty()
// #include <stack>