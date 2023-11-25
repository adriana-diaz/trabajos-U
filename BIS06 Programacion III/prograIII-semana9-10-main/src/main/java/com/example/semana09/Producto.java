package com.example.semana09;

import java.util.Objects;

public class Producto {
    // Atributos
    private int id_producto;
    private String nombre_producto;
    private String descripcion_producto;

    // Constructor

    public Producto(int id_producto, String nombre_producto, String descripcion_producto) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion_producto = descripcion_producto;
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
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Producto producto = (Producto) obj;
        return id_producto == producto.id_producto &&
               Objects.equals(nombre_producto, producto.nombre_producto) &&
               Objects.equals(descripcion_producto, producto.descripcion_producto);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id_producto, nombre_producto, descripcion_producto);
    }
}
