package com.proyectoa.demo;
import java.util.List;

import org.springframework.context.annotation.Description;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.proyectoa.Usuario;
@RestController
@RequestMapping ("/api")
public class MyRestController {
    // Se asume que databaseService es una instancia de la clase DatabaseService,
    // que proporciona métodos para interactuar con la base de datos.
    DatabaseService databaseService;
    @GetMapping
    public String hello() {// es una prueba para que retorne en la pantalla
        return "Hello World!";
}

@GetMapping("/all")// desplega en la pantalla los usuarios
public List<Usuario> all() {
    return databaseService.getAllUsuarios();
}

@GetMapping("/id")// llama a la base de datos
public Usuario all(int id) {
    return databaseService.getUsuario(id);
}
@PutMapping("/id")
    public void update(String nombre, String descripcion, int id) {
      // Crear un nuevo objeto Usuario con los valores proporcionados
        Usuario Usuario = new Usuario(0, nombre, descripcion, descripcion, descripcion, descripcion, descripcion);
         // Llamar al servicio de base de datos para actualizar el usuario
        databaseService.updateUsuario(Usuario) ;
    }

    
    @PostMapping()
    public void insert(String nombre, String descripcion) {
        // Crear un nuevo objeto Usuario con los valores proporcionados
        Usuario Usuario = new Usuario(0, nombre, descripcion, descripcion, descripcion, descripcion, descripcion);
         // Llamar al servicio de base de datos para actualizar el usuario
        databaseService.insertUsuario(Usuario) ;
    }

    @DeleteMapping("/id")
    public void delete(int id) {
         // Llamar al servicio de base de datos para eliminar el usuario por ID
        databaseService.deleteUsuario(id) ;
    }
} 