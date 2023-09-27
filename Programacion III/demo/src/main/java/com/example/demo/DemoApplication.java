package com.example.demo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
        public class DemoApplication  {

	public static void main(String[] args) {
        class Carro{
		String marca;
		String modelo;
		String color;

		public Carro(String marca, String modelo, String color) {
			this.marca = marca;
			this.modelo = modelo;
			this.color = color;
		}
		public String getMarca() {return marca;}
	
	   }

        class Estudiantes {
		String nombre;
		String apellido;
		String carnet;
		private String saludar(){
	        return "Hola mi nombre es "+nombre+" y mi apellido es"+apellido+"" ;}
	   }
		System.out.println("Acelerando");
		Estudiantes estudiant1 = new Estudiantes();
		estudiant1.nombre = "Estudiante #1";
		estudiant1.apellido = "Apellido #1";
		estudiant1.carnet= "12345";
		System.out.println("Estudiante :"+estudiant1.nombre+"apellido:"+estudiant1.apellido +" carnet:" +estudiant1.carnet);
		System.out.println("el estudiante dice: "+estudiant1.saludar());
		SpringApplication.run(DemoApplication.class, args);
	}

}
