package com.semana6.demo;
import java.util.List;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestAnimalController {
    
    @GetMapping("/animal")
    public Animal getAnimal() {
        return new Animal("Perro", "Mamífero", "Guau");
    }

    @GetMapping("/animales")
    public void getAnimals() {
       Animal animalList = new Animal();
         animalList.getAnimals();
    }

    @PostMapping("/animal")
    public void addAnimal(String name, String type, String sound){
        Animal animal = new Animal( name,  type,  sound);
        animal.addAnimal(animal);
        animal.getAnimals();
    }

     @PutMapping("/animal")
    public void editAnimal(String name, String type, String sound, int index){
        Animal animal = new Animal( name,  type,  sound);
        animal.updateListMember(animal,index);
        animal.getAnimals();
    }
    @DeleteMapping("/animal")
    public void delAnimal(int index ){
        Animal animal = new Animal();
        animal.genAnimals();
        animal.getAnimals();
        animal.removeAnimal(index);
        animal.getAnimals();
    }

}