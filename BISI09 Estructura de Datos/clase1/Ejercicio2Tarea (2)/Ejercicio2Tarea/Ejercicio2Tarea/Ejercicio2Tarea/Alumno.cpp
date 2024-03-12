#include "Alumno.h"

Alumno::Alumno(string nombre, string apellidos, string domicilio, string email, string cedula, int numeroMatricula, int cursosMatriculados) : Usuario(nombre, apellidos, domicilio, email, cedula) {
    this->numeroMatricula = numeroMatricula;
    this->cursosMatriculados = cursosMatriculados;
}

int Alumno::getNumeroMatricula() {
    return numeroMatricula;
}

int Alumno::getCursosMatriculados() {
    return cursosMatriculados;
}

void Alumno::setNumeroMatricula(int numeroMatricula) {
    this->numeroMatricula = numeroMatricula;
}

void Alumno::setCursosMatriculados(int cursosMatriculados) {
    this->cursosMatriculados = cursosMatriculados;
}
