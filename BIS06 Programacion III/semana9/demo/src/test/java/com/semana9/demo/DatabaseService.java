package com.semana9.demo;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
@Service
 
public class DatabaseService {
     @Autowired
    private static JdbcTemplate jdbcTemplate;
   
    public static List<Producto> getAllProducts() {
        try {
            // Replace 'app_log' with your actual table name and adjust the query as needed
            String query = "SELECT * FROM checkinlove_next_gen.productos";
            List<Map<String, Object>> resultProducts = jdbcTemplate.queryForList(query);
            List<Producto> productos = new ArrayList<>();
 
            for (Map<String, Object> row : resultProducts) {
                int id_producto = (int) row.get("id_producto");
                String nombre_producto = (String) row.get("nombre_producto");
    
                String descripcion_producto = (String) row.get("descripcion_producto");
 
                Producto producto = new Producto(nombre_producto, id_producto, descripcion_producto);
                productos.add(producto);
            }
            return productos;
        } catch (Exception e) {
            // Handle exceptions if needed
            e.printStackTrace();
            return null;
        }
        }
    }