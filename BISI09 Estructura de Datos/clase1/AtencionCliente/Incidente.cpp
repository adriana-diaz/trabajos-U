#include "Incidente.h"
using namespace std;
Incidente::Incidente(int consecutivo, int id_cliente, int placa_equipo, string descripcion)
    : consecutivo(consecutivo), id_cliente(id_cliente), placa_equipo(placa_equipo), descripcion(descripcion) {}

int Incidente::getConsecutivo() const {
    return consecutivo;
}

int Incidente::getIdCliente() const {
    return id_cliente;
}

int Incidente::getPlacaEquipo() const {
    return placa_equipo;
}

string Incidente::getDescripcion() const {
    return descripcion;
}