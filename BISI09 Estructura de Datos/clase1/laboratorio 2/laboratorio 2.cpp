#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
int main()
{
  
}
void ejercicio1() {
    int vector[10] = { 1, 21, 3, 42, 5, 63, 7, 82, 95, 10 };
    int suma = 0;
    for (int i = 0; i < 10; ++i) {
        suma += vector[i];
    }
    cout << "La suma de los elementos del vector es: " << suma << endl;
}

void ejercicio2() {
    int vector[8];
    cout << "Introduce 8 numeros ";
    for (int i = 0; i < 8; ++i) {
        cin >> vector[i];//ingresar vector
    }

    int pares = 0, impares = 0;
    for (int i = 0; i < 8; ++i) {
        if (vector[i] % 2 == 0) {
            pares++;
        }
        else {
            impares++;
        }
    }
    cout << "Cantidad de numeros pares: " << pares << endl;
    cout << "Cantidad de numeros impares: " << impares << endl;
}

void ejercicio3() {
    vector<int> vector1(16);

    cout << "ingresa 16 números";
    for (int i = 0; i < 16; ++i) {
        cin >> vector1[i];
    }

    vector<int> vector2(8);
    sort(vector1.begin(), vector1.end(), greater<int>());
    copy_n(vector1.begin(), 8, vector2.begin());
    cout << "Los 8 números mayores del primer vector son: ";
    for (int num : vector2) {
        cout << num << " ";
    }
    cout << endl;
}


void ejercicio4() {
    vector<int> vector1(7);


    cout << "ingresa 7 numeros ";
    for (int i = 0; i < 7; ++i) {
        cin >> vector1[i];
    }
    auto maxElement = max_element(vector1.begin(), vector1.end()); //encontrar el elemento mayor


    cout << "El mayor elemento del vector es: " << *maxElement << endl;
}