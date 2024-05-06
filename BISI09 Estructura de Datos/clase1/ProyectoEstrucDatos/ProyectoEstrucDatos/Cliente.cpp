#include "Cliente.h"
#include <iostream>
#include "ListaEnlazada.h"
using namespace std;

Cliente::Cliente() : codigo(""), cedula(""), nombre(""), metodoPago(""), tipoCliente(""), telefono("") {}

Cliente::Cliente(string codigo, string cedula, string nombre, string metodoPago, string tipoCliente, string telefono)
    : codigo(codigo), cedula(cedula), nombre(nombre), metodoPago(metodoPago), tipoCliente(tipoCliente), telefono(telefono) {}

string Cliente::getCodigo() const {
    return codigo;
}

string Cliente::getCedula() const {
    return cedula;
}

string Cliente::getNombre() const {
    return nombre;
}

string Cliente::getMetodoPago() const {
    return metodoPago;
}

string Cliente::getTipoCliente() const {
    return tipoCliente;
}

string Cliente::getTelefono() const {
    return telefono;
}

void Cliente::setCodigo(const string& codigo) {
    this->codigo = codigo;
}

void Cliente::setCedula(const string& cedula) {
    this->cedula = cedula;
}

void Cliente::setNombre(const string& nombre) {
    this->nombre = nombre;
}

void Cliente::setMetodoPago(const string& metodoPago) {
    this->metodoPago = metodoPago;
}

void Cliente::setTipoCliente(const string& tipoCliente) {
    this->tipoCliente = tipoCliente;
}

void Cliente::setTelefono(const string& telefono) {
    this->telefono = telefono;
}

std::ostream& operator<<(std::ostream& os, const Cliente& cliente) {
    os << "Codigo: " << cliente.codigo << endl;
    os << "Cedula: " << cliente.cedula << endl;
    os << "Nombre: " << cliente.nombre << endl;
    os << "Metodo de Pago: " << cliente.metodoPago << endl;
    os << "Tipo de Cliente: " << cliente.tipoCliente << endl;
    os << "Telefono: " << cliente.telefono << endl;
    return os;
}

