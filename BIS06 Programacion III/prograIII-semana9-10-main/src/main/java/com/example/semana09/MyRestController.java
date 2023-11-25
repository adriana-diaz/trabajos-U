package com.example.semana09;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class MyRestController {
    @Autowired
    private DatabaseService databaseService; // Inject DatabaseService here


    @GetMapping 
    public String hello() {
        return "Hello, world!";
    }

    @GetMapping("/all")
    public List<Producto> all() {
        return databaseService.getAllProducts() ;
    }
    @GetMapping("/byid")
    public Producto all(int id) {
        return databaseService.getProducto(id) ;
    }

    @PutMapping("/byid")
    public void update(String nombre, String descripcion, int id) {

        Producto    producto = new Producto(id, nombre, descripcion);
        databaseService.updateProducto(producto) ;
    }
    
    @PostMapping()
    public void insert(String nombre, String descripcion) {

        Producto    producto = new Producto(0, nombre, descripcion);
        databaseService.insertProducto(producto) ;
    }

    @PostMapping("/login")
    public User loginUser(String username, String password) {

    User  tmpUser =  databaseService.authenticateUser(username,password) ;
    tmpUser.setJTW();
    return tmpUser;
    }


    @DeleteMapping("/byid")
    public void delete(int id) {

        databaseService.deleteProducto(id) ;
    }
}
