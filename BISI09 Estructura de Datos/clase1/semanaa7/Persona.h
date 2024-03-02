#pragma once
#include <string>
using namespace std;
class Persona
{
protected:
	int id;
	string nombre;
	int edad;
public:
	Persona();
	Persona(int, string, int);
	void setId(int);
	int getId();
	void setNombre(string);
	string getNombre();
	void setEdad(int);
	int getEdad();
	void toString();
	void mostrar();
};

