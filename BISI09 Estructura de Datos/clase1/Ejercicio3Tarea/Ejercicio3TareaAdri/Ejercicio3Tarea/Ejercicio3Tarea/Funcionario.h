#pragma once
#include <string>
using namespace std;

class Funcionario {
private:
    string nombre;
    string cedula;
    string direccion;
    string fechaNacimiento;
    string genero;
    string perfilAcceso;
    string nombreUsuario;
    string claveAcceso;

public:
    Funcionario(string nombre, string cedula, string direccion, string fechaNacimiento, string genero, string perfilAcceso, string nombreUsuario, string claveAcceso);

    
    string getNombre();
    string getCedula();
    string getDireccion();
    string getFechaNacimiento();
    string getGenero();
    string getPerfilAcceso();
    string getNombreUsuario();
    string getClaveAcceso();

   
    void setNombre(string nombre);
    void setCedula(string cedula);
    void setDireccion(string direccion);
    void setFechaNacimiento(string fechaNacimiento);
    void setGenero(string genero);
    void setPerfilAcceso(string perfilAcceso);
    void setNombreUsuario(string nombreUsuario);
    void setClaveAcceso(string claveAcceso);
};
