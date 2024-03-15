#include "Equipo.h"
Equipo::Equipo(int placa, string tipo, string marca, string ubicacion) {
    this->placa = placa;
    this->tipo = tipo;
    this->marca = marca;
    this->ubicacion = ubicacion;
}

int Equipo::getPlaca() const {
    return placa;
}
string Equipo::getTipo() const {
    return tipo;
}
string Equipo::getMarca() const {
    return marca;
}
string Equipo::getUbicacion() const {
    return ubicacion;
}