#include "Cliente.h"
Cliente::Cliente(string nombre, string cedula, string fechaNacimiento, char sexo) {
    this->nombre = nombre;
    this->cedula = cedula;
    this->fechaNacimiento = fechaNacimiento;
    this->sexo = sexo;
}

string Cliente::getNombre() const {
    return nombre;
}

string Cliente::getCedula() const {
    return cedula;
}

string Cliente::getFechaNacimiento() const {
    return fechaNacimiento;
}

char Cliente::getSexo() const {
    return sexo;
}

void Cliente::setNombre(string nombre) {
    this->nombre = nombre;
}

void Cliente::setCedula(string cedula) {
    this->cedula = cedula;
}

void Cliente::setFechaNacimiento(string fechaNacimiento) {
    this->fechaNacimiento = fechaNacimiento;
}

void Cliente::setSexo(char sexo) {
    this->sexo = sexo;
}