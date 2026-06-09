package com.example.realestate.controller;

import com.example.realestate.model.Property;
import com.example.realestate.repository.PropertyRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/auth")
public class PropertyController {

    @Autowired
    private PropertyRepository propertyRepository;

    @GetMapping("/sell")
    public String showSellForm(HttpSession session) {

        if(session.getAttribute("loggedInUser") == null){
            return "redirect:/auth/login";
        }

        return "sellProperty";
    }

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

            String imageName = "default-property.png";

            if (image != null && !image.isEmpty()) {

                Path uploadPath = Paths.get("uploads");

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                imageName =
                        UUID.randomUUID() + "_" + image.getOriginalFilename();

                Files.copy(
                        image.getInputStream(),
                        uploadPath.resolve(imageName),
                        StandardCopyOption.REPLACE_EXISTING
                );
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

            Property savedProperty =
                    propertyRepository.save(property);

            model.addAttribute("property", savedProperty);

            return "property-details";

        } catch (IOException e) {

            e.printStackTrace();

            model.addAttribute(
                    "errorMessage",
                    "Error saving property: " + e.getMessage()
            );

            return "error";
        }
    }

    @PostMapping("/properties/update")
    public String updateProperty(
            @RequestParam Long id,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String type,
            @RequestParam String location,
            @RequestParam Double price
    ) {

        Optional<Property> propertyOpt =
                propertyRepository.findById(id);

        if(propertyOpt.isPresent()) {

            Property property = propertyOpt.get();

            property.setTitle(title);
            property.setDescription(description);
            property.setType(type);
            property.setLocation(location);
            property.setPrice(price);

            propertyRepository.save(property);
        }

        return "redirect:/auth/my-properties";
    }

    @GetMapping("/my-properties")
    public String showAllMyProperties(
            HttpSession session,
            Model model) {

        if(session.getAttribute("loggedInUser") == null){
            return "redirect:/auth/login";
        }

        List<Property> properties =
                propertyRepository.findAll();

        model.addAttribute("properties", properties);

        return "myListedProperties";
    }

    @GetMapping("/properties/edit")
    public String showEditForm(
            @RequestParam("id") Long id,
            Model model) {

        Optional<Property> propertyOpt =
                propertyRepository.findById(id);

        if (propertyOpt.isPresent()) {

            model.addAttribute(
                    "property",
                    propertyOpt.get()
            );

            return "edit-property";
        }

        model.addAttribute(
                "errorMessage",
                "Property not found"
        );

        return "error";
    }

    @GetMapping("/properties/details")
    public String showPropertyDetails(
            @RequestParam("id") Long id,
            Model model) {

        Optional<Property> propertyOptional =
                propertyRepository.findById(id);

        if (propertyOptional.isPresent()) {

            Property property =
                    propertyOptional.get();

            model.addAttribute("property", property);

            return "property-details";

        } else {

            model.addAttribute(
                    "errorMessage",
                    "Property not found with ID: " + id
            );

            return "error";
        }
    }

    @PostMapping("/properties/delete")
    public String deleteProperty(@RequestParam Long id) {

        Optional<Property> propertyOpt =
                propertyRepository.findById(id);

        if (propertyOpt.isPresent()) {

            Property property =
                    propertyOpt.get();

            Path imagePath =
                    Paths.get("uploads",
                            property.getImageName());

            try {
                Files.deleteIfExists(imagePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

            propertyRepository.delete(property);
        }

        return "redirect:/auth/my-properties";
    }


    @GetMapping("/buy")
    public String showBuyProperties(
            HttpSession session,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "location", required = false) String location,
            @RequestParam(value = "minPrice", required = false) Double minPrice,
            @RequestParam(value = "maxPrice", required = false) Double maxPrice,
            Model model) {

        if(session.getAttribute("loggedInUser") == null){
            return "redirect:/auth/login";
        }

        List<Property> properties;

        if (type != null && !type.isEmpty()
                && location != null && !location.isEmpty()
                && minPrice != null && maxPrice != null) {

            properties =
                    propertyRepository
                            .findByTypeIgnoreCaseAndLocationIgnoreCaseAndPriceBetween(
                                    type,
                                    location,
                                    minPrice,
                                    maxPrice
                            );

        } else if (type != null && !type.isEmpty()
                && location != null && !location.isEmpty()) {

            properties =
                    propertyRepository
                            .findByTypeIgnoreCaseAndLocationIgnoreCase(
                                    type,
                                    location
                            );

        } else if (type != null && !type.isEmpty()
                && minPrice != null && maxPrice != null) {

            properties =
                    propertyRepository
                            .findByTypeIgnoreCaseAndPriceBetween(
                                    type,
                                    minPrice,
                                    maxPrice
                            );

        } else if (location != null && !location.isEmpty()
                && minPrice != null && maxPrice != null) {

            properties =
                    propertyRepository
                            .findByLocationIgnoreCaseAndPriceBetween(
                                    location,
                                    minPrice,
                                    maxPrice
                            );

        } else if (type != null && !type.isEmpty()) {

            properties =
                    propertyRepository.findByTypeIgnoreCase(type);

        } else if (location != null && !location.isEmpty()) {

            properties =
                    propertyRepository.findByLocationIgnoreCase(location);

        } else if (minPrice != null && maxPrice != null) {

            properties =
                    propertyRepository.findByPriceBetween(minPrice, maxPrice);

        } else {

            properties = propertyRepository.findAll();
        }

        model.addAttribute("properties", properties);

        return "buyProperty";
    }
}