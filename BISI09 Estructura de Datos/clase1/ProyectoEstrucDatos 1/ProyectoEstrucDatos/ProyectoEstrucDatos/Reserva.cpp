#include "Reserva.h"

// Constructor
Reserva::Reserva(std::string codigo, std::string fechaInicio, std::string fechaFin, std::string codigoHotel, std::string cedulaCliente)
    : codigo(codigo), fechaInicio(fechaInicio), fechaFin(fechaFin), codigoHotel(codigoHotel), cedulaCliente(cedulaCliente) {}

// Getters
std::string Reserva::getCodigo() const {
    return codigo;
}

std::string Reserva::getFechaInicio() const {
    return fechaInicio;
}

std::string Reserva::getFechaFin() const {
    return fechaFin;
}

std::string Reserva::getCodigoHotel() const {
    return codigoHotel;
}

std::string Reserva::getCedulaCliente() const {
    return cedulaCliente;
}

// Setters
void Reserva::setCodigo(std::string codigo) {
    this->codigo = codigo;
}

void Reserva::setFechaInicio(std::string fechaInicio) {
    this->fechaInicio = fechaInicio;
}

void Reserva::setFechaFin(std::string fechaFin) {
    this->fechaFin = fechaFin;
}

void Reserva::setCodigoHotel(std::string codigoHotel) {
    this->codigoHotel = codigoHotel;
}

void Reserva::setCedulaCliente(std::string cedulaCliente) {
    this->cedulaCliente = cedulaCliente;
}

// Sobrecarga del operador de inserción
std::ostream& operator<<(std::ostream& os, const Reserva& reserva) {
    os << "Código: " << reserva.codigo << std::endl;
    os << "Fecha de inicio: " << reserva.fechaInicio << std::endl;
    os << "Fecha de fin: " << reserva.fechaFin << std::endl;
    os << "Código del hotel: " << reserva.codigoHotel << std::endl;
    os << "Cédula del cliente: " << reserva.cedulaCliente << std::endl;
    return os;
}
