#include "Persona.h"
#include <iostream>

Persona::Persona() {
    this->id = 0;
    this->nombre = "";
    this->edad = 0;
}

Persona::Persona(int id, string nombre, int edad) {
    this->id = id;
    this->nombre = nombre;
    this->edad = edad;
}

void Persona::setId(int id) { // set void
    this->id = id;
}

int Persona::getId() { //get int
    return this-> id;
}

void Persona::setNombre(string nombre) {
    this->nombre = nombre;
}

string Persona::getNombre() {
    return this -> nombre;
}

void Persona::setEdad(int edad) {
    this->edad = edad;
}

int Persona::getEdad() {
    return this->edad;
}

void Persona::toString() {
    cout << "ID: " << id << ", Nombre: " << nombre << ", Edad: " << edad << endl;
}


void Persona::mostrar() {
        std::cout << "este es su ID: " << id << std::endl;     
        std::cout << "este es su Nombre: " << nombre << std::endl;     
        std::cout << "esta es su Edad: " << edad << std::endl; 
}
