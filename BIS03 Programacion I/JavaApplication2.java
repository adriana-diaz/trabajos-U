
package javaapplication2;
import java.util.Scanner;

public class JavaApplication2 {

    
    public static void main(String[] args) {
        Scanner reader = new Scanner (System.in);
        int menu=0;
    int nota1, nota2,nota3, promedio, promediofinal=0;
    
    System.out.println("------Menu practica------") ;
    System.out.println("1- Promedio ") ;  
    menu= reader.nextInt();
   
    switch (menu){
        case 1 :{
         System.out.println("Programa para sacar promedio") ;
             System.out.println("Escriba la nota 1");
             nota1= reader.nextInt();
             System.out.println("Escriba la nota 2");
             nota2= reader.nextInt();
             System.out.println("Ingrese la nota 3");
             nota3 = reader. nextInt();
             promedio = (nota1+nota2+nota3);
             promediofinal= (promedio/3);
             System.out.println("Su promedio es de  "+promediofinal) ;
             
             if (promediofinal>=70) {
          System.out.println("Esta aprovado");
      }
      else 
          System.out.println("Esta reprobado");
      
             
             break;   
            
            
            
            
        }
    }
    
    
    
    
    
    
    }
    
}
    
    

