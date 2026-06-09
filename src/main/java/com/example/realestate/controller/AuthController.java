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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    private static final String UPLOAD_DIR = "./uploads/";

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

        try {
            User authenticatedUser = userService.login(request.getEmail(), request.getPassword());

            if (authenticatedUser != null) {
                session.setAttribute("loggedInUser", authenticatedUser);

                redirectAttributes.addFlashAttribute(
                        "welcomeMessage",
                        "Welcome, " + authenticatedUser.getFirstName() + "!"
                );

                return "redirect:/dashboard";
            }

            model.addAttribute("errorMessage", "Invalid email or password.");
            return "login";

        } catch (Exception e) {
            model.addAttribute("errorMessage", "An error occurred during login: " + e.getMessage());
            return "login";
        }
    }

    @GetMapping("/profile")
    public String showProfilePage(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/auth/login";
        }

        User latestUser = userService.findUserById(user.getId());

        if (latestUser != null) {
            session.setAttribute("loggedInUser", latestUser);
            model.addAttribute("userProfile", latestUser);
        } else {
            session.removeAttribute("loggedInUser");
            return "redirect:/auth/login";
        }

        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(
            @ModelAttribute("userProfile") User updatedUser,
            BindingResult result,
            @RequestParam(value = "profileImageFile", required = false) MultipartFile file,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpSession session) {

        User sessionUser = (User) session.getAttribute("loggedInUser");

        if (sessionUser == null) {
            return "redirect:/auth/login";
        }

        sessionUser.setFirstName(updatedUser.getFirstName());
        sessionUser.setLastName(updatedUser.getLastName());
        sessionUser.setEmail(updatedUser.getEmail());

        if (updatedUser.getPhone() != null && !updatedUser.getPhone().isEmpty()) {
            sessionUser.setPhone(updatedUser.getPhone());
        } else {
            sessionUser.setPhone(null);
        }

        if (file != null && !file.isEmpty()) {

            try {
                Path uploadPath = Paths.get(UPLOAD_DIR);
                Files.createDirectories(uploadPath);

                String originalFileName = file.getOriginalFilename();
                String fileExtension = "";

                if (originalFileName != null) {
                    int dotIndex = originalFileName.lastIndexOf('.');

                    if (dotIndex > 0 && dotIndex < originalFileName.length() - 1) {
                        fileExtension = originalFileName.substring(dotIndex);
                    }
                }

                String fileName = UUID.randomUUID().toString() + fileExtension;
                Path filePath = uploadPath.resolve(fileName);

                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                sessionUser.setProfileImage(fileName);

            } catch (IOException e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("errorMessage", "Image upload failed: " + e.getMessage());
                return "redirect:/auth/profile";
            }
        }

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
        userService.updateUser(user);

        redirectAttributes.addFlashAttribute("successMessage", "Password changed successfully.");

        return "redirect:/auth/profile";
    }

    @PostMapping("/delete-account")
    public String deleteAccount(HttpSession session) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/auth/login";
        }

        userService.deleteUserById(user.getId());

        session.invalidate();

        return "redirect:/home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password/request-otp")
    @ResponseBody
    public String requestOtp(@RequestParam String email) {

        try {
            User user = userService.findByEmail(email);

            if (user == null) {
                return "User with this email not found.";
            }

            userService.generateOtp(email);

            return "OTP sent to your email successfully.";

        } catch (Exception e) {
            System.err.println("Error requesting OTP: " + e.getMessage());
            return "Failed to send OTP. Please try again.";
        }
    }

    @PostMapping("/forgot-password/verify-otp")
    @ResponseBody
    public String verifyOtp(@RequestParam String email, @RequestParam String otp) {

        try {
            boolean isVerified = userService.verifyOtp(email, otp);

            if (isVerified) {
                return "OTP verified successfully.";
            }

            return "Invalid or expired OTP.";

        } catch (Exception e) {
            System.err.println("Error verifying OTP: " + e.getMessage());
            return "Failed to verify OTP. Please try again.";
        }
    }

    @PostMapping("/forgot-password/reset-password")
    @ResponseBody
    public String resetPassword(@RequestParam String email,
                                @RequestParam String newPassword) {

        try {
            userService.resetPassword(email, newPassword);
            return "Password reset successfully.";

        } catch (Exception e) {
            System.err.println("Error resetting password: " + e.getMessage());
            return "Failed to reset password. Please try again.";
        }
    }
}