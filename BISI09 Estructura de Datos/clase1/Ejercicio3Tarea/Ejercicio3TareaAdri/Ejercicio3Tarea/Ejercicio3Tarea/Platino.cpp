#include "Platino.h"

Platino::Platino(string nombre, string cedula, string genero, string fechaNacimiento, string direccion, string dedicacionLaboral, double montoSolicitado) : Cliente(nombre, cedula, genero, fechaNacimiento, direccion, dedicacionLaboral, montoSolicitado) {
  
}

double Platino::calcularInteres() {
    return getMontoSolicitado() * 0.15;
}
