#include <iostream> //entrada y salida de datos
#include <string> 
#include <ctime> 
#include "Hotel.h" //Inicialización de las listas:Cliente,Reserva y ListaEnlazada, y Hotel
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
void ingresarReserva(ListaEnlazada<Reserva>& listaReservas, ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes);
void visualizarTodasLasReservas(ListaEnlazada<Reserva>& listaReservas);
void buscarReservaPorCodigo(ListaEnlazada<Reserva>& listaReservas);
void actualizarReserva(ListaEnlazada<Reserva>& listaReservas);
void eliminarReserva(ListaEnlazada<Reserva>& listaReservas);
void menuReservas(ListaEnlazada<Reserva>& listaReservas, ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes);

// Funciones auxiliares
void mostrarMenu(); // Muestra el menú principal.
void limpiarListas(ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes, ListaEnlazada<Reserva>& listaReservas); //Limpia todas las listas de hoteles, clientes y reservas.
char obtenerEspecializacionValida(); //Solicita al usuario la especialización del hotel y valida la entrada.
string generarCodigoReserva(); //Genera un código de reserva aleatorio.

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
            menuReservas(listaReservas, listaHoteles, listaClientes);
            break;
        case 4:
            // Reiniciar la aplicación (limpiar todas las listas)
            limpiarListas(listaHoteles, listaClientes, listaReservas);
            cout << "Aplicacion reiniciada con exito" << endl;
            break;
        case 5:
            // Acerca de
            cout << "Acerca de la aplicacion:" << endl;
            cout << "Desarrollado por: [Adriana Diaz & Daniel El Hage]" << endl;
            cout << "Universidad: [Universidad Latina de Costa Rica]" << endl;
            cout << "Curso: [Estructura de datos]" << endl;
            cout << "Profesora: [Adriana Rubio Escobar]" << endl;
            cout << "Ano: 2024" << endl;
            break;
        case 6:
            cout << "Saliendo de la aplicacion..." << endl;
            break;
        default:
            cout << "Opcion no valida. Por favor, ingrese una opcion valida." << endl;
            break;
        }
    } while (opcion != 6);

    return 0;
}

// Implementaciones de las funciones auxiliares
void mostrarMenu() {
    cout << "---- Menu Principal ----" << endl;
    cout << "1. Hoteles" << endl;
    cout << "2. Clientes" << endl;
    cout << "3. Reservas" << endl;
    cout << "4. Reiniciar la aplicacion" << endl;
    cout << "5. Acerca de" << endl;
    cout << "6. Salir" << endl;
    cout << "Ingrese su opcion: ";
}

void limpiarListas(ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes, ListaEnlazada<Reserva>& listaReservas) {
    listaHoteles.limpiar();
    listaClientes.limpiar();
    listaReservas.limpiar();
}

// Implementaciones de las funciones del modulo de Hoteles

void mostrarMenuHoteles() {
    cout << "---- Menu Hoteles ----" << endl;
    cout << "1. Agregar hotel" << endl;
    cout << "2. Mostrar todos los hoteles" << endl;
    cout << "3. Busqueda por codigo de hotel" << endl;
    cout << "4. Volver al menu principal" << endl;
    cout << "Ingrese su opcion: ";
}

char obtenerEspecializacionValida() {
    char especializacion;
    bool especializacionValida = false;
    while (!especializacionValida) {
        cout << "Ingrese la especializacion del hotel (M = Montanoso, N = Negocios, P = Playero, T = Tematico): ";
        cin >> especializacion;
        switch (especializacion) {
        case 'M':
        case 'N':
        case 'P':
        case 'T':
            especializacionValida = true;
            break;
        default:
            cerr << "Especializacion no valida. Por favor, ingrese una especializacion valida." << endl;
            break;
        }
    }
    return especializacion;
}

void agregarHotel(ListaEnlazada<Hotel>& listaHoteles) { //agregarlo a la lista de hoteles existente en el sistema
    string nombre, pais, especializacionString;
    char especializacionChar;
    int cantidadHabitaciones;

    cout << "Ingrese el nombre del hotel: ";
    cin.ignore(); // Limpiar el buffer del teclado antes de leer la cadena (caracteres y lienas adicionales)
    getline(cin, nombre); // getLine para leer una línea completa de entrada
    cout << "Ingrese el pais del hotel: ";
    getline(cin, pais);

    // Llamada a obtenerEspecializacionValida() para obtener la especialización válida
    especializacionChar = obtenerEspecializacionValida();
    // Convertir el char en string
    especializacionString = string(1, especializacionChar); //toma un caracater para almacenar

    cout << "Ingrese la cantidad de habitaciones del hotel: ";
    cin >> cantidadHabitaciones;

    Hotel nuevoHotel(nombre, pais, especializacionString, cantidadHabitaciones);
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
    cout << "Ingrese el codigo del hotel a buscar: ";
    getline(cin, codigo);

    Nodo<Hotel>* hotelEncontrado = listaHoteles.buscar(codigo);
    if (hotelEncontrado != nullptr) { //si es encontrado se dezplasa la informacion
        cout << "Hotel encontrado:" << endl;
        cout << "Codigo: " << hotelEncontrado->dato.getCodigo() << endl;
        cout << "Nombre: " << hotelEncontrado->dato.getNombre() << endl;
        cout << "Pais: " << hotelEncontrado->dato.getPais() << endl;
        cout << "Especializacion: " << hotelEncontrado->dato.getEspecializacion() << endl;
        cout << "Cantidad de habitaciones: " << hotelEncontrado->dato.getCantidadHabitaciones() << endl;
    }
    else {
        cout << "No se encontro ningun hotel con el codigo ingresado." << endl;
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
            cout << "Volviendo al menu principal..." << endl;
            break;
        default:
            cout << "Opcion no valida. Por favor, ingrese una opcion valida." << endl;
            break;
        }
    } while (opcion != 4);
}


// Implementaciones de las funciones del modulo de Clientes

void mostrarMenuClientes() {
    cout << "---- Menu Clientes ----" << endl;
    cout << "1. Agregar cliente" << endl;
    cout << "2. Mostrar todos los clientes" << endl;
    cout << "3. Busqueda por numero de cedula" << endl;
    cout << "4. Volver al menu principal" << endl;
    cout << "Ingrese su opcion: ";
}

void agregarCliente(ListaEnlazada<Cliente>& listaClientes) {
    string cedula, nombre, metodoPago, tipoCliente, telefono;

    cout << "Ingrese el numero de cedula del cliente (10 digitos numericos): ";
    getline(cin, cedula);

    // Validar que la cédula tenga 10 dígitos y sean todos números
    if (cedula.length() != 10 || cedula.find_first_not_of("0123456789") != string::npos) {
        cout << "La cedula debe contener exactamente 10 digitos numericos. Intentelo de nuevo." << endl;
        return;
    }

    cout << "Ingrese el nombre del cliente: ";
    getline(cin, nombre);
    cout << "Ingrese el metodo de pago del cliente (debito/credito): ";
    getline(cin, metodoPago);
    cout << "Ingrese el tipo de cliente (Regular/VIP/Socio): ";
    getline(cin, tipoCliente);
    cout << "Ingrese el numero de telefono del cliente: ";
    getline(cin, telefono);

    Cliente nuevoCliente("",cedula, nombre, metodoPago, tipoCliente, telefono);
    listaClientes.agregar(nuevoCliente);
    cout << "Cliente agregado correctamente." << endl;
}

void mostrarTodosLosClientes(ListaEnlazada<Cliente>& listaClientes) {
    cout << "---- Todos los Clientes ----" << endl;
    listaClientes.mostrar();
}

void buscarClientePorCedula(ListaEnlazada<Cliente>& listaClientes) {
    string cedula;
    cout << "Ingrese el numero de cedula del cliente a buscar: ";
    getline(cin, cedula);

    Nodo<Cliente>* clienteEncontrado = listaClientes.buscarPorCedula(cedula);
    if (clienteEncontrado != nullptr) {
        cout << "Cliente encontrado:" << endl;
        cout << "Numero de cedula: " << clienteEncontrado->dato.getCedula() << endl;
        cout << "Nombre: " << clienteEncontrado->dato.getNombre() << endl;
        cout << "Metodo de pago: " << clienteEncontrado->dato.getMetodoPago() << endl;
        cout << "Tipo de cliente: " << clienteEncontrado->dato.getTipoCliente() << endl;
        cout << "Numero de telefono: " << clienteEncontrado->dato.getTelefono() << endl;
    }
    else {
        cout << "No se encontro ningun cliente con el numero de cedula ingresado." << endl;
    }
}

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
            cout << "Volviendo al menu principal..." << endl;
            break;
        default:
            cout << "Opcion no valida. Por favor, ingrese una opcion valida." << endl;
            break;
        }
    } while (opcion != 4);
}

// Implementaciones de las funciones del modulo de Reservas

string generarCodigoReserva() {
    // Generar un código de reserva aleatorio
    const string caracteres = "0123456789";
    const int longitud = 6;
    string codigoReserva = "";
    for (int i = 0; i < longitud; ++i) {
        codigoReserva += caracteres[rand() % caracteres.length()];
    }
    return codigoReserva;
}

void mostrarMenuReservas() {
    cout << "---- Menu Reservas ----" << endl;
    cout << "1. Ingresar reserva" << endl;
    cout << "2. Visualizar todas las reservas" << endl;
    cout << "3. Busqueda por codigo de reserva" << endl;
    cout << "4. Actualizar reserva" << endl;
    cout << "5. Eliminar reserva" << endl;
    cout << "6. Volver al menu principal" << endl;
    cout << "Ingrese su opcion: ";
}

void ingresarReserva(ListaEnlazada<Reserva>& listaReservas, ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes) {
    string fechaInicio, fechaFin, codigoHotel, cedulaCliente;

    cout << "Ingrese la fecha de inicio de la reserva (YYYY-MM-DD): ";
    getline(cin, fechaInicio);
    cout << "Ingrese la fecha de fin de la reserva (YYYY-MM-DD): ";
    getline(cin, fechaFin);

    cout << "Ingrese el codigo del hotel: ";
    getline(cin, codigoHotel);
    Nodo<Hotel>* hotel = listaHoteles.buscar(codigoHotel);
    if (hotel == nullptr) {
        cout << "No se encontro ningun hotel con el codigo ingresado." << endl;
        return;
    }
    cout << "Ingrese la cedula del cliente: ";
    getline(cin, cedulaCliente);

    Nodo<Cliente>* cliente = listaClientes.buscarPorCedula(cedulaCliente);
    if (cliente == nullptr) {
        cout << "No se encontro ningun cliente con la cedula ingresada." << endl;
        return;
    }

    // Calcular la diferencia de días entre la fecha de inicio y la fecha de fin
    // Convertir las fechas a enteros
    int anioInicio, mesInicio, diaInicio, anioFin, mesFin, diaFin;
    sscanf_s(fechaInicio.c_str(), "%d-%d-%d", &anioInicio, &mesInicio, &diaInicio);
    sscanf_s(fechaFin.c_str(), "%d-%d-%d", &anioFin, &mesFin, &diaFin);

    // Calcular la diferencia de días
    int diferenciaDias = 0;
    if (anioInicio <= anioFin && mesInicio <= mesFin && diaInicio <= diaFin) {
        // Asumiendo que los años, meses y días son válidos
        diferenciaDias = (anioFin - anioInicio) * 365 + (mesFin - mesInicio) * 30 + (diaFin - diaInicio);
    }

    // Mostrar la diferencia de días
    cout << "Numero de noches: " << diferenciaDias << endl;

    // Calcular el costo de la reserva
    double costoReserva = 0.0;

    // Tipo de hotel y tipo de cliente
    switch (hotel->dato.getEspecializacion()[0]) {
    case 'P':
        costoReserva = 120 * diferenciaDias;
        break;
    case 'M':
        costoReserva = 100 * diferenciaDias;
        break;
    case 'N':
        costoReserva = 85 * diferenciaDias;
        break;
    case 'T':
        costoReserva = 135 * diferenciaDias;
        break;
    default:
        cout << "Tipo de hotel no valido." << endl;
        return;
    }

    string tipoCliente = cliente->dato.getTipoCliente();
    if (tipoCliente == "Regular") {
        costoReserva *= 1.0; // No se aplica descuento
    }
    else if (tipoCliente == "VIP") {
        costoReserva *= 0.9; // Se aplica descuento del 10%
    }
    else if (tipoCliente == "Socio") {
        costoReserva *= 0.85; // Se aplica descuento del 15%
    }
    else {
        cout << "Tipo de cliente no valido." << endl;
        return;
    }

    // Mostrar el costo de la reserva
    cout << "Costo de la reserva: $" << costoReserva << endl;

    // Generar código de reserva
    srand((unsigned int)time(nullptr)); // Inicializar la semilla para números aleatorios
    string codigoReserva = "";
    const string caracteres = "0123456789";
    for (int i = 0; i < 6; ++i) {
        codigoReserva += caracteres[rand() % caracteres.size()];
    }

    // Crear la reserva
    Reserva nuevaReserva(codigoReserva, fechaInicio, fechaFin, codigoHotel, cedulaCliente);
    listaReservas.agregar(nuevaReserva);
    cout << "Reserva ingresada correctamente." << endl;
}

void visualizarTodasLasReservas(ListaEnlazada<Reserva>& listaReservas) {
    cout << "---- Todas las Reservas ----" << endl;
    listaReservas.mostrar();
}

void buscarReservaPorCodigo(ListaEnlazada<Reserva>& listaReservas) {
    string codigo;
    cout << "Ingrese el codigo de la reserva a buscar: ";
    getline(cin, codigo);

    Nodo<Reserva>* reservaEncontrada = listaReservas.buscar(codigo);
    if (reservaEncontrada != nullptr) {
        cout << "Reserva encontrada:" << endl;
        cout << "Codigo: " << reservaEncontrada->dato.getCodigo() << endl;
        cout << "Fecha de inicio: " << reservaEncontrada->dato.getFechaInicio() << endl;
        cout << "Fecha de fin: " << reservaEncontrada->dato.getFechaFin() << endl;
        cout << "Codigo del hotel: " << reservaEncontrada->dato.getCodigoHotel() << endl;
        cout << "Cedula del cliente: " << reservaEncontrada->dato.getCedulaCliente() << endl;
    }
    else {
        cout << "No se encontro ninguna reserva con el codigo ingresado." << endl;
    }
}

void actualizarReserva(ListaEnlazada<Reserva>& listaReservas) {
    string codigo, nuevaFechaInicio, nuevaFechaFin;

    cout << "Ingrese el codigo de la reserva a actualizar: ";
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
        cout << "No se encontro ninguna reserva con el codigo ingresado." << endl;
    }
}

void eliminarReserva(ListaEnlazada<Reserva>& listaReservas) {
    string codigo;
    cout << "Ingrese el codigo de la reserva a eliminar: ";
    getline(cin, codigo);

    listaReservas.eliminar(codigo); // Eliminar la reserva

    cout << "Reserva eliminada correctamente." << endl; // Mensaje de confirmación
}

void menuReservas(ListaEnlazada<Reserva>& listaReservas, ListaEnlazada<Hotel>& listaHoteles, ListaEnlazada<Cliente>& listaClientes) {
    int opcion;
    do {
        mostrarMenuReservas();
        cin >> opcion;
        cin.ignore(); // Limpiar el buffer del teclado

        switch (opcion) {
        case 1:
            ingresarReserva(listaReservas, listaHoteles, listaClientes);
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
            cout << "Volviendo al menu principal..." << endl;
            break;
        default:
            cout << "Opcion no valida. Por favor, ingrese una opcion valida." << endl;
            break;
        }
    } while (opcion != 6);
}
