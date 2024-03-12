#include "AparatoElectronico.h"

AparatoElectronico::AparatoElectronico(int codigo, string nombre, string marca, double precio) {
    this->codigo = codigo;
    this->nombre = nombre;
    this->marca = marca;
    this->precio = precio;
}

int AparatoElectronico::getCodigo() {
    return this-> codigo;
}

string AparatoElectronico::getNombre() {
    return this-> nombre;
}

string AparatoElectronico::getMarca() {
    return this-> marca;
}

double AparatoElectronico::getPrecio() {
    return this-> precio;
}
