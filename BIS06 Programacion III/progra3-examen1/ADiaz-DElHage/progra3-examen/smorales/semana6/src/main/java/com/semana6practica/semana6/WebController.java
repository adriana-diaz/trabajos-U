package com.semana6practica.semana6;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.annotation.Generated;

@Controller
@RequestMapping("/examen")
public class WebController {

    @GetMapping()
    public String index() {
        return "examen";
    }    
}
