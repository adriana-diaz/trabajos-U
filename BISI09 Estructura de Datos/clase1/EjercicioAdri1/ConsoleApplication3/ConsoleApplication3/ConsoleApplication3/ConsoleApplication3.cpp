// ConsoleApplication3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include "Publicacion.h"
#include "Libro.h"
#include "Audiolibro.h"
int main()
{
    std::cout << "Hello World!\n";
    // Crear objetos de cada clase y realizar cálculos

    // Crear objeto Publicacion
    Publicacion publicacion("Publicacion 1", 20.0, "Autor 1");

    // Crear objeto Libro
    Libro libro("Libro 1", 30.0, "Autor 2", "Editorial A", 2022, "aventura");

    // Crear objeto AudioLibro
    Audiolibro audioLibro("AudioLibro 1", 25.0, "Autor 3", 120, "ciencia ficción");

    // Calcular precio de las publicaciones
    cout << "Precio de la publicacion: $" << publicacion.calcularPrecio() << endl;
    cout << "Precio del libro: $" << libro.calcularPrecio() << endl;
    cout << "Precio del audio-libro: $" << audioLibro.calcularPrecio() << endl;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
