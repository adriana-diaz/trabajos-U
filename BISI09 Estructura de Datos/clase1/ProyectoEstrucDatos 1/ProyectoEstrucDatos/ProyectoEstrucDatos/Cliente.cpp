#include "Cliente.h"

Cliente::Cliente() : codigo(""), cedula(""), nombre(""), metodoPago(""), tipoCliente(""), telefono("") {}

Cliente::Cliente(std::string codigo, std::string cedula, std::string nombre, std::string metodoPago, std::string tipoCliente, std::string telefono)
    : codigo(codigo), cedula(cedula), nombre(nombre), metodoPago(metodoPago), tipoCliente(tipoCliente), telefono(telefono) {}

std::string Cliente::getCodigo() const {
    return codigo;
}

std::string Cliente::getCedula() const {
    return cedula;
}

std::string Cliente::getNombre() const {
    return nombre;
}

std::string Cliente::getMetodoPago() const {
    return metodoPago;
}

std::string Cliente::getTipoCliente() const {
    return tipoCliente;
}

std::string Cliente::getTelefono() const {
    return telefono;
}

void Cliente::setCodigo(const std::string& codigo) {
    this->codigo = codigo;
}

void Cliente::setCedula(const std::string& cedula) {
    this->cedula = cedula;
}

void Cliente::setNombre(const std::string& nombre) {
    this->nombre = nombre;
}

void Cliente::setMetodoPago(const std::string& metodoPago) {
    this->metodoPago = metodoPago;
}

void Cliente::setTipoCliente(const std::string& tipoCliente) {
    this->tipoCliente = tipoCliente;
}

void Cliente::setTelefono(const std::string& telefono) {
    this->telefono = telefono;
}

std::ostream& operator<<(std::ostream& os, const Cliente& cliente) {
    os << "Código: " << cliente.codigo << std::endl;
    os << "Cedula: " << cliente.cedula << std::endl;
    os << "Nombre: " << cliente.nombre << std::endl;
    os << "Metodo de Pago: " << cliente.metodoPago << std::endl;
    os << "Tipo de Cliente: " << cliente.tipoCliente << std::endl;
    os << "Telefono: " << cliente.telefono << std::endl;
    return os;
}
