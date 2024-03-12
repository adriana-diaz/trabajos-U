#include <iostream>
#include "AparatoElectronico.h"
#include "Cliente.h"
#include "Factura.h"
#include "PagoFactura.h"

int main() {
  
    AparatoElectronico aparato(101, "Telefono", "Samsung", 250);

    Cliente cliente("Adriana", "119320150");

    Factura factura(aparato.getCodigo(), cliente.getCedula(), 1, aparato.getPrecio() * 1.13, 10);

    
    double total = PagoFactura::calcularTotal(aparato.getPrecio(), factura.getCantidad(), factura.getDescuento());

  
    std::cout << "Factura:" << std::endl;
    std::cout << "Codigo del aparato: " << factura.getCodigoAparato() << std::endl;
    std::cout << "Cedula del cliente: " << factura.getCedulaCliente() << std::endl;
    std::cout << "Cantidad: " << factura.getCantidad() << std::endl;
    std::cout << "Precio total: " << factura.getPrecioTotal() << std::endl;
    std::cout << "Descuento aplicado: " << factura.getDescuento() << "%" << std::endl;
    std::cout << "Total a pagar: " << total << std::endl;

    return 0;
}
