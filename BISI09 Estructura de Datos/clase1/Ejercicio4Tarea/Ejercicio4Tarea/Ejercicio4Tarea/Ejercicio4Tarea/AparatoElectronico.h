#pragma once
#include <string>
using namespace std;

class AparatoElectronico {
private:
    int codigo;
    string nombre;
    string marca;
    double precio;

public:
    AparatoElectronico(int codigo, string nombre, string marca, double precio);


    int getCodigo();
    string getNombre();
    string getMarca();
    double getPrecio();
};
