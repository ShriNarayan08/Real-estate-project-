package com.example.realestate.model; // Corrected package name

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "users") // Database table ka naam
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment primary key
    private Long id; // Changed to Long for auto-increment

    @Column(nullable = false, length = 50) // NOT NULL, maximum length 50
    private String firstName; // Corresponds to name in your previous User, but better as firstName

    @Column(nullable = false, length = 50)
    private String lastName; // Added for consistency with RegistrationRequest

    @Column(nullable = false, unique = true, length = 100) // NOT NULL, UNIQUE, max length 100
    private String email; // Corresponds to userName in your previous User, but better as email

    @Column(length = 12) // Phone number field, length 20
    private String phone; // Added for consistency with RegistrationRequest

    @Column(nullable = false, length = 255) // Store hashed password, so use a large length
    private String password;

    @Column
    private String profileImage; // Make sure getter/setter are present

    @Column(nullable = false)
    private boolean enabled; // To indicate if user account is active

    @Column(nullable = false)
    private LocalDateTime createdAt; // Timestamp for creation

    @Column(nullable = false)
    private LocalDateTime updatedAt; // Timestamp for last update

    private String otp;
    private LocalDateTime otpExpiryTime;


    // Constructors
    public User() {
        this.enabled = true; // Default to true
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    // Constructor for registration (password will be hashed by service)
    public User(String firstName, String lastName, String email, String phone, String password) {
        this(); // Call default constructor to set default values
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public LocalDateTime getOtpExpiryTime() {
        return otpExpiryTime;
    }

    public void setOtpExpiryTime(LocalDateTime otpExpiryTime) {
        this.otpExpiryTime = otpExpiryTime;
    }

    // Override equals and hashCode methods (Recommended for JPA Entities)
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id != null && id.equals(user.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    // Override toString method (Optional, for debugging)
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", enabled=" + enabled +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
