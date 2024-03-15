#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <iostream>
using namespace std;
class Equipo{
private:
    int placa;
    string tipo;
    string marca;
    string ubicacion;
public:
    int getPlaca() const;
    string getTipo() const;
    string getMarca() const;
    string getUbicacion() const;
    Equipo(int placa, string tipo, string marca, string ubicacion);
};

