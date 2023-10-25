package examenmontielrua.examen;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.DeleteMapping;

@RestController

public class ExamenController {
    @GetMapping("/animal")
    public Animal getAnimal(){
        return new Animal("Perro", "Mamifero", "Ladrido");
    }
    
    @PostMapping("/animal")
    public void addAnimal(String name, String type, String sound) {
        Animal animal = new Animal(name,type,sound);
        animal.addAnimal(animal);
        animal.getAnimals();
    }

    @DeleteMapping("/animal")
    public void removeAnimal(int index) {
        Animal animal = new Animal();
        animal.genAnimals();
        animal.getAnimals();
        animal.removeAnimal(index);
        animal.getAnimals();
        
    }

    @PutMapping("/animal")
    public void editAnimal(String name, String type, String sound, int index) {
        Animal animal = new Animal(name,type,sound);
        animal.updateListMember(animal,index);
        animal.getAnimals();
    }
}
