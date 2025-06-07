package com.example.realestate.controller; // Corrected package name

//import ch.qos.logback.core.model.Model;
import ch.qos.logback.core.model.Model;
import com.example.realestate.model.User;
import com.example.realestate.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping("/home")
    public String home(){
        return "home";
    }

    @GetMapping("/regis")
    public String regis()
    {
        return "registration";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/dashboard")
    public String showDashboard() {
        return "dashboard"; // dashboard.jsp ko render karega
    }

    @GetMapping("/profile")
    public String showProfile(Model model) {
        return "profile";
    }

    @GetMapping("/sell")
    public String sellProperty()
    {
        return "sellProperty";
    }





    // Registration and Login forms are now handled by AuthController's @GetMapping
    // but if you want direct access to them via a simple GET, you can keep these
    // or remove them if AuthController's @GetMapping("/auth/register") and @GetMapping("/auth/login") are sufficient.
    // For consistency with the AuthController's @RequestMapping("/auth"),
    // it's better to link to /auth/register and /auth/login from your JSPs.
}