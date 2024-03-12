#pragma once
#include "Usuario.h"

class Profesor : public Usuario {
private:
    string tipoTitularidad;
    int cursosImpartidos;
public:
    Profesor(string nombre, string apellidos, string domicilio, string email, string cedula, string tipoTitularidad, int cursosImpartidos);
    string getTipoTitularidad();
    int getCursosImpartidos();
    void setTipoTitularidad(string tipoTitularidad);
    void setCursosImpartidos(int cursosImpartidos);
    double calcularPago();
};
