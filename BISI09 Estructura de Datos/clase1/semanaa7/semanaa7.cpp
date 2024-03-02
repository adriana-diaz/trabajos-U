// semanaa7.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include "Persona.h"
#include "Estudiante.h"

int main()
{
    std::cout << "Hello World!\n";
    Estudiante estudiant = Estudiante(1, "Juan", 22, 123456, 2);
    estudiant.mostrar();
}
