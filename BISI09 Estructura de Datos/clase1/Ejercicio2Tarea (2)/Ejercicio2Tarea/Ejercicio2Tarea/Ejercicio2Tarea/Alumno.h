#pragma once
#include "Usuario.h"

class Alumno : public Usuario {
private:
    int numeroMatricula;
    int cursosMatriculados;

public:
    Alumno(string nombre, string apellidos, string domicilio, string email, string cedula, int numeroMatricula, int cursosMatriculados);

    int getNumeroMatricula();
    int getCursosMatriculados();
    void setNumeroMatricula(int numeroMatricula);
    void setCursosMatriculados(int cursosMatriculados);
};
