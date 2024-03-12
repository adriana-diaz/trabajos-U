#include <iostream>
#include "Alumno.h"
#include "Profesor.h"
#include "PersonalAdministrativo.h"

int main() {
    
    Alumno alumno("Adriana", "diaz", "heredia", "adrianadiaz@gmail.com", "11932016", 1234, 2);
    std::cout << "Nombre del alumno: " << alumno.getNombre() << std::endl;
    std::cout << "Cursos matriculados: " << alumno.getCursosMatriculados() << std::endl;

    Profesor profesor("Jessica", "Lopez", "Cartago", "jeslopez@outlook.com", "5000", "tiempo completo", 4);
    std::cout << "Nombre del profesor: " << profesor.getNombre() << std::endl;
    std::cout << "Tipo de titularidad: " << profesor.getTipoTitularidad() << std::endl;
    std::cout << "Pago total: " << profesor.calcularPago() << std::endl;

    PersonalAdministrativo administrativo("Jose", "Duarte", "limon", "joseedaurtee@hotmail.com", "49469");
    std::cout << "Nombre del personal administrativo: " << administrativo.getNombre() << std::endl;

    return 0;
}
