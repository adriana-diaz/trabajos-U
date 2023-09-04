package javaapplication5;

import java.util.Scanner;

public class JavaApplication5 {

    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        Scanner teclado = new Scanner(System.in);
        Scanner dato = new Scanner(System.in);

        int edad;
        int menu;
        String nombre;

        System.out.println("---Menu---");
        System.out.println("1. edad");
        System.out.println("2. nombre");
        System.out.println("3. salir");
        menu = reader.nextInt();

        switch (menu) {
            case 1: {
                System.out.println("Ingrese su edad");
                edad = dato.nextInt();

                if (edad > 18) {
                    System.out.println("Usted es mayor de edad");

                } else {
                    System.out.println("Usted es menor de edad");

                }
                break;
            }
            case 2: {
                System.out.println("Ingrese su nombre");
                nombre = teclado.nextLine();

                System.out.println("Hola Buenos dias " + nombre);
                break;
            }
            case 3:{
                break;
        }

    }

}

}


