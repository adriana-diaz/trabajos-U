package com.semana6.demo; 

import java.util.ArrayList;
import java.util.List;

public class Animal {

    private String name;
    private String type;
    private String sound;

    private List<Animal> animals = new ArrayList<Animal>();
    public Animal(String name, String type, String sound) {
        this.name = name;
        this.type = type;
        this.sound = sound;
  
    }
    
    public String getName() {
        return name;
    }

    public List<Animal> getAnimals() {
        Animal animal1 = new Animal("Perro", "Mamífero", "Guau");
        Animal animal2 = new Animal("Gato", "Mamífero", "Miau");
        Animal animal3 = new Animal("Pez", "Pez", "Glup");
        Animal animal4 = new Animal("Pájaro", "Ave", "Pio");
 
        animals.add(animal1);
        animals.add(animal2);
        animals.add(animal3);
        animals.add(animal4);
        for (Animal animalIteracion : animals) {
            System.out.println(animalIteracion.getName());
        }
        return animals;
    }

    public void addAnimal(Animal animal)
    {
        animals.add(animal);
    }
    public void removeAnimal(int index) {
        animals.remove(index);
    }



    public String getType() {
        return type;
    }

    public String getSound() {
        return sound;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
          this.type = type;
      
    }
}