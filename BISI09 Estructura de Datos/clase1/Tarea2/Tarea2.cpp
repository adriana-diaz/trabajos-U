#include <iostream>
#include <string>
#include <sstream>
#include <algorithm>
using namespace std;

int main()
{
}
void ejercicio1() {
    int vector[8];

    cout << "digite 8 numeros:";
    for (int i = 0; i < 8; ++i) {
        cout << "Numero " << (i + 1) << ": ";
        cin >> vector[i];
    }

    sort(vector, vector + 8);

    cout << "Vector ordenado de menor a mayor: ";
    for (int i = 0; i < 8; ++i) {
        cout << vector[i] << " ";
    }
    cout << endl;
}

void ejercicio2() {
    int vector[8];

    cout << "Introduce 8 numeros: ";
    for (int i = 0; i < 8; ++i) {
        cout << "Numero " << (i + 1) << ": ";
        cin >> vector[i];
    }

    sort(vector, vector + 8);

    bool anagrama = true;

    for (int i = 1; i < 8; ++i) {
        if (vector[i] != vector[0]) {
            anagrama = false;
            break;
        }
    }
    if (anagrama) {
        cout << "Los numeros son anagrama" << endl;
    }
    else {
        cout << "Los numeros no son anagrama" << endl;
    }
}


void ejercicio3() {
    int vector[8];

    cout << "Introduce 8 numeros:";
    for (int i = 0; i < 8; ++i) {
        cout << "Numero" << (i + 1) << ": ";
        cin >> vector[i];
    }

    int inicio = 0;
    int fin = 7;
    bool esPalindromo = true;

    while (inicio < fin) {
        stringstream ss;
        ss << vector[fin];
        string s = ss.str();
        reverse(s.begin(), s.end());
        int invertido = stoi(s);

        if (vector[inicio] != invertido) {
            esPalindromo = false;
            break;
        }
        inicio++;
        fin--;
    }

    if (esPalindromo) {
        cout << "el vector es palindromo" << endl;
    }
    else {
        cout << "el vector no es palindromo" << endl;
    
}