#include <queue>
#include <iostream>
using namespace std;


    //queue<int> cola;
    //cola.push(1);
    //cola.push(2);
    //cout << cola.size() << " ";
    //cola.pop();
    //cout << cola.size() << " ";
    //cola.push(1);
    //cola.push(3);
    //cout << cola.front() << "\n";
    //cola.pop();
    //cola.pop();
    //if (cola.empty()) cout << "La cola no tiene elementos\n";
    //else cout << "La cola tiene elementos\n";
    //return 0;

void Menu() {
    cout << "ESCOGE UNA OPCION" << endl;
    cout << "1/ Insertar un caracter a la cola" << endl;
    cout << "2/ Eliminar todos los elementos de la cola" << endl;
    cout << "3/ Mostrar el primer elemento de la cola" << endl;
    cout << "4/ Mostrar el ultimo elemento de la cola" << endl;
    cout << "5/ Mostrar el tamano de la cola" << endl;
    cout << "6/ Salir" << endl;

}

int main() {
    queue<char> cola;
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
            cola.push(caracter);
            cout << "Este es el caracter insertado:" << caracter;
            cout << "\n";
            break;
        case 2:
            while (!cola.empty()) { // mientras no este vacia
                cola.pop();
            }
            cout << "Se han eliminado todos los elementos de la cola" << endl;
            break;
        case 3:
            if (!cola.empty()) { // mientras no este vacia
                cout << "El primer elemento de la cola es: " << cola.front() << endl;
            } else {
                cout << "La cola esta vacia." << endl;
            }
            break;
        case 4:
            if (!cola.empty()) {
                cout << "El ultimo elemento de la cola es: " << cola.back() << endl;
            }
            else {
                cout << "La cola esta vacia." << endl;
            }
            break;
        case 5:
            cout << "El tamano de la cola es: " << cola.size() << endl;
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