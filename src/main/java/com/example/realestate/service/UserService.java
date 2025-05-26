package com.example.realestate.service; // Corrected package name

import com.example.realestate.model.RegistrationRequest;
import com.example.realestate.model.User; // Corrected import for User entity

public interface UserService {

    // Method for user registration
    User registerUser(RegistrationRequest request);

    // Method for user login/authentication
    User findByEmail(String email);

    // Login logic
    User login(String email, String password);

    void updateUser(User user);

//    User getloggedInUser();

    boolean checkPassword(User user, String rawPassword);

    void updatePassword(User user, String newPassword);

    // You can add other service methods here if needed
    // Example: User findUserById(Long id);
    // Example: List<User> getAllUsers();
    // Example: User updateUser(Long id, User user);
    // Example: void deleteUser(Long id);
}
