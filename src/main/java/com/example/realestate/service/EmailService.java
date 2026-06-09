package com.example.realestate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value; // 👈 Isko import karo
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    // 👈 Yeh automatic application.properties se wahi email utha lega jo tumne setup kiya hai
    @Value("${spring.mail.username}")
    private String fromEmail;

    public void sendOtpEmail(String toEmail, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(fromEmail); // 👈 Hardcoded email ki jagah variable use karo
        message.setTo(toEmail);
        message.setSubject("Propify Indore: Your Password Reset OTP");
        message.setText("Dear User,\n\nYour One-Time Password (OTP) for password reset is: " + otp + "\n\nThis OTP is valid for 5 minutes.\n\nDo not share this OTP with anyone.\n\nRegards,\nPropify Indore Team");

        try {
            mailSender.send(message);
            System.out.println("OTP email sent successfully to " + toEmail);
        } catch (MailException e) {
            System.err.println("Error sending OTP email to " + toEmail + ": " + e.getMessage());
            throw new RuntimeException("Failed to send OTP email.", e);
        }
    }
}