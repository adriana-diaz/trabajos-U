// tarea1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
#include <iostream>
#include <string>
using namespace std;

int main()
{

}

void ejercicio1() {

int comida, descuento = 0;

float montoFinal = 0;

cout << "Bienvenido a Restaurante El GordiBueno" << endl;
cout << "Elija el tipo de comida que desea:" << endl;
cout << "1. Buffete (7,000)" << endl;
cout << "2. A la Carta (5,000)" << endl;
cin >> comida;

cout << "Es cliente frecuente? (responda 'si' o 'no')" << endl;
string frecuente;
cin >> frecuente;
if (frecuente == "si") {
    descuento = 20;
}

switch (comida) {
case 1:
    montoFinal = 7000 - (7000 * descuento / 100);
    break;
case 2:
    montoFinal = 5000 - (5000 * descuento / 100);
    break;
default:
    cout << "Opcion invalida, por favor dijite otra" << endl;
}


cout << "=================+=================" << endl;
cout << " Factura Restaurante El GordiBueno" << endl;
cout << "=================+=================" << endl;
if (descuento > 0) {
    cout << "Cliente frecuente: descuento del " << descuento << "% aplicado" << endl;
}
cout << "Modalidad de comida: ";
switch (comida) {
case 1:
    cout << "Buffete (7,000)" << endl;
    break;
case 2:
    cout << "A la Carta (5,000)" << endl;
    break;
}
cout << "Monto a pagar: " << montoFinal << endl;
cout << "==================================" << endl;
}

void ejercicios2() {
    float cantidadVendida = 0;

    cout << "Ingrese la cantidad vendida por el ejecutivo de ventas: ";
    cin >> cantidadVendida;
    float comision = 0;
    if (cantidadVendida >= 2000.01) {
        comision = cantidadVendida * 0.7;
    }
    else if (cantidadVendida >= 10000.01) {
        comision = cantidadVendida * 0.10;
    }
    else if (cantidadVendida >= 20000.00) {
        comision = cantidadVendida * 0.15;
    }
    cout << "La comisión del ejecutivo de ventas es de:" << comision << endl;
}
void ejercicio3() {
    int valor;
    cout << "escribe un valor: ";
    cin >> valor;
    cout << "Los 10 números divisibles por " << valor << " son:" << endl;
    for (int i = 1; i <= 10; i++) {
        if (i % valor == 0) {
            cout << i << " ";
        }
    }
    cout << endl;
}

void ejercicio4() {
    string paquete;
    char tieneservicioprevio;
    int mesesenmora;
    double montobase;
    cout << "Ingrese el paquete deseado (a/b/c): ";
    cin >> paquete;

    cout << "Tiene algun servicio previo ya? (si/no): ";
    cin >> tieneservicioprevio;

    if (paquete == "a") {
        montobase = 30;
    }
    else if (paquete == "b") {
        montobase = 50;
    }
    else if (paquete == "c") {
        montobase = 75;
    }
    else {
        cout << "Paquete no valido. Fin del programa." << endl;
    }

    if (tolower(tieneservicioprevio) == 's') {
        montobase *= 0.10;  
    }
    if (tolower(tieneservicioprevio) == 's') {
        cout << "Ingrese la cantidad de meses en mora: ";
        cin >> mesesenmora;

        montobase *= (1 + 0.13 * mesesenmora);
    }
    cout << "El monto a pagar por mes es: $" << montobase << endl;
}