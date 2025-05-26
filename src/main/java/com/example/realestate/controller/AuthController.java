package com.example.realestate.controller;

import com.example.realestate.model.LoginRequest;
import com.example.realestate.model.RegistrationRequest;
import com.example.realestate.model.User;
import com.example.realestate.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("registrationRequest", new RegistrationRequest());
        return "registration";
    }

    @PostMapping("/register")
    public String processRegistrationForm(
            @ModelAttribute("registrationRequest") RegistrationRequest request,
            BindingResult result,
            Model model,
            RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "registration";
        }

        if (!request.getPassword().equals(request.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "password.mismatch", "Passwords do not match");
            return "registration";
        }

        try {
            userService.registerUser(request);
            redirectAttributes.addFlashAttribute("successMessage", "Registration successful! Please login.");
            return "redirect:/auth/login";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Registration failed: " + e.getMessage());
            return "registration";
        }
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("loginRequest", new LoginRequest());
        return "login";
    }

    @PostMapping("/login")
    public String processLoginForm(
            @ModelAttribute("loginRequest") LoginRequest request,
            BindingResult result,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpSession session) {

        if (result.hasErrors()) {
            return "login";
        }

        try
        {
            User authenticatedUser = userService.login(request.getEmail(), request.getPassword());
            if (authenticatedUser != null)
            {
                session.setAttribute("loggedInUser", authenticatedUser);
                redirectAttributes.addFlashAttribute("welcomeMessage", "Welcome, " + authenticatedUser.getFirstName() + "!");
                return "redirect:/auth/profile"; // Corrected path to match controller mapping
//              return "redirect:/auth/dashboard"; // Corrected path to match controller mapping
            }
            else
            {
                model.addAttribute("errorMessage", "Invalid email or password.");
                return "login";
            }
        }
        catch (Exception e) {
            model.addAttribute("errorMessage", "An error occurred during login: " + e.getMessage());
            return "login";
        }
    }

    @GetMapping("/profile")
    public String showProfilePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/auth/login"; // Corrected redirect path
        }

        model.addAttribute("userProfile", user);
        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(
            @ModelAttribute("userProfile") User updatedUser,
            BindingResult result,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpSession session) {

        User sessionUser = (User) session.getAttribute("loggedInUser");

        if (sessionUser == null) {
            return "redirect:/auth/login"; // Corrected redirect path
        }

        sessionUser.setFirstName(updatedUser.getFirstName());
        sessionUser.setLastName(updatedUser.getLastName());
        sessionUser.setEmail(updatedUser.getEmail());
        sessionUser.setPhone(updatedUser.getPhone());

        userService.updateUser(sessionUser);

        session.setAttribute("loggedInUser", sessionUser);
        redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully.");

        return "redirect:/auth/profile";
    }


    @PostMapping("/change-password")
    public String changePassword(HttpSession session,
                                 @RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 @RequestParam String confirmNewPassword,
                                 RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/auth/login";
        }

        if (!user.getPassword().equals(currentPassword)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Current password is incorrect.");
            return "redirect:/auth/profile";
        }

        if (!newPassword.equals(confirmNewPassword)) {
            redirectAttributes.addFlashAttribute("errorMessage", "New passwords do not match.");
            return "redirect:/auth/profile";
        }

        user.setPassword(newPassword);
        userService.updateUser(user);  // Make sure this saves password

        redirectAttributes.addFlashAttribute("successMessage", "Password changed successfully.");
        return "redirect:/auth/profile";
    }

//    @GetMapping("/dashboard")
//    public String dashboard(HttpSession session, Model model) {
//        Object user = session.getAttribute("loggedInUser");
//        if (user == null) {
//            return "redirect:/auth/login";
//        }
//
//        model.addAttribute("welcomeMessage", "Welcome to the dashboard!");
//        return "dashboard"; // should match dashboard.jsp inside /WEB-INF/views/
//    }
}