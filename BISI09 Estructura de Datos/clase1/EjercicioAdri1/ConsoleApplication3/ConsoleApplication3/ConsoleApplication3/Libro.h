#pragma once
#include "Publicacion.h"
#include <iostream>
#include <string>
using namespace std;
class Libro : public Publicacion
{
private:
    string editorial;
    int anioPublicacion;
    string genero;

public:
    Libro(string titulo, double precio, string autor, string editorial, int anioPublicacion, string genero);
    string getEditorial() const;
    int getAnioPublicacion() const;
    string getGenero() const;
    void setEditorial(string editorial);
    void setAnioPublicacion(int anioPublicacion);
    void setGenero(string genero);
    double calcularPrecio() const; // Sobreescribir método para calcular precio de libros
};


