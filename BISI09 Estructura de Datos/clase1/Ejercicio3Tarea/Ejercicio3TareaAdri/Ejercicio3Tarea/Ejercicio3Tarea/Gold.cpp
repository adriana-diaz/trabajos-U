#include "Gold.h"

Gold::Gold(string nombre, string cedula, string genero, string fechaNacimiento, string direccion, string dedicacionLaboral, double montoSolicitado) : Cliente(nombre, cedula, genero, fechaNacimiento, direccion, dedicacionLaboral, montoSolicitado) {
    
}

double Gold::calcularInteres() {
    return getMontoSolicitado() * 0.10;
}
