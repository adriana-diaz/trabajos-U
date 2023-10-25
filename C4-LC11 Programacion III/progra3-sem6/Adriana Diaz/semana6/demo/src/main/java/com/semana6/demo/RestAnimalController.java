package com.semana6.demo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestAnimalController {
    
    @GetMapping("/animal")
    public Animal getAnimal() {
        return new Animal("Perro", "Mamífero", "Guau");
    }

    
}