#include "Cliente.h"

Cliente::Cliente(string nombre, string cedula, string genero, string fechaNacimiento, string direccion, string dedicacionLaboral, double montoSolicitado) {
    this->nombre = nombre;
    this->cedula = cedula;
    this->genero = genero;
    this->fechaNacimiento = fechaNacimiento;
    this->direccion = direccion;
    this->dedicacionLaboral = dedicacionLaboral;
    this->montoSolicitado = montoSolicitado;
}
void Cliente::setNombre(string nombre) {
    this->nombre = nombre;
}

void Cliente::setCedula(string cedula) {
    this->cedula = cedula;
}

void Cliente::setGenero(string genero) {
    this->genero = genero;
}

void Cliente::setFechaNacimiento(string fechaNacimiento) {
    this->fechaNacimiento = fechaNacimiento;
}

void Cliente::setDireccion(string direccion) {
    this->direccion = direccion;
}

void Cliente::setDedicacionLaboral(string dedicacionLaboral) {
    this->dedicacionLaboral = dedicacionLaboral;
}

void Cliente::setMontoSolicitado(double montoSolicitado) {
    this->montoSolicitado = montoSolicitado;
}
string Cliente::getNombre() {
    return this-> nombre;
}

string Cliente::getCedula() {
    return this-> cedula;
}

string Cliente::getGenero() {
    return this-> genero;
}

string Cliente::getFechaNacimiento() {
    return this-> fechaNacimiento;
}

string Cliente::getDireccion() {
    return this-> direccion;
}

string Cliente::getDedicacionLaboral() {
    return this-> dedicacionLaboral;
}

double Cliente::getMontoSolicitado() {
    return this-> montoSolicitado;
}


