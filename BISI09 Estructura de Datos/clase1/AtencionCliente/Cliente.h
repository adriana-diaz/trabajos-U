#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <iostream>
using namespace std;
class Cliente {
private:
    int id;
    string nombre;
    string telefono;
    string departamento;
public:
    string getNombre() const;
    int getId() const;
    string getTelefono() const;
    string getDepartamento() const;
    Cliente(int id, string nombre, string telefono, string departamento);
};

