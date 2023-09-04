package JavaApplication10;

import java.util.Scanner;

public class JavaApplication10 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int menu;
        do {
            System.out.println("Seleccione una opción:");
            System.out.println("1. Arreglo de 7 posciones para almacenar 7 números");
            System.out.println("2. Imprimir las pociones del arreglo");
            System.out.println("3. Calculo de promedio anual");
            System.out.println("4. Digite 4 Números y le indique cuál de ellos es el mayor");
            System.out.println("5. Salario con deducciones");
            System.out.println("6. Años de antigüedad y horas laborales");
            System.out.println("7. Averiguar si el dia de la semana es laborable");
            System.out.println("8. Salir");
            menu = teclado.nextInt();
            switch (menu) {
                case 1:
                    int num[] = new int[7];
                    for (int i = 0; i <= 6; i++) {
                        System.out.println("Ingrese los 7 numeros");
                        num[i] = teclado.nextInt();
                    }
                    break;
                case 2: {
                    System.out.println("Ha seleccionado la opción 1");
                    int[] numeros = new int[7];

                    for (int i = 0; i < numeros.length; i++) {
                        System.out.print("Ingrese un número: ");
                        numeros[i] = teclado.nextInt();
                    }

                    System.out.println("Los números ingresados son:");
                    for (int i = 0; i < numeros.length; i++) {
                        System.out.println(numeros[i]);
                    }
                    break;
                }

                case 3:
                    double notas[] = new double[3];
                    //variable para que el usuario ponga las notas del actual curso//
                    double total = 0;
                    double promedio;

                    for (int i = 0; i <= 2; i++) {
                        System.out.println("Ingrese las 3 notas");
                        notas[i] = teclado.nextInt();
                        total += notas[i];
                    }
                    promedio = total / 3;

                    if (promedio >= 70) {
                        System.out.println("Usted aprobado con un promedio de" + promedio);

                    } else {
                        System.out.println("Usted reprobado con un promedio de" + promedio);
                    }

                case 4:
                    Scanner dato = new Scanner(System.in);
                    // Preguntar los digitos con lo que vamos a trabajar//
                    System.out.println("Ingresa el primer digito:");
                    int num1 = dato.nextInt();
                    System.out.println("Ingresa el segundo digito:");
                    int num2 = dato.nextInt();
                    int num4 = dato.nextInt();
                    // Calculo para averiguar el mayor de los 4 digitos//
                    System.out.println("Ingresa el tercer digito:");
                    int num3 = dato.nextInt();
                    System.out.println("Ingresa el cuarto digito:");
                    int mayor = num1;
                    if (num2 > mayor) {
                        mayor = num2;
                    } else if (num3 > mayor) {
                        mayor = num3;
                    } else if (num4 > mayor) {
                        mayor = num4;
                    }
                    // Imprimir resultado//
                    System.out.println("El número mayor es: " + mayor);

                case 5: {
                    System.out.print("Introduzca el nombre del trabajador: ");
                    String nombre = teclado.nextLine();

                    System.out.print("Introduzca el salario semanal: ");
                    double salarioSem = teclado.nextDouble();

                    // Cálculo de salario mensual //
                    double salarioMen = salarioSem * 4;

                    // Cálculo de salario después de deducciones //
                    double deducciones = salarioSem * 0.09;
                    double salarioNeto = salarioMen - deducciones;

                    // Cálculo de impuesto sobre la renta //
                    double salarioBruto = salarioMen * 12;
                    double impuesto = 0;
                    if (salarioBruto > 2000000) {
                        impuesto = (salarioBruto - 2000000) * 0.15 + 80000;
                    } else if (salarioBruto > 1200000) {
                        impuesto = (salarioBruto - 1200000) * 0.10 + 20000;
                    } else if (salarioBruto > 800000) {
                        impuesto = (salarioBruto - 800000) * 0.05;
                    }

                    System.out.println("Nombre: " + nombre);
                    System.out.println("Salario mensual: " + salarioMen);
                    System.out.println("Salario neto: " + salarioNeto);
                    System.out.println("Impuesto sobre la renta: " + impuesto);

                    teclado.close();
                }

                case 6: {

                    System.out.print("Ingrese los años de antigüedad: ");
                    int antiguedad = teclado.nextInt();

                    System.out.print("Ingrese la cantidad de horas laboradas por semana: ");
                    int horasSemana = input.nextInt();

                    System.out.print("Ingrese el precio por hora: ");
                    double precioHora = input.nextDouble();

                    // Cálculo del salario bruto//
                    double salarioBruto = horasSemana * precioHora * 4 * 12;

                    // Bono por antigüedad //
                    if (antiguedad > 10) {
                        salarioBruto *= 1.2;
                    }

                    // Deducción por salario bruto //
                    if (salarioBruto > 2000) {
                        salarioBruto *= 0.85;
                    } else if (salarioBruto > 1000) {
                        salarioBruto *= 0.9;
                    }

                    System.out.println("Salario neto: " + salarioBruto);

                    input.close();
                }
            }

          case 7: {
          
        System.out.print("Ingrese el número del día (1 para Domingo, 2 para Lunes, etc.): ");
        int numeroDia = sc.nextInt();

        if (numeroDia >= 2 && numeroDia <= 6) {
            System.out.println("El día es un laborable.");
        } else {
            System.out.println("El día no es laborable.");
        }
    }
 
case 8: {
 System.out.println("¡Hasta luego!");
 break;
        }
 
 default:
 System.out.println("Opción incorrecta");
 }
    }
}
while (menu != 8);
