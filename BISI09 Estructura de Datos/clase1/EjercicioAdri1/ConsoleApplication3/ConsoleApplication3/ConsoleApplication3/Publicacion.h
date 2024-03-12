#pragma once
#include <iostream>
#include <string>
using namespace std;
class Publicacion
{
protected:
    string titulo;
    double precio;
    string autor;

public:
    Publicacion(string titulo, double precio, string autor);
    string getTitulo() const;
    double getPrecio() const;
    string getAutor() const;
    void setTitulo(string titulo);
    void setPrecio(double precio);
    void setAutor(string autor);
    virtual double calcularPrecio() const; // Método virtual para calcular el precio
};


