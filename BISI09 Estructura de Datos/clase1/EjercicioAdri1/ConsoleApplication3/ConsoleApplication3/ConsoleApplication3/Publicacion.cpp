#include "Publicacion.h"
Publicacion::Publicacion(string titulo, double precio, string autor) {
    this->titulo = titulo;
    this->precio = precio;
    this->autor = autor;
}

string Publicacion::getTitulo() const {
    return titulo;
}

double Publicacion::getPrecio() const {
    return precio;
}

string Publicacion::getAutor() const {
    return autor;
}

void Publicacion::setTitulo(string titulo) {
    this->titulo = titulo;
}

void Publicacion::setPrecio(double precio) {
    this->precio = precio;
}

void Publicacion::setAutor(string autor) {
    this->autor = autor;
}

double Publicacion::calcularPrecio() const {
    return precio; // Precio base de la publicación
}
