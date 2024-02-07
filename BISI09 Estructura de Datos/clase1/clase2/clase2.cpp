// clase2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <cstdio>
#include <string>
#include <algorithm>

//cin>>//get info//
//cout>>//print info//

int main()
{
    float num1;
    float num2;

    std::cout << "Escriba el primer numero: ";
    std::cin >> num1;

    std::cout << "Escriba el segundo numero: ";
    std::cin >> num2;

    if (num1 > num2)
        std::cout << num1 << " es mayor" << std::endl;
    else if (num2 > num1)
        std::cout << num2 << " es mayor" << std::endl;
    else
        std::cout << "Ambos números son iguales." << std::endl;

}

void ejercicio1() {

    std::string nombre;    
    int edad;
    int telefono;

    std::cout << "Ingrese nombre: ";
    std::getline(std::cin, nombre);

    std::cout << "Ingrese edad: ";
    std::cin >> edad;
    std::cout << "Ingrese número de teléfono: ";
    std::cin >> telefono;

    std::cout << "Nombre: " << nombre << "\nEdad: " << edad << "\nTeléfono: " << telefono << std::endl;
    
}

void ejercicio2() {

        double a, b, c, d, e, f;
        a = 1;
        b = 8;
        c = 3;
        d = 9;
        e = 5;
        f = 1;
        double resultado = (a + (b / c)) / (d + (e / f));

        std::cout << "El resultado es: " << resultado << std::endl;
    }

void ejercicio3(){
    float num1;
    float num2;

    std::cout << "Escriba el primer número: ";
    std::cin >> num1;
    std::cout << "Escriba el segundo número: ";
    std::cin >> num2;

    std::cout << "La suma es: " << num1 + num2 << "\nResta: " << num1 - num2 << "\nMultiplicación: " << num1 * num2
        << "\nDivisión: " << num1 / num2 << std::endl;

} void ejercicio4() {
    float precio, iva = 0.13;

    std::cout << "Ingrese el precio del producto que desea: ";
    std::cin >> precio;
    float precioConIVA = precio + (precio * iva);

    std::cout << "Precio del producto con IVA: " << precioConIVA << std::endl;


 }

void ejercicio5() {
    int edad;
    char genero;
    float altura;

    std::cout << "Ingrese la edad: ";
    std::cin >> edad;
    std::cout << "Ingrese el genero (Masculino/Femenino): ";
    std::cin >> genero;
    std::cout << "Ingrese la altura en cm: ";
    std::cin >> altura;

    std::cout << "Edad: " << edad << "\ngenero: " << genero << "\nAltura: " << altura << " metros" << std::endl;

}

void ejercicio6() {
    float num1;
    float num2;

    std::cout << "Escriba el primer numero: ";
    std::cin >> num1;

    std::cout << "Escriba el segundo numero: ";
    std::cin >> num2;

    if (num1 > num2)
        std::cout << num1 << " es mayor" << std::endl;
    else if (num2 > num1)
        std::cout << num2 << " es mayor" << std::endl;
    else
        std::cout << "Los numeros son iguales" << std::endl;
}

void ejercicio7() {

    int opcion;

    do {
        std::cout << "Menú:\n1. Cubo de un número\n2. Número par o impar\n3. Salir\nIngrese opción: ";
        std::cin >> opcion;
        switch (opcion) {
        case 1: {
            int num;
            std::cout << "Ingrese un numero: ";
            std::cin >> num;                
                std::cout << "El cubo de " << num << " es " << num * num * num << std::endl;
            break;
        }            case 2: {
            int num;
            std::cout << "Ingrese un numero: ";
            std::cin >> num;                if (num % 2 == 0)
                std::cout << num << " es par." << std::endl;
            else
                std::cout << num << " es impar." << std::endl;
            break;
        }
        case 3:
            std::cout << "Saliendo del programa." << std::endl;
            break;
        default:
            std::cout << "Opción invalida." << std::endl;
        }
    } while (opcion != 3);

}
void ejercicio8() {

    float saldoInicial = 1000;
    int opcion;
    float monto;

    do {
        std::cout << "Menú:\n1. Consultar saldo\n2. Retirar dinero\n3. Depositar dinero\n4. Salir\nIngrese opción: ";
        std::cin >> opcion;
        switch (opcion) {
        case 1:
            std::cout << "Saldo actual: $" << saldoInicial << std::endl;
            break;
        case 2:
            std::cout << "Ingrese la cantidad a retirar: $";
            std::cin >> monto;                if (monto <= saldoInicial) {
                saldoInicial -= monto;                    std::cout << "Retiro exitoso. Saldo restante: $" << saldoInicial << std::endl;
            }
            else {
                std::cout << "Saldo insuficiente." << std::endl;
            }                break;
        case 3:
            std::cout << "Ingrese la cantidad a depositar: $";
            std::cin >> monto;
            saldoInicial += monto;
            std::cout << "Deposito exitoso. Saldo actual: $" << saldoInicial << std::endl;
            break;
        case 4:
            std::cout << "Saliendo del programa." << std::endl;
            break;
        default:
            std::cout << "Opción inválida." << std::endl;
        }
    } while (opcion != 4);

}
void ejercicios9() {

    char caracter;

    std::cout << "Ingrese un carácter: ";
    std::cin >> caracter;
    if ((caracter >= 'a' && caracter <= 'z') || (caracter >= 'a' && caracter <= 'u')) {
        std::cout << "Es una vocal minúscula." << std::endl;
    }
    else if ((caracter >= 'A' && caracter <= 'Z') || (caracter >= 'A' && caracter <= 'U')) {
        std::cout << "Es una vocal mayúscula." << std::endl;
    }
    else {
        std::cout << "No es una vocal." << std::endl;
    }

}

void ejercicio10() {
    int num;

    std::cout << "Ingrese un entero del 1 al 10: ";
    std::cin >> num;
    std::cout << "Tabla de multiplicar del " << num << ":\n";
    for (int i = 1; i <= 10; ++i) {
        std::cout << num << " x " << i << " = " << num * i << std::endl;
    }
}

void ejercicio11() {

    int suma = 0;

    for (int i = 1; i <= 10; ++i) {
        suma += i * i;
    }
    std::cout << "La suma de los cuadrados de los 10 primeros enteros es: " << suma << std::endl;

}

void ejercicio12() {

    int limite, a = 0, b = 1, c;

    std::cout << "Ingrese el limite para la serie Fibonacci: ";
    std::cin >> limite;
    std::cout << "Serie Fibonacci hasta " << limite << ":\n";

    while (a <= limite) {
        std::cout << a << " ";
        c = a + b;
        a = b;
        b = c;
    }

    std::cout << std::endl;

}

void ejercicio13() {

    float temperatura, sumaTemperaturas = 0;
    float tempMaxima = -273.15; 
    float tempMinima = 100000; 

    for (int i = 1; i <= 6; ++i) {
        std::cout << "Ingrese la temperatura " << i << " (en grados Celsius): ";
        std::cin >> temperatura;

        sumaTemperaturas += temperatura;

        if (temperatura > tempMaxima) {
            tempMaxima = temperatura;
        }

        if (temperatura < tempMinima) {
            tempMinima = temperatura;
        }
    }

    float temperaturaMedia = sumaTemperaturas / 6;

    std::cout << "Temperatura media del dia: " << temperaturaMedia << " °C\n";
    std::cout << "Temperatura mas alta: " << tempMaxima << " °C\n";
    std::cout << "Temperatura mas baja: " << tempMinima << " °C\n";

}

void ejercicio14() {
    int numero, contador = 0;

    do {
        std::cout << "Ingrese un numero (0 para salir): ";
        std::cin >> numero;
        if (numero > 0) {
            contador++;
        }

    } while (numero != 0);

    std::cout << "Numero de valores mayores que cero insertados: " << contador << std::endl;
}