package com.example.semana09;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

class DatabaseServiceTest {

    private DatabaseService databaseService;
    private JdbcTemplate jdbcTemplate;

    @BeforeEach
    void setUp() {
        jdbcTemplate = mock(JdbcTemplate.class);
        databaseService = new DatabaseService(jdbcTemplate);
    }

    @Test
    void testGetAllProducts() {
        // Mocking the result from the database
        List<Map<String, Object>> mockResult = new ArrayList<>();
        mockResult.add(Map.of("id_producto", 1, "nombre_producto", "Product 1", "descripcion_producto", "Description 1"));
        mockResult.add(Map.of("id_producto", 2, "nombre_producto", "Product 2", "descripcion_producto", "Description 2"));

        // Mocking the behavior of jdbcTemplate.queryForList()
        when(jdbcTemplate.queryForList("SELECT * FROM to_do_app.Productos")).thenReturn(mockResult);

        // Calling the actual method to be tested
        List<Producto> actualProducts = databaseService.getAllProducts();

        // Creating the expected result
        List<Producto> expectedProducts = new ArrayList<>();
        expectedProducts.add(new Producto(1, "Product 1", "Description 1"));
        expectedProducts.add(new Producto(2, "Product 2", "Description 2"));

        // Asserting that the actual result matches the expected result
        assertEquals(expectedProducts, actualProducts);
    }
    @Test
    void testGetProducto() {
    // Mocking the behavior of jdbcTemplate.queryForObject()
    when(jdbcTemplate.queryForObject(
            eq("SELECT * FROM to_do_app.Productos WHERE id_producto = ?"),
            any(RowMapper.class), // Use any() for RowMapper
            eq(1)
    )).thenReturn(new Producto(1, "Product 1", "Description 1"));

    // Calling the actual method to be tested
    Producto actualProduct = databaseService.getProducto(1);

    // Creating the expected result
    Producto expectedProduct = new Producto(1, "Product 1", "Description 1");

    // Asserting that the actual result matches the expected result
    assertEquals(expectedProduct, actualProduct);
    }
   
    @Test
    void testInsertProducto() {
        // Mocking the behavior of jdbcTemplate.update()
        when(jdbcTemplate.update(
                "INSERT to_do_app.Productos SET nombre_producto = ?, descripcion_producto = ?",
                "Product Test", "Description Test")).thenReturn(1);

        // Calling the actual method to be tested
        Producto productoToInsert = new Producto(0, "Product Test", "Description Test");
        databaseService.insertProducto(productoToInsert);

        // Verify that jdbcTemplate.update() was called with the expected SQL and parameters
        verify(jdbcTemplate).update(
            "INSERT to_do_app.Productos SET nombre_producto = ?, descripcion_producto = ? ",
            "Product Test",
            "Description Test"
        );
    
    }
    
}
