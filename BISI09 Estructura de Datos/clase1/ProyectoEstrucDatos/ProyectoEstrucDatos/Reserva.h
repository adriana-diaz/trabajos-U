// Reserva.h
#pragma once
#include <string>
#include <iostream>
#include "ListaEnlazada.h"

class Reserva {
private:
    std::string codigo;
    std::string fechaInicio;
    std::string fechaFin;
    std::string codigoHotel;
    std::string cedulaCliente;

public:
    // Constructor predeterminado
    Reserva() {}

    Reserva(std::string codigo, std::string fechaInicio, std::string fechaFin, std::string codigoHotel, std::string cedulaCliente);

    // Getters
    std::string getCodigo() const;
    std::string getFechaInicio() const;
    std::string getFechaFin() const;
    std::string getCodigoHotel() const;
    std::string getCedulaCliente() const;

    // Setters
    void setCodigo(std::string codigo);
    void setFechaInicio(std::string fechaInicio);
    void setFechaFin(std::string fechaFin);
    void setCodigoHotel(std::string codigoHotel);
    void setCedulaCliente(std::string cedulaCliente);

    // Sobrecarga del operador de inserción
    friend std::ostream& operator<<(std::ostream& os, const Reserva& reserva);

};
