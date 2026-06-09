package com.example.realestate.controller;

import com.example.realestate.repository.PropertyRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @Autowired
    private PropertyRepository propertyRepository;

    @GetMapping("/")
    public String root() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {

        if(session.getAttribute("loggedInUser") == null){
            return "redirect:/auth/login";
        }

        model.addAttribute(
                "recentProperties",
                propertyRepository.findTop3ByOrderByIdDesc()
        );

        return "dashboard";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }
}




//package com.example.realestate.controller;
//
//import com.example.realestate.repository.PropertyRepository;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//@Controller
//public class ViewController {
//
//    @Autowired
//    private PropertyRepository propertyRepository;
//
//    @GetMapping("/")
//    public String root() {
//        return "redirect:/home";
//    }
//
//    @GetMapping("/home")
//    public String home() {
//        return "home";
//    }
//
//    @GetMapping("/regis")
//    public String regis() {
//        return "registration";
//    }
//
//    @GetMapping("/login")
//    public String login() {
//        return "redirect:/auth/login";
//    }
//
//    @GetMapping("/dashboard")
//    public String showDashboard(HttpSession session, Model model) {
//
//        if(session.getAttribute("loggedInUser") == null){
//            return "redirect:/auth/login";
//        }
//
//        model.addAttribute("recentProperties", propertyRepository.findTop3ByOrderByIdDesc());
//
//        return "dashboard";
//    }
//
//    @GetMapping("/contact")
//    public String contact() {
//        return "contact";
//    }
//}