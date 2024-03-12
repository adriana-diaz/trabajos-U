#include "Audiolibro.h"

Audiolibro::Audiolibro(string titulo, double precio, string autor, int tiempoReproduccion, string genero) : Publicacion(titulo, precio, autor){ 
    this->tiempoReproduccion = tiempoReproduccion;
    this->genero = genero;
}

int Audiolibro::getTiempoReproduccion() const {
    return tiempoReproduccion;
}

string Audiolibro::getGenero() const {
    return genero;
}

void Audiolibro::setTiempoReproduccion(int tiempoReproduccion) {
    this->tiempoReproduccion = tiempoReproduccion;
}

void Audiolibro::setGenero(string genero) {
    this->genero = genero;
}

double Audiolibro::calcularPrecio() const {
    double precioFinal = precio; // Precio base

    // Aplicar encarecimiento si el género es aventura, fantasía o medicina
    if (genero == "aventura" || genero == "fantasía" || genero == "medicina") {
        precioFinal *= 1.02;
    }

    return precioFinal;
}
