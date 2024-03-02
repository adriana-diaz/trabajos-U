#pragma once
#include "Persona.h"

class Estudiante:Persona
{
private:
	int carnet;
	int materiasmatriculadas;
public:
    Estudiante();
    Estudiante(int id, string nombre, int edad, int carnet, int materiasmatriculadas);//clase padre habla con clase hija

    int getcarnet();
    void setcarnet(int carnet);
    int getmateriasmatriculadas();
    void setmateriasmatriculadas(int materiasmatriculadas);
    void mostrar();
};

