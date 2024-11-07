package com.example.my_demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AppController {

    @Autowired
    PersonRepository personRepository;

    @GetMapping("/")
    public String index(Model model) {

        List<Person> personList = personRepository.findAll();

        model.addAttribute("personList", personList);
        return "index";
    }
}
