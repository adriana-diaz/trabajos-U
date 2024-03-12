#include "Libro.h"
Libro::Libro(string titulo, double precio, string autor, string editorial, int anioPublicacion, string genero)
    : Publicacion(titulo, precio, autor) {
    this->editorial = editorial;
    this->anioPublicacion = anioPublicacion;
    this->genero = genero;
}

string Libro::getEditorial() const {
    return editorial;
}

int Libro::getAnioPublicacion() const {
    return anioPublicacion;
}

string Libro::getGenero() const {
    return genero;
}

void Libro::setEditorial(string editorial) {
    this->editorial = editorial;
}

void Libro::setAnioPublicacion(int anioPublicacion) {
    this->anioPublicacion = anioPublicacion;
}

void Libro::setGenero(string genero) {
    this->genero = genero;
}

double Libro::calcularPrecio() const {
    double precioFinal = precio; // Precio base

    // Aplicar tributación si el libro tiene menos de 3 años de antigüedad
    if (2024 - anioPublicacion < 3) {
        precioFinal *= 1.05;
    }

    // Aplicar encarecimiento si el género es aventura, fantasía o medicina
    if (genero == "aventura" || genero == "fantasía" || genero == "medicina") {
        precioFinal *= 1.02;
    }

    return precioFinal;
}