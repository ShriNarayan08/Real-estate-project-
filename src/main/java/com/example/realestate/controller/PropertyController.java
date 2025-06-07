package com.example.realestate.controller;

import com.example.realestate.model.Property;
import com.example.realestate.repository.PropertyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;
import java.util.Optional;

@Controller
@RequestMapping("/auth") // Isse /auth/sell, /auth/save, /auth/my-properties, /auth/properties/details URLs banenge
public class PropertyController {

    @Autowired
    private PropertyRepository propertyRepository;

    // Show the Sell Property Form (fine as is)
    @GetMapping("/sell")
    public String showSellForm() {
        return "sell"; // Corresponds to sell.jsp
    }

    // Handle Form Submission and Save Property (fine as is)
    @PostMapping("/save")
    public String saveProperty(
            @RequestParam("title") String title,
            @RequestParam("type") String type,
            @RequestParam("description") String description,
            @RequestParam("price") double price,
            @RequestParam("location") String location,
            @RequestParam("ownerName") String ownerName,
            @RequestParam("contactNumber") String phone,
            @RequestParam("image") MultipartFile image,
            Model model
    ) {
        try {
            String imageName = null;
            if (!image.isEmpty()) {
                imageName = UUID.randomUUID() + "_" + image.getOriginalFilename();
                File uploadDir = new ClassPathResource("static/images/").getFile();
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                Path path = Paths.get(uploadDir.getAbsolutePath(), imageName);
                Files.write(path, image.getBytes());
            }

            Property property = new Property();
            property.setTitle(title);
            property.setType(type);
            property.setDescription(description);
            property.setPrice(price);
            property.setLocation(location);
            property.setOwnerName(ownerName);
            property.setPhone(phone);
            property.setImageName(imageName);

            Property savedProperty = propertyRepository.save(property);
            model.addAttribute("property", savedProperty);
            return "property-details";
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error saving property: " + e.getMessage());
            return "error";
        }
    }

    // Show All My Properties (fine as is)
    @GetMapping("/my-properties")
    public String showAllMyProperties(Model model) {
        List<Property> properties = propertyRepository.findAll();
        model.addAttribute("properties", properties);
        return "myListedProperties";
    }

    // Property Details Page Handler (fine as is)
    @GetMapping("/properties/details")
    public String showPropertyDetails(@RequestParam("id") Long id, Model model) {
        Optional<Property> propertyOptional = propertyRepository.findById(id);
        if (propertyOptional.isPresent()) {
            Property property = propertyOptional.get();
            model.addAttribute("property", property);
            return "property-details";
        } else {
            model.addAttribute("errorMessage", "Property not found with ID: " + id);
            return "error";
        }
    }

    // --- ⚠️ YEH WALA METHOD HAI ASLI KHEL! ⚠️ ---
    // Pehle yeh /auth/properties/buy tha. Ab isko /buy kar do
    // NOTE: Kyunki PropertyController par @RequestMapping("/auth") hai,
    // toh iska final URL ab bhi `/auth/buy` hi rahega!

    @GetMapping("/buy") // ⚠️ Change kiya hai! /properties/buy se /buy ⚠️
    public String showBuyProperties(@RequestParam(value = "type", required = false) String type,
                                    @RequestParam(value = "location", required = false) String location,
                                    @RequestParam(value = "minPrice", required = false) Double minPrice,
                                    @RequestParam(value = "maxPrice", required = false) Double maxPrice,
                                    Model model) {
        List<Property> properties;

        if (type != null && !type.isEmpty() && location != null && !location.isEmpty() && minPrice != null && maxPrice != null) {
            properties = propertyRepository.findByTypeIgnoreCaseAndLocationIgnoreCaseAndPriceBetween(type, location, minPrice, maxPrice);
        } else if (type != null && !type.isEmpty() && location != null && !location.isEmpty()) {
            properties = propertyRepository.findByTypeIgnoreCaseAndLocationIgnoreCase(type, location);
        } else if (type != null && !type.isEmpty() && minPrice != null && maxPrice != null) {
            properties = propertyRepository.findByTypeIgnoreCaseAndPriceBetween(type, minPrice, maxPrice);
        } else if (location != null && !location.isEmpty() && minPrice != null && maxPrice != null) {
            properties = propertyRepository.findByLocationIgnoreCaseAndPriceBetween(location, minPrice, maxPrice);
        } else if (type != null && !type.isEmpty()) {
            properties = propertyRepository.findByTypeIgnoreCase(type);
        } else if (location != null && !location.isEmpty()) {
            properties = propertyRepository.findByLocationIgnoreCase(location);
        } else if (minPrice != null && maxPrice != null) {
            properties = propertyRepository.findByPriceBetween(minPrice, maxPrice);
        } else {
            properties = propertyRepository.findAll(); // Agar koi filter nahi toh saari properties
        }

        model.addAttribute("properties", properties);
        return "buyProperty"; // buyProperty.jsp page dikhao
    }
}