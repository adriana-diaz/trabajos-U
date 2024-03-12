#include "Usuario.h"

Usuario::Usuario(string nombre, string apellidos, string domicilio, string email, string cedula) {
    this->nombre = nombre;
    this->apellidos = apellidos;
    this->domicilio = domicilio;
    this->email = email;
    this->cedula = cedula;
}

string Usuario::getNombre() {
    return nombre;
}

string Usuario::getApellidos() {
    return apellidos;
}

string Usuario::getDomicilio() {
    return domicilio;
}

string Usuario::getEmail() {
    return email;
}

string Usuario::getCedula() {
    return cedula;
}

void Usuario::setNombre(string nombre) {
    this->nombre = nombre;
}

void Usuario::setApellidos(string apellidos) {
    this->apellidos = apellidos;
}

void Usuario::setDomicilio(string domicilio) {
    this->domicilio = domicilio;
}

void Usuario::setEmail(string email) {
    this->email = email;
}

void Usuario::setCedula(string cedula) {
    this->cedula = cedula;
}
