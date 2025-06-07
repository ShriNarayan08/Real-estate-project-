package com.example.realestate.service;

import com.example.realestate.model.RegistrationRequest;
import com.example.realestate.model.User; // Corrected import for User entity
import java.time.LocalDateTime; // Import LocalDateTime for OTP expiry

public interface UserService {

    // Method for user registration
    User registerUser(RegistrationRequest request);

    // Method to find a user by email (e.g., for login or forgotten password)
    User findByEmail(String email);

    // Login logic - this typically just calls findByEmail and then checks password
    User login(String email, String password);

    // Method to update an existing user's details
    void updateUser(User user);

    // Method to check if a raw password matches a user's stored password (should use a password encoder)
    boolean checkPassword(User user, String rawPassword);

    // Method to update a user's password (should hash the new password)
    void updatePassword(User user, String newPassword);

    // Method to find a user by their ID
    User findUserById(Long id); // <--- UNCOMMENTED AND ADDED THIS METHOD

    // --- NEW OTP METHODS FOR FORGOT PASSWORD ---
    /**
     * Generates an OTP for the given email, stores it in the user entity with an expiry time,
     * and sends the OTP via email.
     * @param email The email address of the user.
     * @return The generated OTP string.
     * @throws RuntimeException if the user is not found or if email sending fails.
     */
    String generateOtp(String email);

    /**
     * Verifies the provided OTP for the given email against the stored OTP and its expiry.
     * If successful, clears the OTP and its expiry from the user.
     * @param email The email address of the user.
     * @param otp The OTP provided by the user.
     * @return true if the OTP is valid and not expired, false otherwise.
     */
    boolean verifyOtp(String email, String otp);

    /**
     * Resets the user's password after successful OTP verification.
     * @param email The email address of the user.
     * @param newPassword The new password to set for the user. (Should be hashed before saving)
     * @throws RuntimeException if the user is not found.
     */
    void resetPassword(String email, String newPassword);
    // ------------------------------------------

}