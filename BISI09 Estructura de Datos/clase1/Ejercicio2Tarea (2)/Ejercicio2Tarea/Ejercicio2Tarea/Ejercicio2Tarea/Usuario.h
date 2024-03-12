#pragma once
#include <string>
using namespace std;

class Usuario {
private:
    string nombre;
    string apellidos;
    string domicilio;
    string email;
    string cedula;

public:
    Usuario(string nombre, string apellidos, string domicilio, string email, string cedula);
    void setNombre(string nombre);
    string getNombre();
    void setApellidos(string apellidos);
    string getApellidos();
    void setDomicilio(string domicilio);
    string getDomicilio();
    void setEmail(string email);
    string getEmail();
    void setCedula(string cedula);
    string getCedula();
};
