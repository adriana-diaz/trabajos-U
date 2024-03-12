#pragma once
#include "AparatoElectronico.h"
#include "Cliente.h"

class Factura {
private:
    int codigoAparato;
    string cedulaCliente;
    int cantidad;
    double precioTotal;
    double descuento;

public:
    Factura(int codigoAparato, string cedulaCliente, int cantidad, double precioTotal, double descuento);

    // Getters
    int getCodigoAparato();
    string getCedulaCliente();
    int getCantidad();
    double getPrecioTotal();
    double getDescuento();
};
