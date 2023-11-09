package com.semana9.demo;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController  
@RequestMapping("/api")
public class MyRestController {
     public String hello(){
        return "Hello World!";
    }


@GetMapping("/all")    
public List<Producto> getAllProductsll() { 
    return DatabaseService.getAllProducts();
} 
}
     