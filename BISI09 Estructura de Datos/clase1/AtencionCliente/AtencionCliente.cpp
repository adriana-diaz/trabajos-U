#include <iostream>
#include <queue>
#include "Cliente.h"
#include "Equipo.h"
#include "Incidente.h"

using namespace std;

void agregarIncidente(queue<Incidente>& incidentes, int& consecutivo, const queue<Cliente>& clientes, const queue<Equipo>& equipos) {
    int id_cliente; 
    int placa_equipo;
    string descripcion;
    cout << "Ingrese el ID del cliente: ";
    cin >> id_cliente; 

    bool clienteEncontrado = false;
    queue<Cliente> inicClientes = clientes;
    while (!inicClientes.empty()) {
        if (inicClientes.front().getId() == id_cliente) { 
            clienteEncontrado = true;
            break;
        }
        inicClientes.pop();
    }

    if (!clienteEncontrado) {
        cout << "El ID del cliente ingresado no es correcto." << endl;
        return;
    }

    cout << "Ingrese la placa del equipo: ";
    cin >> placa_equipo;

    bool equipoEncontrado = false;
    queue<Equipo> inicEquipos = equipos;
    while (!inicEquipos.empty()) {
        if (inicEquipos.front().getPlaca() == placa_equipo) {
            equipoEncontrado = true;
            break;
        }
        inicEquipos.pop();
    }

    if (!equipoEncontrado) {
        cout << "El numero de placa del equipo ingresado no es correcto." << endl;
        return;
    }

    cin.ignore();
    cout << "Ingrese la descripcion del incidente: ";
    getline(cin, descripcion);
    incidentes.push(Incidente(consecutivo++, id_cliente, placa_equipo, descripcion));
    cout << "Incidente agregado correctamente." << endl;
}

void atenderIncidente(queue<Incidente>& incidentes) {
    if (incidentes.empty()) {
        cout << "No hay incidentes pendientes para atender." << endl;
        return;
    }
    cout << "Atendiendo incidente: " << incidentes.front().getDescripcion() << endl;
    incidentes.pop();
}

void verIncidentes(const queue<Incidente>& incidentes) {
    if (incidentes.empty()) {
        cout << "No hay incidentes registrados." << endl;
        return;
    }
    cout << "Lista de incidentes:" << endl;
    queue<Incidente> inci = incidentes; //cola se llama inci
    while (!inci.empty()) {
        const Incidente& incidente = inci.front();
        cout << "Consecutivo: " << incidente.getConsecutivo() << ", ID Cliente: " << incidente.getIdCliente()
            << ", Placa Equipo: " << incidente.getPlacaEquipo() << ", Descripcion: " << incidente.getDescripcion() << endl;
        inci.pop();
    }
}

void verCantidadIncidentes(const queue<Incidente>& incidentes) {
    cout << "Cantidad de incidentes registrados: " << incidentes.size() << endl;
}
void verPrimerIncidente(const queue<Incidente>& incidentes) {
    if (incidentes.empty()) {
        cout << "No hay incidentes registrados." << endl;
        return;
    }
    const Incidente& primer = incidentes.front();
    cout << "Primer incidente registrado:" << endl;
    cout << "Consecutivo: " << primer.getConsecutivo() << ", ID Cliente: " << primer.getIdCliente()
        << ", Placa Equipo: " << primer.getPlacaEquipo() << ", Descripcion: " << primer.getDescripcion() << endl;
}

void verUltimoIncidente(const queue<Incidente>& incidentes) {
    if (incidentes.empty()) {
        cout << "No hay incidentes registrados." << endl;
        return;
    }
    const Incidente& ultimo = incidentes.back();
    cout << "Último incidente registrado:" << endl;
    cout << "Consecutivo: " << ultimo.getConsecutivo() << ", ID Cliente: " << ultimo.getIdCliente()
        << ", Placa Equipo: " << ultimo.getPlacaEquipo() << ", Descripcion: " << ultimo.getDescripcion() << endl;
}


int main() {
    // Arreglos de clientes y equipos
    queue<Cliente> clientes;
    clientes.push(Cliente(123456789, "Juan", "123456789", "Ventas"));
    clientes.push(Cliente(234564242, "Maria", "987654321", "Soporte"));
    clientes.push(Cliente(308534566, "Pedro", "98234798", "Recursos Humanos"));
    clientes.push(Cliente(458301034, "Laura", "49683745", "Contabilidad"));
    clientes.push(Cliente(523254567, "Carlos", "78695302", "Ventas"));
    clientes.push(Cliente(612345666, "Ana", "6785932", "Soporte"));
    clientes.push(Cliente(123456788, "Sofia", "03798721", "Recursos Humanos"));
    clientes.push(Cliente(825676544, "Diego", "34685329", "Contabilidad"));
    clientes.push(Cliente(909876544, "Elena", "26278590", "Ventas"));
    clientes.push(Cliente(123456780, "Daniel", "09825784", "Soporte"));


    queue<Equipo> equipos;
    equipos.push(Equipo(101, "PC", "Dell", "Oficina 1"));
    equipos.push(Equipo(102, "Laptop", "HP", "Oficina 2"));
    equipos.push(Equipo(103, "Impresora", "Epson", "Oficina 3"));
    equipos.push(Equipo(104, "Servidor", "IBM", "Sala de servidores"));
    equipos.push(Equipo(105, "Router", "Cisco", "Sala de redes"));
    equipos.push(Equipo(106, "Switch", "Juniper", "Sala de redes"));
    equipos.push(Equipo(107, "Telefono IP", "Polycom", "Oficina 4"));
    equipos.push(Equipo(108, "Proyector", "BenQ", "Sala de reuniones"));
    equipos.push(Equipo(109, "Escaner", "Canon", "Oficina 5"));
    equipos.push(Equipo(110, "Tablet", "Samsung", "Oficina 6"));

    queue<Incidente> incidentes;
    // Menú de incidentes


    int consecutivo = incidentes.size() + 1;
    int opcion;
    do {
        cout << "->->Menu<-<-\n";
        cout << "1. Agregar incidente\n";
        cout << "2. Atender incidente\n";
        cout << "3. Ver incidentes\n";
        cout << "4. Ver cantidad de incidentes\n";
        cout << "5. Ver primer incidente\n";
        cout << "6. Ver ultimo incidente\n";
        cout << "7. Salir\n";
        cout << "Ingrese una opcion: ";
        cin >> opcion;
        switch (opcion) {
        case 1:
            agregarIncidente(incidentes, consecutivo, clientes, equipos);
            break;
        case 2:
            atenderIncidente(incidentes);
            break;
        case 3:
            verIncidentes(incidentes);
            break;
        case 4:
            verCantidadIncidentes(incidentes);
            break;
        case 5:
            verPrimerIncidente(incidentes);
            break;
        case 6:
             verUltimoIncidente(incidentes);
            break;
        case 7:
            cout << "Saliendo del programa.\n";
            break;
        default:
            cout << "Opcion no valida. Por favor, ingrese una opcion valida.\n";
        }
    } while (opcion != 0);

    return 0;
}