#include "Cliente.h"

Cliente::Cliente(string nombre, string cedula) {
    this->nombre = nombre;
    this->cedula = cedula;
}

string Cliente::getNombre() {
    return this-> nombre;
}

string Cliente::getCedula() {
    return this-> cedula;
}
