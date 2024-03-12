#pragma once
#include <iostream>
#include <string>
using namespace std;
class Cliente

{
private:
    string nombre;
    string cedula;
    string fechaNacimiento;
    char sexo;

public:
    Cliente(string nombre, string cedula, string fechaNacimiento, char sexo);
    string getNombre() const;
    string getCedula() const;
    string getFechaNacimiento() const;
    char getSexo() const;
    void setNombre(string nombre);
    void setCedula(string cedula);
    void setFechaNacimiento(string fechaNacimiento);
    void setSexo(char sexo);
};

