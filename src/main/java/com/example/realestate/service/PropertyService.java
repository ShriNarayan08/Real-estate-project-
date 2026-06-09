package com.example.realestate.service;

import com.example.realestate.model.Property;
import com.example.realestate.repository.PropertyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
@Service
public class PropertyService {
    @Autowired
    private PropertyRepository propertyRepository;

    public Property saveProperty(Property property, MultipartFile file) {
        String uploadDir = "src/main/webapp/uploads/";
        String fileName = file.getOriginalFilename();

        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            file.transferTo(new File(uploadDir + fileName));
            property.setImageName(fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return propertyRepository.save(property);
    }
}
