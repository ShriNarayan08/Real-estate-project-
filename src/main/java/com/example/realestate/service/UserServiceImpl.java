package com.example.realestate.service;

import com.example.realestate.model.RegistrationRequest;
import com.example.realestate.model.User;
import com.example.realestate.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;

    @Override
    public User registerUser(RegistrationRequest request) {

        User user = new User();

        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setEmail(request.getEmail());
        user.setPassword(request.getPassword());
        user.setPhone(request.getPhone());
        user.setProfileImage("default-profile.png");

        return userRepository.save(user);
    }

    @Override
    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public User login(String email, String password) {

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {

            User user = userOpt.get();

            if (user.getPassword().equals(password)) {
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
        return user.getPassword().equals(rawPassword);
    }

    @Override
    public void updatePassword(User user, String newPassword) {

        user.setPassword(newPassword);

        userRepository.save(user);
    }

    @Override
    public User findUserById(Long id) {

        Optional<User> userOptional = userRepository.findById(id);

        return userOptional.orElse(null);
    }

    // OTP METHODS

    @Override
    public String generateOtp(String email) {

        User user = userRepository.findByEmail(email.toLowerCase())
                .orElseThrow(() ->
                        new RuntimeException("User not found for email: " + email));

        String otp = String.format("%06d",
                new java.util.Random().nextInt(1000000));

        LocalDateTime expiryTime =
                LocalDateTime.now().plusMinutes(5);

        user.setOtp(otp);
        user.setOtpExpiryTime(expiryTime);

        userRepository.save(user);

        emailService.sendOtpEmail(user.getEmail(), otp);

        return otp;
    }

    @Override
    public boolean verifyOtp(String email, String otp) {

        User user =
                userRepository.findByEmail(email.toLowerCase())
                        .orElse(null);

        if (user == null
                || user.getOtp() == null
                || user.getOtpExpiryTime() == null) {

            return false;
        }

        if (user.getOtp().equals(otp)
                && LocalDateTime.now().isBefore(user.getOtpExpiryTime())) {

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
            throw new RuntimeException(
                    "User not found for email: " + email);
        }

        user.setPassword(newPassword);

        userRepository.save(user);
    }
}