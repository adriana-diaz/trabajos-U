#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <iostream>
using namespace std;
class Incidente{
private:
    int consecutivo;
    int id_cliente;
    int placa_equipo;
    string descripcion;
public:
    Incidente(int consecutivo, int id_cliente, int placa_equipo, string descripcion);
    int getConsecutivo() const;
    int getIdCliente() const;
    int getPlacaEquipo() const;
    string getDescripcion() const;
};

