#ifndef LISTAENLAZADA_H
#define LISTAENLAZADA_H
#include <iostream>
#include <string>
#include "Hotel.h" 

template <class T>
class Nodo {
public:
    T dato;
    Nodo<T>* siguiente;
    Nodo(T dato) : dato(dato), siguiente(nullptr) {}
};

template <class T>
class ListaEnlazada {
private:
    Nodo<T>* primero;
    Nodo<T>* ultimo;

public:
    ListaEnlazada();
    ~ListaEnlazada();
    void agregar(T dato);
    void mostrar();
    Nodo<T>* buscar(std::string clave);
    Nodo<T>* buscarPorCedula(std::string cedula);
    void eliminar(std::string clave);
    void limpiar();
};

template <class T>
ListaEnlazada<T>::ListaEnlazada() {
    primero = nullptr;
    ultimo = nullptr;
}

template <class T>
ListaEnlazada<T>::~ListaEnlazada() {
    limpiar();
}

template <class T>
void ListaEnlazada<T>::agregar(T dato) {
    Nodo<T>* nuevo = new Nodo<T>(dato);
    if (primero == nullptr) {
        primero = nuevo;
        ultimo = nuevo;
    }
    else {
        ultimo->siguiente = nuevo;
        ultimo = nuevo;
    }
}

template <class T>
void ListaEnlazada<T>::mostrar() {
    Nodo<T>* aux = primero;
    while (aux != nullptr) {
        // Imprimir los datos del nodo actual
        std::cout << aux->dato << std::endl;
        aux = aux->siguiente;
    }
}


template <class T>
Nodo<T>* ListaEnlazada<T>::buscar(std::string clave) {
    Nodo<T>* aux = primero;
    while (aux != nullptr) {
        if (aux->dato.getCodigo() == clave) {
            return aux;
        }
        aux = aux->siguiente;
    }
    return nullptr;
}

template <class T>
Nodo<T>* ListaEnlazada<T>::buscarPorCedula(std::string cedula) {
    Nodo<T>* aux = primero;
    while (aux != nullptr) {
        if (aux->dato.getCedula() == cedula) {
            return aux;
        }
        aux = aux->siguiente;
    }
    return nullptr;
}

template <class T>
void ListaEnlazada<T>::eliminar(std::string clave) {
    Nodo<T>* actual = primero;
    Nodo<T>* anterior = nullptr;
    while (actual != nullptr && actual->dato.getCodigo() != clave) {
        anterior = actual;
        actual = actual->siguiente;
    }
    if (actual != nullptr) {
        if (actual == primero) {
            primero = primero->siguiente;
        }
        else {
            anterior->siguiente = actual->siguiente;
        }
        if (actual == ultimo) {
            ultimo = anterior;
        }
        delete actual;
    }
}

template <class T>
void ListaEnlazada<T>::limpiar() {
    while (primero != nullptr) {
        Nodo<T>* temp = primero;
        primero = primero->siguiente;
        delete temp;
    }
    ultimo = nullptr;
}

#endif
