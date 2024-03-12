#include "Profesor.h"

Profesor::Profesor(string nombre, string apellidos, string domicilio, string email, string cedula, string tipoTitularidad, int cursosImpartidos) : Usuario(nombre, apellidos, domicilio, email, cedula) {
    this->tipoTitularidad = tipoTitularidad;
    this->cursosImpartidos = cursosImpartidos;
}

string Profesor::getTipoTitularidad() {
    return tipoTitularidad;
}
int Profesor::getCursosImpartidos() {
    return cursosImpartidos;
}
void Profesor::setTipoTitularidad(string tipoTitularidad) {
    this->tipoTitularidad = tipoTitularidad;
}
void Profesor::setCursosImpartidos(int cursosImpartidos) {
    this->cursosImpartidos = cursosImpartidos;
}
double Profesor::calcularPago() {
    double pago = 0;
    if (tipoTitularidad == "tiempo completo") {
        pago = cursosImpartidos * 150000;
    }
    else if (tipoTitularidad == "tiempo parcial") {
        pago = cursosImpartidos * 150000 * 0.8; // 20% menos para ayudantes
    }
    return pago;
}
