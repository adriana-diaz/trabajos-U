package com.semana9.demo;

public class Producto {
    //atributo
    private String nombre_producto;
    private int id_producto;
    private String descripcion_producto;
    //constructor (ctrl .)
    public Producto(String nombreProducto, int id_producto, String descripcionProducto) {
        this.nombre_producto = nombreProducto;
        this.id_producto = id_producto;
        this.descripcion_producto = descripcionProducto;
    }
// Getters y Setters
 
public int getId_producto() {
    return this.id_producto;
}

public void setId_producto(int id_producto) {
    this.id_producto = id_producto;
}

public String getNombre_producto() {
    return this.nombre_producto;
}
public void setNombre_producto(String nombre_producto) {
    this.nombre_producto = nombre_producto;
}

public String getDescripcion_producto() {
    return this.descripcion_producto;
}

public void setDescripcion_producto(String descripcion_producto) {
    this.descripcion_producto = descripcion_producto;
}

// toString


    
}
