package com.api.semana4;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // recibir, enviar e interpretar http
@RequestMapping("/info") // para entender el path 

public class InfoControlador { 
    @GetMapping //Get Map default
    public String getInfo() { 
      return "hola"; //http://localhost:8080/info
    }

    @GetMapping("/servidor") // Get secundario
    public String getInfoServer() { 
      return "Servidor en linea"; //http://localhost:8080/info/servidor
    }
    
    @PostMapping("/servidor") //POST 
    public String postInfoServer(String nombre, String email) {
      System.out.println(nombre); 
      System.out.println(email); 
      return "POST - Mi nombre es " +nombre + " | Mi correo es: " + email; //http://localhost:8080/info/servidor lo añado a postman y le doy post
    }
}
