#pragma once
#include "Cliente.h"

class Platino : public Cliente {
public:
    Platino(string nombre, string cedula, string genero, string fechaNacimiento, string direccion, string dedicacionLaboral, double montoSolicitado);

    double calcularInteres();
};
