#pragma once
#include <string>
using namespace std;

class Cliente {
private:
    string nombre;
    string cedula;
    string genero;
    string fechaNacimiento;
    string direccion;
    string dedicacionLaboral;
    double montoSolicitado;

public:
    Cliente(string nombre, string cedula, string genero, string fechaNacimiento, string direccion, string dedicacionLaboral, double montoSolicitado);

   
    string getNombre();
    void setNombre(string nombre);
    string getCedula();
    void setCedula(string cedula);
    string getGenero();
    void setGenero(string genero);
    string getFechaNacimiento();
    void setFechaNacimiento(string fechaNacimiento);
    void setDireccion(string direccion);
    string getDireccion();
    void setDedicacionLaboral(string dedicacionLaboral);
    string getDedicacionLaboral();
    void setMontoSolicitado(double montoSolicitado);
    double getMontoSolicitado();

};
