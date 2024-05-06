#ifndef CLIENTE_H
#define CLIENTE_H

#include <string>
#include <iostream>
#include "ListaEnlazada.h"

class Cliente {
private:
    std::string codigo;
    std::string cedula;
    std::string nombre;
    std::string metodoPago;
    std::string tipoCliente;
    std::string telefono;

public:
    Cliente();
    Cliente(std::string codigo, std::string cedula, std::string nombre, std::string metodoPago, std::string tipoCliente, std::string telefono);
        
    // Getters y setters
    std::string getCodigo() const;
    std::string getCedula() const;
    std::string getNombre() const;
    std::string getMetodoPago() const;
    std::string getTipoCliente() const;
    std::string getTelefono() const;
    void setCodigo(const std::string& codigo); 
    void setCedula(const std::string& cedula);
    void setNombre(const std::string& nombre);
    void setMetodoPago(const std::string& metodoPago);
    void setTipoCliente(const std::string& tipoCliente);
    void setTelefono(const std::string& telefono);
    void mostrarMenuClientes();
    void menuClientes(ListaEnlazada<Cliente>& listaClientes);
    // Sobrecarga del operador de inserción
    friend std::ostream& operator<<(std::ostream& os, const Cliente& cliente); //Una función amiga tiene acceso a los miembros privados y protegidos de una clase en la que está declarada como amiga. 
};

#endif
