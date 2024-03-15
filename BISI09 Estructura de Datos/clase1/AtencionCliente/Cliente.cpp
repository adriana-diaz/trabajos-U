#include "Cliente.h"
Cliente::Cliente(int id, string nombre, string telefono, string departamento) {
    this->id = id;
    this->nombre = nombre;
    this->telefono = telefono;
    this->departamento = departamento;
}

int Cliente::getId() const {
    return id;
}
string Cliente::getNombre() const {
    return nombre;
}
string Cliente::getTelefono() const {
    return telefono;
}
string Cliente::getDepartamento() const {
    return departamento;
}