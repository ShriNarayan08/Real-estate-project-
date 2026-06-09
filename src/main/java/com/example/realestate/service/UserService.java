package com.example.realestate.service;

import com.example.realestate.model.RegistrationRequest;
import com.example.realestate.model.User;

public interface UserService {

    User registerUser(RegistrationRequest request);

    User findByEmail(String email);

    User login(String email, String password);

    void updateUser(User user);

    boolean checkPassword(User user, String rawPassword);

    void updatePassword(User user, String newPassword);

    User findUserById(Long id);

    void deleteUserById(Long id);

    // OTP METHODS

    String generateOtp(String email);

    boolean verifyOtp(String email, String otp);

    void resetPassword(String email, String newPassword);
}