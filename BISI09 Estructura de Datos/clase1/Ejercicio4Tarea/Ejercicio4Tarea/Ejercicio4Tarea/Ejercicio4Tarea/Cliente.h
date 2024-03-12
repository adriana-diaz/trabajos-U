#pragma once
#include <string>
using namespace std;

class Cliente {
private:
    string nombre;
    string cedula;

public:
    Cliente(string nombre, string cedula);


    string getNombre();
    string getCedula();
};
