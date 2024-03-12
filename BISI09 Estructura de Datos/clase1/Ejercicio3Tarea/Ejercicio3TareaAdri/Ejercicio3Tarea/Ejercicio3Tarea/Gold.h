#pragma once
#include "Cliente.h"

class Gold : public Cliente {
public:
    Gold(string nombre, string cedula, string genero, string fechaNacimiento, string direccion, string dedicacionLaboral, double montoSolicitado);

    double calcularInteres();
};
