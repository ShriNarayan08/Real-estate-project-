// src/main/java/com/example/realestate/repository/PropertyRepository.java
package com.example.realestate.repository;

import com.example.realestate.model.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository // Ye Spring ko batata hai ki ye ek repository hai
public interface PropertyRepository extends JpaRepository<Property, Long> {
    // JpaRepository sabhi common CRUD operations provide karta hai (findAll, findById, save, etc.)
    // Agar aapko custom query chahiye toh yahan add kar sakte ho.

    // Filtering ke liye custom methods (buyProperty.jsp ke filters ke liye)

    List<Property> findByTypeIgnoreCase(String type);
    List<Property> findByLocationIgnoreCase(String location);
    List<Property> findByPriceBetween(double minPrice, double maxPrice);
    List<Property> findByTypeIgnoreCaseAndLocationIgnoreCase(String type, String location);
    List<Property> findByTypeIgnoreCaseAndPriceBetween(String type, double minPrice, double maxPrice);
    List<Property> findByLocationIgnoreCaseAndPriceBetween(String location, double minPrice, double maxPrice);
    List<Property> findByTypeIgnoreCaseAndLocationIgnoreCaseAndPriceBetween(String type, String location, double minPrice, double maxPrice);
    List<Property> findTop3ByOrderByIdDesc();
}