#pragma once
#include <string>
#include <iostream>

class Hotel {
private:
    std::string codigo;
    std::string nombre;
    std::string pais;
    std::string especializacion;
    int cantidadHabitaciones;

public:
    // Constructor predeterminado
    Hotel() : codigo(""), nombre(""), pais(""), especializacion(""), cantidadHabitaciones(0) {}

    Hotel(std::string codigo, std::string nombre, std::string pais, std::string especializacion, int cantidadHabitaciones);

    // Getters
    std::string getCodigo() const;
    std::string getNombre() const;
    std::string getPais() const;
    std::string getEspecializacion() const;
    int getCantidadHabitaciones() const;

    // Setters
    void setCodigo(std::string codigo);
    void setNombre(std::string nombre);
    void setPais(std::string pais);
    void setEspecializacion(std::string especializacion);
    void setCantidadHabitaciones(int cantidadHabitaciones);
    friend std::ostream& operator<<(std::ostream& os, const Hotel& hotel);
};
