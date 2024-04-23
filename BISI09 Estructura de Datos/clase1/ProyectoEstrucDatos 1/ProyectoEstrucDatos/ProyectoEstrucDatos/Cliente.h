#ifndef CLIENTE_H
#define CLIENTE_H

#include <string>
#include <iostream>

class Cliente {
private:
    std::string codigo; // Agregamos el atributo código
    std::string cedula;
    std::string nombre;
    std::string metodoPago;
    std::string tipoCliente;
    std::string telefono;

public:
    Cliente();
    Cliente(std::string codigo, std::string cedula, std::string nombre, std::string metodoPago, std::string tipoCliente, std::string telefono); // Actualizamos el constructor
        
    // Getters y setters
    std::string getCodigo() const; // Método para obtener el código
    std::string getCedula() const;
    std::string getNombre() const;
    std::string getMetodoPago() const;
    std::string getTipoCliente() const;
    std::string getTelefono() const;
    void setCodigo(const std::string& codigo); // Método para establecer el código
    void setCedula(const std::string& cedula);
    void setNombre(const std::string& nombre);
    void setMetodoPago(const std::string& metodoPago);
    void setTipoCliente(const std::string& tipoCliente);
    void setTelefono(const std::string& telefono);

    // Sobrecarga del operador de inserción
    friend std::ostream& operator<<(std::ostream& os, const Cliente& cliente);
};

#endif
