package com.example.semana09;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@AutoConfigureTestDatabase(replace = Replace.NONE) // Disable the default behavior of replacing the database with an embedded one
@ActiveProfiles("test")
class DatabaseServiceIntegrationTest {

    @Autowired
    private DatabaseService databaseService;

    @Test
    void testGetAllProductsFromDatabase() {
        // Perform the actual database call
        List<Producto> actualProducts = databaseService.getAllProducts();

        // You can now assert the result based on the actual database state
        // Add assertions based on the actual state of your test database
        
        //assertEquals(2, actualProducts.size()); // Adjust based on your test actual data
        assertTrue(actualProducts.size() >= 2, "Expected at least 2 records in the database, but found: " + actualProducts.size());
    }
    @Test
    void testAuthenticateUserFromDatabase() {
        // Perform the actual database call for user authentication
        String username = "user1";
        String password = "password1";
        User authenticatedUser = databaseService.authenticateUser(username, password);

        // Assert that the user is not null, indicating successful authentication
        assertNotNull(authenticatedUser, "Authentication successful for user: " + username);
    }
    @Test
    void testFailedAuthenticateUserFromDatabase() {
        // Perform the actual database call for user authentication
        String username = "user112";
        String password = "password1";
        User authenticatedUser = databaseService.authenticateUser(username, password);

        // Assert that the user is not null, indicating successful authentication
        assertNull(authenticatedUser, "Authentication failed for user: " + username);
    }

}
