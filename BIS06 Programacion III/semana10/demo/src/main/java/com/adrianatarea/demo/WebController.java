package com.adrianatarea.demo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

    @GetMapping("/")
    public String home(Model model) {
        // Estructura de mi pagina
        model.addAttribute("titulo", "Tarea Adriana Diaz");
        model.addAttribute("subtitulo", "Tarea Progra III Semana 10");
        model.addAttribute("contenido", "Hello world");

        // Devolver el nombre de la plantilla (sin la extensión .html)
        return "home";
    }
}
