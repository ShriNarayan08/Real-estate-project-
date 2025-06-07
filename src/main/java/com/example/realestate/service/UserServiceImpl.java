// src/main/java/com/example/realestate/service/UserServiceImpl.java
package com.example.realestate.service;

import com.example.realestate.model.RegistrationRequest;
import com.example.realestate.model.User;
import com.example.realestate.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Random; // For OTP generation

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService; // Inject the new EmailService

    // Register a new user
    @Override
    public User registerUser(RegistrationRequest request) {
        User user = new User();
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setEmail(request.getEmail());
        user.setPassword(request.getPassword()); // IMPORTANT: Hash this password!
        user.setPhone(request.getPhone());
        user.setProfileImage("default-profile.png");
        return userRepository.save(user);
    }

    // Login logic
    @Override
    public User login(String email, String password) {
        Optional<User> userOpt = userRepository.findByEmail(email);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (user.getPassword().equals(password)) { // IMPORTANT: Compare hashed passwords!
                return user;
            }
        }
        return null;
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    @Override
    public void updateUser(User user) {
        userRepository.save(user);
    }

    @Override
    public boolean checkPassword(User user, String rawPassword) {
        return user.getPassword().equals(rawPassword); // Use password encoder for comparison
    }

    @Override
    public void updatePassword(User user, String newPassword) {
        user.setPassword(newPassword); // Hash the new password before saving!
        userRepository.save(user);
    }

    @Override
    public User findUserById(Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        return userOptional.orElse(null);
    }

    // --- NEW OTP METHODS IMPLEMENTATION ---
    @Override
    public String generateOtp(String email) {
        User user = findByEmail(email);
        if (user == null) {
            throw new RuntimeException("User not found for email: " + email);
        }

        String otp = String.format("%06d", new Random().nextInt(999999)); // 6-digit OTP
        LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(5); // OTP valid for 5 minutes

        user.setOtp(otp);
        user.setOtpExpiryTime(expiryTime);
        userRepository.save(user); // Save OTP and expiry to user

        // Send OTP via email
        emailService.sendOtpEmail(email, otp);

        return otp;
    }

    @Override
    public boolean verifyOtp(String email, String otp) {
        User user = findByEmail(email);
        if (user == null || user.getOtp() == null || user.getOtpExpiryTime() == null) {
            return false; // User or OTP data not found
        }

        if (user.getOtp().equals(otp) && user.getOtpExpiryTime().isAfter(LocalDateTime.now())) {
            // OTP verified, clear OTP after successful verification to prevent reuse
            user.setOtp(null);
            user.setOtpExpiryTime(null);
            userRepository.save(user);
            return true;
        }
        return false;
    }

    @Override
    public void resetPassword(String email, String newPassword) {
        User user = findByEmail(email);
        if (user == null) {
            throw new RuntimeException("User not found for email: " + email);
        }
        user.setPassword(newPassword); // IMPORTANT: Hash the new password here!
        userRepository.save(user);
    }
    // --------------------------------------
}