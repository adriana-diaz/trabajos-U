package com.semana6.demo;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.annotation.Generated;

 

@Controller

@RequestMapping("/intro") //http://localhost:8080/intro
public class WebControler {
     @GetMapping()

    public String index(){

        return"index-intro";

    }

}
