#include "Hotel.h"
#include <iostream>
#include <ctime>
#include "ListaEnlazada.h"

// Función para obtener la especialización válida
std::string obtenerEspecializacionValida() {
    std::string especializacion;
    bool esValida = false;

    // Ciclo para solicitar la especialización hasta que sea válida
    while (!esValida) {
        std::cout << "Ingrese la especializacion (M=Montanoso, N=Negocios, P=Playero o T=Tematico): ";
        std::cin >> especializacion;

        // Verificar si la especialización es válida
        char primeraLetraEspecializacion = especializacion[0];
        if (primeraLetraEspecializacion == 'M' || primeraLetraEspecializacion == 'N' || primeraLetraEspecializacion == 'P' || primeraLetraEspecializacion == 'T') {
            esValida = true;
        }
        else {
            std::cerr << "Error: Especializacion no valida. Debe ser M=Montanoso, N=Negocios, P=Playero o T=Tematico." << std::endl;
        }
    }

    return especializacion;
}

// Constructor
Hotel::Hotel(std::string nombre, std::string pais, std::string especializacion, int cantidadHabitaciones)
    : nombre(nombre), pais(pais), especializacion(especializacion), cantidadHabitaciones(cantidadHabitaciones) {
    generarCodigo();
}

// Método para generar el código de hotel según las especificaciones
void Hotel::generarCodigo() {
    // Verificar si la cadena especializacion no está vacía
    if (!especializacion.empty()) {
        // Obtener el año actual
        time_t now;
        time(&now);
        tm timeinfo;
        localtime_s(&timeinfo, &now);
        int anioActual = 1900 + timeinfo.tm_year;

        // Generar dos números aleatorios entre 10 y 99
        static_cast<unsigned int>(time(NULL));
        int numeroAleatorio = rand() % 90 + 10; // Número aleatorio entre 10 y 99

        // Construir el código del hotel
        codigo = especializacion[0] + std::to_string(anioActual) + std::to_string(numeroAleatorio);
    }
    else {
        // Si la cadena especializacion está vacía, asigna un valor predeterminado al código
        codigo = "CodigoNoValido";
    }
}


// Getters
std::string Hotel::getCodigo() const {
    return codigo;
}

std::string Hotel::getNombre() const {
    return nombre;
}

std::string Hotel::getPais() const {
    return pais;
}

std::string Hotel::getEspecializacion() const {
    return especializacion;
}

int Hotel::getCantidadHabitaciones() const {
    return cantidadHabitaciones;
}

// Setters
void Hotel::setNombre(std::string nombre) {
    this->nombre = nombre;
}

void Hotel::setPais(std::string pais) {
    this->pais = pais;
}

void Hotel::setEspecializacion(std::string especializacion) {
    this->especializacion = especializacion;
}

void Hotel::setCantidadHabitaciones(int cantidadHabitaciones) {
    this->cantidadHabitaciones = cantidadHabitaciones;
}

std::ostream& operator<<(std::ostream& os, const Hotel& hotel) {
    os << "Codigo: " << hotel.codigo << std::endl;
    os << "Nombre: " << hotel.nombre << std::endl;
    os << "Pais: " << hotel.pais << std::endl;
    os << "Especializacion: " << hotel.especializacion << std::endl;
    os << "Cantidad de habitaciones: " << hotel.cantidadHabitaciones << std::endl;
    return os;
}
