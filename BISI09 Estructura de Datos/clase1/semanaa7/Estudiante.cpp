#include "Estudiante.h"
#include <iostream>

Estudiante::Estudiante() : Persona() { //llamo a la clase persona
    this->carnet = 0;
    this->materiasmatriculadas = 0;
}

Estudiante::Estudiante(int id, string nombre, int edad, int carnet, int materiasmatriculadas) : Persona(id, nombre, edad) {
    this->carnet = carnet;
    this->materiasmatriculadas = materiasmatriculadas;
}

void Estudiante::setcarnet(int carnet) {
    this->carnet = carnet;
}

int Estudiante::getcarnet() {
    return this->carnet;
}

int Estudiante::getmateriasmatriculadas() {
    return this->materiasmatriculadas;
}

void Estudiante::setmateriasmatriculadas (int materiasmatriculadas) {
    this->materiasmatriculadas = materiasmatriculadas;
}

void Estudiante::mostrar() {
    cout << "este es el id: " << getId() << endl;
    cout << "este es el mombre: " << getNombre() << endl;
    cout << "esta es el edad: " << getEdad() << endl;
    cout << "este es el carnet: " << carnet << endl;
    cout << "esta son las materias matriculadas: " << materiasmatriculadas << endl;
}