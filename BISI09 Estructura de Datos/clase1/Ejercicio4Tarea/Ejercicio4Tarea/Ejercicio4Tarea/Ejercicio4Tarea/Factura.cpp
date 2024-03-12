#include "Factura.h"

Factura::Factura(int codigoAparato, string cedulaCliente, int cantidad, double precioTotal, double descuento) {
    this->codigoAparato = codigoAparato;
    this->cedulaCliente = cedulaCliente;
    this->cantidad = cantidad;
    this->precioTotal = precioTotal;
    this->descuento = descuento;
}

int Factura::getCodigoAparato() {
    return this-> codigoAparato;
}

string Factura::getCedulaCliente() {
    return this-> cedulaCliente;
}

int Factura::getCantidad() {
    return this-> cantidad;
}

double Factura::getPrecioTotal() {
    return this-> precioTotal;
}

double Factura::getDescuento() {
    return this-> descuento;
}
