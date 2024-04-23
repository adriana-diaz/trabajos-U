// Hotel.cpp
#include "Hotel.h"
#include <iostream>

// Constructor
Hotel::Hotel(std::string codigo, std::string nombre, std::string pais, std::string especializacion, int cantidadHabitaciones)
    : codigo(codigo), nombre(nombre), pais(pais), especializacion(especializacion), cantidadHabitaciones(cantidadHabitaciones) {}

// Getters
std::string Hotel::getCodigo() const {
    return codigo;
}

std::string Hotel::getNombre() const {
    return nombre;
}

std::string Hotel::getPais() const {
    return pais;
}

std::string Hotel::getEspecializacion() const {
    return especializacion;
}

int Hotel::getCantidadHabitaciones() const {
    return cantidadHabitaciones;
}

// Setters
void Hotel::setCodigo(std::string codigo) {
    this->codigo = codigo;
}

void Hotel::setNombre(std::string nombre) {
    this->nombre = nombre;
}

void Hotel::setPais(std::string pais) {
    this->pais = pais;
}

void Hotel::setEspecializacion(std::string especializacion) {
    this->especializacion = especializacion;
}

void Hotel::setCantidadHabitaciones(int cantidadHabitaciones) {
    this->cantidadHabitaciones = cantidadHabitaciones;
}

std::ostream& operator<<(std::ostream& os, const Hotel& hotel) {
    os << "Código: " << hotel.codigo << std::endl;
    os << "Nombre: " << hotel.nombre << std::endl;
    os << "País: " << hotel.pais << std::endl;
    os << "Especialización: " << hotel.especializacion << std::endl;
    os << "Cantidad de habitaciones: " << hotel.cantidadHabitaciones << std::endl;
    return os;
}