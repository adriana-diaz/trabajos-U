package com.api.semana4;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController // recibir, enviar e interpretar http
@RequestMapping("/persona") // para entender el path 

public class Persona {
    String nombre;
    String apellido;
    @GetMapping("/saludar") 
    public String Saludar() { //http://localhost:8080/persona
      return "buenas noches"; 
    }

      @GetMapping("/greet") 
    public String Greet() {
      return "Un gusto conocerte"; 
    } 

    @PostMapping("/servidor") //POST 
    public String administrar(String nombre) {
      System.out.println(nombre); 
      return "POST - Mi nombre es " +nombre; //http://localhost:8080/info/servidor lo añado a postman y le doy post
    }
    @GetMapping("/servidor") // Get secundario
    public String getInfoServer() { 
      return "Servidor en linea"; //http://localhost:8080/info/servidor
    }
}
