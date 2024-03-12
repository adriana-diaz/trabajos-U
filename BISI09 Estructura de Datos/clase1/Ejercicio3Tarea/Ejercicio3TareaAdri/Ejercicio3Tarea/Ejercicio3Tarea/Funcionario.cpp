#include "Funcionario.h"

Funcionario::Funcionario(string nombre, string cedula, string direccion, string fechaNacimiento, string genero, string perfilAcceso, string nombreUsuario, string claveAcceso) {
    this->nombre = nombre;
    this->cedula = cedula;
    this->direccion = direccion;
    this->fechaNacimiento = fechaNacimiento;
    this->genero = genero;
    this->perfilAcceso = perfilAcceso;
    this->nombreUsuario = nombreUsuario;
    this->claveAcceso = claveAcceso;
}

void Funcionario::setNombre(string nombre) {
    this->nombre = nombre;
}

void Funcionario::setCedula(string cedula) {
    this->cedula = cedula;
}

void Funcionario::setDireccion(string direccion) {
    this->direccion = direccion;
}

void Funcionario::setFechaNacimiento(string fechaNacimiento) {
    this->fechaNacimiento = fechaNacimiento;
}

void Funcionario::setGenero(string genero) {
    this->genero = genero;
}

void Funcionario::setPerfilAcceso(string perfilAcceso) {
    this->perfilAcceso = perfilAcceso;
}

void Funcionario::setNombreUsuario(string nombreUsuario) {
    this->nombreUsuario = nombreUsuario;
}

void Funcionario::setClaveAcceso(string claveAcceso) {
    this->claveAcceso = claveAcceso;
}
string Funcionario::getNombre() {
    return this-> nombre;
}

string Funcionario::getCedula() {
    return this-> cedula;
}

string Funcionario::getDireccion() {
    return this-> direccion;
}

string Funcionario::getFechaNacimiento() {
    return this-> fechaNacimiento;
}

string Funcionario::getGenero() {
    return this-> genero;
}

string Funcionario::getPerfilAcceso() {
    return this-> perfilAcceso;
}

string Funcionario::getNombreUsuario() {
    return this-> nombreUsuario;
}

string Funcionario::getClaveAcceso() {
    return this-> claveAcceso;
}


