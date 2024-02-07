// clase1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>


int main()
{
    
}

void codigo() {

    int a = 1;
    int b = 2;

    double resultado = static_cast<double>(a / b) + 1;
    std::cout << "el resultado es del 1er ejercicio es " << resultado << std::endl;



}

void codigo2() {

    int a = 1;
    int b = 2;
    int c = 3;
    int d = 4;

    double resultado = (a / b) / (c + d);
    std::cout << "el resultado del 2do ejercicio es: " << resultado << std::endl;



}

void codigo3() {

    int n1 = 120;
    int n2 = 300;

    double suma = n1 + n2;
    std::cout << "el resultado de la suma es:  " << suma << std::endl;
    double resta = n1 - n2;
    std::cout << "el resultado de la resta es:  " << resta << std::endl;
    double multiplicacion = n1 * n2;
    std::cout << "el resultado de la multiplicacion es:  " << multiplicacion << std::endl;
    double division = static_cast<double>(n1) / (n2);
    std::cout << "el resultado de la division es:  " << division << std::endl;

}

void codigo4() {
    int p = 7500;
        double pconIVA = p * 0.14;
    std::cout << "el resultado del precio con IVA es: " << pconIVA << std::endl;
}
// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
