#include <iostream>
#include <string>
#include <ctime>
#include "Hotel.h"
#include "Cliente.h"
#include "Reserva.h"
#include "ListaEnlazada.h"

using namespace std;

// Funciones para el módulo de Hoteles
void mostrarMenuHoteles();
void agregarHotel(ListaEnlazada<Hotel>& listaHoteles);
void mostrarTodosLosHoteles(ListaEnlazada<Hotel>& listaHoteles);
void buscarHotelPorCodigo(ListaEnlazada<Hotel>& listaHoteles);
void menuHoteles(ListaEnlazada<Hotel>& listaHoteles);

// Funciones para el módulo de Clientes
void mostrarMenuClientes();
void agregarCliente(ListaEnlazada<Cliente>& listaClientes);
void mostrarTodosLosClientes(ListaEnlazada<Cliente>& listaClientes);
void buscarClientePorCedula(ListaEnlazada<Cliente>& listaClientes);
void menuClientes(ListaEnlazada<Cliente>& listaClientes);

// Funciones para el módulo de Reservas
void mostrarMenuReservas();
void ingresarReserva(ListaEnlazada<Reserva>& listaReservas);
void visualizarTodasLasReservas(ListaEnlazada<Reserva>& listaReservas);
void buscarReservaPorCodigo(ListaEnlazada<Reserva>& listaReservas);
void actualizarReserva(ListaEnlazada<Reserva>& listaReservas);
void eliminarReserva(ListaEnlazada<Reserva>& listaReservas);
void menuReservas(ListaEnlazada<Reserva>& listaReservas);

// Funciones auxiliares
void mostrarMenu();
void limpiarListas(ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes, ListaEnlazada<Reserva>& listaReservas);

int main() {
    ListaEnlazada<Hotel> listaHoteles;
    ListaEnlazada<Cliente> listaClientes;
    ListaEnlazada<Reserva> listaReservas;

    int opcion;
    do {
        mostrarMenu();
        cin >> opcion;
        cin.ignore(); // Limpiar el buffer del teclado

        switch (opcion) {
        case 1:
            menuHoteles(listaHoteles);
            break;
        case 2:
            menuClientes(listaClientes);
            break;
        case 3:
            menuReservas(listaReservas);
            break;
        case 4:
            // Reiniciar la aplicación (limpiar todas las listas)
            limpiarListas(listaHoteles, listaClientes, listaReservas);
            cout << "¡Aplicación reiniciada con éxito!" << endl;
            break;
        case 5:
            // Acerca de
            cout << "Acerca de la aplicación:" << endl;
            cout << "Desarrollado por: [Tu nombre]" << endl;
            cout << "Universidad: [Nombre de tu universidad]" << endl;
            cout << "Curso: [Nombre del curso]" << endl;
            cout << "Profesora: [Nombre de la profesora]" << endl;
            cout << "Año: 2024" << endl;
            break;
        case 6:
            cout << "Saliendo de la aplicación..." << endl;
            break;
        default:
            cout << "Opción no válida. Por favor, ingrese una opción válida." << endl;
            break;
        }
    } while (opcion != 6);

    return 0;
}

// Implementaciones de las funciones auxiliares

void mostrarMenu() {
    cout << "---- Menú Principal ----" << endl;
    cout << "1. Hoteles" << endl;
    cout << "2. Clientes" << endl;
    cout << "3. Reservas" << endl;
    cout << "4. Reiniciar la aplicación" << endl;
    cout << "5. Acerca de" << endl;
    cout << "6. Salir" << endl;
    cout << "Ingrese su opción: ";
}

void limpiarListas(ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes, ListaEnlazada<Reserva>& listaReservas) {
    listaHoteles.limpiar();
    listaClientes.limpiar();
    listaReservas.limpiar();
}

// Implementaciones de las funciones del módulo de Hoteles

void mostrarMenuHoteles() {
    cout << "---- Menú Hoteles ----" << endl;
    cout << "1. Agregar hotel" << endl;
    cout << "2. Mostrar todos los hoteles" << endl;
    cout << "3. Búsqueda por código de hotel" << endl;
    cout << "4. Volver al menú principal" << endl;
    cout << "Ingrese su opción: ";
}

void agregarHotel(ListaEnlazada<Hotel>& listaHoteles) {
    string codigo, nombre, pais, especializacion;
    int cantidadHabitaciones;

    cout << "Ingrese el código del hotel: ";
    getline(cin, codigo);
    cout << "Ingrese el nombre del hotel: ";
    getline(cin, nombre);
    cout << "Ingrese el país del hotel: ";
    getline(cin, pais);
    cout << "Ingrese la especialización del hotel: ";
    getline(cin, especializacion);
    cout << "Ingrese la cantidad de habitaciones del hotel: ";
    cin >> cantidadHabitaciones;

    Hotel nuevoHotel(codigo, nombre, pais, especializacion, cantidadHabitaciones);
    listaHoteles.agregar(nuevoHotel);
    cout << "Hotel agregado correctamente." << endl;
}

void mostrarTodosLosHoteles(ListaEnlazada<Hotel>& listaHoteles) {
    cout << "---- Todos los Hoteles ----" << endl;
    listaHoteles.mostrar();
    cout << "Mostrando todos los hoteles..." << endl;
}

void buscarHotelPorCodigo(ListaEnlazada<Hotel>& listaHoteles) {
    string codigo;
    cout << "Ingrese el código del hotel a buscar: ";
    getline(cin, codigo);

    Nodo<Hotel>* hotelEncontrado = listaHoteles.buscar(codigo);
    if (hotelEncontrado != nullptr) {
        cout << "Hotel encontrado:" << endl;
        cout << "Código: " << hotelEncontrado->dato.getCodigo() << endl;
        cout << "Nombre: " << hotelEncontrado->dato.getNombre() << endl;
        cout << "País: " << hotelEncontrado->dato.getPais() << endl;
        cout << "Especialización: " << hotelEncontrado->dato.getEspecializacion() << endl;
        cout << "Cantidad de habitaciones: " << hotelEncontrado->dato.getCantidadHabitaciones() << endl;
    }
    else {
        cout << "No se encontró ningún hotel con el código ingresado." << endl;
    }
}

void menuHoteles(ListaEnlazada<Hotel>& listaHoteles) {
    int opcion;
    do {
        mostrarMenuHoteles();
        cin >> opcion;
        cin.ignore(); // Limpiar el buffer del teclado

        switch (opcion) {
        case 1:
            agregarHotel(listaHoteles);
            break;
        case 2:
            mostrarTodosLosHoteles(listaHoteles);
            break;
        case 3:
            buscarHotelPorCodigo(listaHoteles);
            break;
        case 4:
            cout << "Volviendo al menú principal..." << endl;
            break;
        default:
            cout << "Opción no válida. Por favor, ingrese una opción válida." << endl;
            break;
        }
    } while (opcion != 4);
}

void agregarCliente(ListaEnlazada<Cliente>& listaClientes) {
    string cedula, nombre, metodoPago, tipoCliente, telefono;

    cout << "Ingrese el número de cédula del cliente: ";
    getline(cin, cedula);
    cout << "Ingrese el nombre del cliente: ";
    getline(cin, nombre);
    cout << "Ingrese el método de pago del cliente (débito/crédito): ";
    getline(cin, metodoPago);
    cout << "Ingrese el tipo de cliente (Regular/VIP/Socio): ";
    getline(cin, tipoCliente);
    cout << "Ingrese el número de teléfono del cliente: ";
    getline(cin, telefono);

    Cliente nuevoCliente( "", cedula, nombre, metodoPago, tipoCliente, telefono);
    listaClientes.agregar(nuevoCliente);
    cout << "Cliente agregado correctamente." << endl;
}

void ingresarReserva(ListaEnlazada<Reserva>& listaReservas) {
    string codigo, fechaInicio, fechaFin, codigoHotel, cedulaCliente;

    cout << "Ingrese el código de la reserva: ";
    getline(cin, codigo);
    cout << "Ingrese la fecha de inicio de la reserva (YYYY-MM-DD): ";
    getline(cin, fechaInicio);
    cout << "Ingrese la fecha de fin de la reserva (YYYY-MM-DD): ";
    getline(cin, fechaFin);
    cout << "Ingrese el código del hotel: ";
    getline(cin, codigoHotel);
    cout << "Ingrese la cédula del cliente: ";
    getline(cin, cedulaCliente);

    Reserva nuevaReserva(codigo, fechaInicio, fechaFin, codigoHotel, cedulaCliente);
    listaReservas.agregar(nuevaReserva);
    cout << "Reserva ingresada correctamente." << endl;
}

void visualizarTodasLasReservas(ListaEnlazada<Reserva>& listaReservas) {
    cout << "---- Todas las Reservas ----" << endl;
    listaReservas.mostrar();
}

void buscarReservaPorCodigo(ListaEnlazada<Reserva>& listaReservas) {
    string codigo;
    cout << "Ingrese el código de la reserva a buscar: ";
    getline(cin, codigo);

    Nodo<Reserva>* reservaEncontrada = listaReservas.buscar(codigo);
    if (reservaEncontrada != nullptr) {
        cout << "Reserva encontrada:" << endl;
        cout << "Código: " << reservaEncontrada->dato.getCodigo() << endl;
        cout << "Fecha de inicio: " << reservaEncontrada->dato.getFechaInicio() << endl;
        cout << "Fecha de fin: " << reservaEncontrada->dato.getFechaFin() << endl;
        cout << "Código de hotel: " << reservaEncontrada->dato.getCodigoHotel() << endl;
        cout << "Cédula del cliente: " << reservaEncontrada->dato.getCedulaCliente() << endl;
    }
    else {
        cout << "No se encontró ninguna reserva con el código ingresado." << endl;
    }
}

void actualizarReserva(ListaEnlazada<Reserva>& listaReservas) {
    string codigo, nuevaFechaInicio, nuevaFechaFin;

    cout << "Ingrese el código de la reserva a actualizar: ";
    getline(cin, codigo);
    cout << "Ingrese la nueva fecha de inicio de la reserva (YYYY-MM-DD): ";
    getline(cin, nuevaFechaInicio);
    cout << "Ingrese la nueva fecha de fin de la reserva (YYYY-MM-DD): ";
    getline(cin, nuevaFechaFin);

    Nodo<Reserva>* reservaEncontrada = listaReservas.buscar(codigo);
    if (reservaEncontrada != nullptr) {
        reservaEncontrada->dato.setFechaInicio(nuevaFechaInicio);
        reservaEncontrada->dato.setFechaFin(nuevaFechaFin);
        cout << "Reserva actualizada correctamente." << endl;
    }
    else {
        cout << "No se encontró ninguna reserva con el código ingresado." << endl;
    }
}

void eliminarReserva(ListaEnlazada<Reserva>& listaReservas) {
    string codigo;
    cout << "Ingrese el código de la reserva a eliminar: ";
    getline(cin, codigo);

    listaReservas.eliminar(codigo); // Eliminar la reserva

    cout << "Reserva eliminada correctamente." << endl; // Mensaje de confirmación
}

void menuReservas(ListaEnlazada<Reserva>& listaReservas) {
    int opcion;
    do {
        mostrarMenuReservas();
        cin >> opcion;
        cin.ignore(); // Limpiar el buffer del teclado

        switch (opcion) {
        case 1:
            ingresarReserva(listaReservas);
            break;
        case 2:
            visualizarTodasLasReservas(listaReservas);
            break;
        case 3:
            buscarReservaPorCodigo(listaReservas);
            break;
        case 4:
            actualizarReserva(listaReservas);
            break;
        case 5:
            eliminarReserva(listaReservas);
            break;
        case 6:
            cout << "Volviendo al menú principal..." << endl;
            break;
        default:
            cout << "Opción no válida. Por favor, ingrese una opción válida." << endl;
            break;
        }
    } while (opcion != 6);
}

// Implementación de la función menuClientes
void menuClientes(ListaEnlazada<Cliente>& listaClientes) {
    int opcion;
    do {
        mostrarMenuClientes();
        cin >> opcion;
        cin.ignore(); // Limpiar el buffer del teclado

        switch (opcion) {
        case 1:
            agregarCliente(listaClientes);
            break;
        case 2:
            mostrarTodosLosClientes(listaClientes);
            break;
        case 3:
            buscarClientePorCedula(listaClientes);
            break;
        case 4:
            cout << "Volviendo al menú principal..." << endl;
            break;
        default:
            cout << "Opción no válida. Por favor, ingrese una opción válida." << endl;
            break;
        }
    } while (opcion != 4);
}

// Implementación de la función mostrarMenuReservas
void mostrarMenuReservas() {
    cout << "---- Menú Reservas ----" << endl;
    cout << "1. Ingresar reserva" << endl;
    cout << "2. Visualizar todas las reservas" << endl;
    cout << "3. Búsqueda por código de reserva" << endl;
    cout << "4. Actualizar reserva" << endl;
    cout << "5. Eliminar reserva" << endl;
    cout << "6. Volver al menú principal" << endl;
    cout << "Ingrese su opción: ";
}
void mostrarMenuClientes() {
    cout << "---- Menú Clientes ----" << endl;
    cout << "1. Agregar cliente" << endl;
    cout << "2. Mostrar todos los clientes" << endl;
    cout << "3. Búsqueda por número de cédula" << endl;
    cout << "4. Volver al menú principal" << endl;
    cout << "Ingrese su opción: ";
}

void mostrarTodosLosClientes(ListaEnlazada<Cliente>& listaClientes) {
    cout << "---- Todos los Clientes ----" << endl;
    listaClientes.mostrar();
}

void buscarClientePorCedula(ListaEnlazada<Cliente>& listaClientes) {
    string cedula;
    cout << "Ingrese el número de cédula del cliente a buscar: ";
    getline(cin, cedula);

    Nodo<Cliente>* clienteEncontrado = listaClientes.buscar(cedula);
    if (clienteEncontrado != nullptr) {
        cout << "Cliente encontrado:" << endl;
        cout << "Número de cédula: " << clienteEncontrado->dato.getCedula() << endl;
        cout << "Nombre: " << clienteEncontrado->dato.getNombre() << endl;
        cout << "Método de pago: " << clienteEncontrado->dato.getMetodoPago() << endl;
        cout << "Tipo de cliente: " << clienteEncontrado->dato.getTipoCliente() << endl;
        cout << "Número de teléfono: " << clienteEncontrado->dato.getTelefono() << endl;
    }
    else {
        cout << "No se encontró ningún cliente con el número de cédula ingresado." << endl;
    }
}