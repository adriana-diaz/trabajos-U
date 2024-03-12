#include <iostream>
#include "Platino.h"
#include "Gold.h"

int main() {
   
    Platino clientePlatino("Adriana", "119320150", "Femenino", "30/03/05", "Heredia", "Estudiante", 10000);
    std::cout << "Interes para cliente Platino: " << clientePlatino.calcularInteres() << std::endl;

    
    Gold clienteGold("Paula", "98764718", "Femenino", "15/05/1985", "San Jose", "Empleado", 8000);
    std::cout << "Interes para cliente Gold: " << clienteGold.calcularInteres() << std::endl;

    return 0;
}
