package com.proyectoa.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.proyectoa.Usuario;

import java.util.List;

@RestController
@RequestMapping("/api")
public class MyRestController {
// Se asume que databaseService es una instancia de la clase DatabaseService,
    // que proporciona métodos para interactuar con la base de datos.
    @Autowired
    private DatabaseService databaseService;

    @GetMapping
    public String hello() {// es una prueba para que retorne en la pantalla
        return "Hello World!";
    }

    @GetMapping("/all")
    public List<Usuario> all() {// desplega en la pantalla los usuarios
        return databaseService.getAllUsuarios();
    }

    @GetMapping("/id")
    public Usuario getUserById(@RequestParam int id) {// llama a la base de datos
        return databaseService.getUsuario(id);
    }

    @PutMapping("/id")
    public void updateUsuario(@RequestParam String nombre, @RequestParam String descripcion, @RequestParam int id) {
         // Crear un nuevo objeto Usuario con los valores proporcionados
        Usuario usuario = new Usuario(id, nombre, descripcion, "", "", "", "");
        // Llamar al servicio de base de datos para actualizar el usuario
        databaseService.updateUsuario(usuario);
    }

    @PostMapping
    public void insertUsuario(@RequestParam String nombre, @RequestParam String descripcion) {
        // Crear un nuevo objeto Usuario con los valores proporcionados
        Usuario usuario = new Usuario(0, nombre, descripcion, "", "", "", "");
        // Llamar al servicio de base de datos para actualizar el usuario
        databaseService.insertUsuario(usuario);
    }

    @DeleteMapping("/id")
    public void deleteUsuario(@RequestParam int id) {
         // Llamar al servicio de base de datos para eliminar el usuario por ID
        databaseService.deleteUsuario(id);
    }
}
