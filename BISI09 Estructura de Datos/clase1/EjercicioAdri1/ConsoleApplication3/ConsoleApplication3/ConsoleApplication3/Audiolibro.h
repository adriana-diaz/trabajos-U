#pragma once
#include "Publicacion.h"
#include <iostream>
#include <string>
using namespace std;
class Audiolibro : public Publicacion
{
private:
    int tiempoReproduccion;
    string genero;

public:
    Audiolibro(string titulo, double precio, string autor, int tiempoReproduccion, string genero);
    int getTiempoReproduccion() const;
    string getGenero() const;
    void setTiempoReproduccion(int tiempoReproduccion);
    void setGenero(string genero);
    double calcularPrecio() const; // Sobreescribir método para calcular precio de audio-libros
};

