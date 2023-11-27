package com.proyectoa.demo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.proyectoa.Usuario;

@Service
public class DatabaseService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * @return
     */
    public List<Usuario> getAllUsuarios() {
        try {
            // Consulta SQL para seleccionar todos los registros de la tabla "usuario"
            String query = "SELECT * FROM usuario"; // nombre tabla en sql workbench//
              // Ejecutar la consulta y obtener los resultados como una lista de mapas
            List<Map<String, Object>> resultUsuarios = jdbcTemplate.queryForList(query);
           // Lista para almacenar objetos de tipo Usuario
            List<Usuario> Usuarios = new ArrayList<>();
              // Iterar a través de cada fila en los resultados de la consulta
            for (Map<String, Object> row : resultUsuarios) {
                // Extraer los valores de cada columna para crear un objeto Usuario
                int id_usuario = (int) row.get("id_usuario");
                String Nombre = (String) row.get("Nombre");
                String Apellido = (String) row.get("Apellido");
                String Email = (String) row.get("Email");
                String Descripcion = (String) row.get("Descripcion");
                String prioridad = (String) row.get("prioridad");
                String fechadevencimiento = (String) row.get("fechadevencimiento");
                 // Crear un objeto Usuario con los valores extraídos
                Usuario Usuario = new Usuario(id_usuario, Nombre, Apellido, Email, Descripcion, prioridad,
                        fechadevencimiento);
                 // Agregar el objeto Usuario a la lista
                Usuarios.add(Usuario);

            }
            // Devolver la lista de objetos Usuario
            return Usuarios;
        } catch (Exception e) {
            // Handle exceptions if needed
            e.printStackTrace();
                       return null;
        }
    }

    public Usuario getUsuario(int id) {
        System.out.println("logId = " + id);
        try {
            String query = "SELECT * FROM usuario WHERE id_usuario = ?";

            return jdbcTemplate.queryForObject(query, (rs, rowNum) -> {
                int id_usuario = (int) rs.getInt("id_usuario");
                String Nombre = (String) rs.getString("Nombre");
                String Apellido = (String) rs.getString("Apellido");
                String Email = (String) rs.getString("Email");
                String Descripcion = (String) rs.getString("Descripcion");
                String prioridad = (String) rs.getString("prioridad");
                String fechadevencimiento = (String) rs.getString("fechadevencimiento");

                return new Usuario(id_usuario, Nombre, Apellido, Email, Descripcion, prioridad,
                        fechadevencimiento);
            }, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public void updateUsuario(Usuario Usuario) {
        try {
             // Consulta SQL para actualizar el registro en la tabla "usuario"
            String query = "UPDATE usuario SET Nombre = ?, Descripcion = ? WHERE id = ?";
            // Utilizar el método update del JdbcTemplate para ejecutar la consulta con los valores proporcionados
            jdbcTemplate.update(query, Usuario.getNombre(),Usuario.getDescripcion() , Usuario.getIdusuario());
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions if needed
        }
    }
    public void insertUsuario(Usuario Usuario) {
        try {
              // Consulta SQL para insertar un nuevo registro en la tabla "usuario"
            String query = "INSERT usuario SET Nombre = ?, Descripcion = ? ";
              // Consulta SQL para insertar un nuevo registro en la tabla "usuario"
            jdbcTemplate.update(query, Usuario.getNombre(),Usuario.getDescripcion());
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions if needed
        }
    }

    public int deleteUsuario(int id) {
        try {
            // Consulta SQL para eliminar un registro de la tabla "usuario" basado en el valor de la columna "idusuario"
            String query = "DELETE FROM usuario WHERE idusuario= ?";
            // Utilizar el método update del JdbcTemplate para ejecutar la consulta con el valor proporcionado
            jdbcTemplate.update(query, id);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
            // Handle exceptions if needed
        }
    }

}