package ejercicio4;

import java.util.Scanner;

public class Ejercicio4 {

    public static void main(String[] args) {
        Scanner dato = new Scanner(System.in);
       // Preguntar los digitos con lo que vamos a trabajar//
        System.out.println("Ingresa el primer digito:");
        int num1 = dato.nextInt();

        System.out.println("Ingresa el segundo digito:");
        int num2 = dato.nextInt();

        System.out.println("Ingresa el tercer digito:");
        int num3 = dato.nextInt();

        System.out.println("Ingresa el cuarto digito:");
        int num4 = dato.nextInt();
        // Calculo para averiguar el mayor de los 4 digitos//
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
    }
}
