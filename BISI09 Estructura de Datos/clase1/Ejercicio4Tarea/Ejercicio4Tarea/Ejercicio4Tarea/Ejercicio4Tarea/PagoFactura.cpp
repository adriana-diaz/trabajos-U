#include "PagoFactura.h"

double PagoFactura::calcularTotal(double precioAparato, int cantidad, double descuento) {
    double subtotal = precioAparato * cantidad;
    double iva = subtotal * 0.13;
    double total = subtotal + iva;
    total -= total * (descuento / 100.0);
    return total;
}
