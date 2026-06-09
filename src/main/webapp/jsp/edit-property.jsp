<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Property - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="edit-hero">

    <div class="container">

        <span class="edit-badge">
            Edit Listing
        </span>

        <h1>
            Update Your Property
        </h1>

        <p>
            Keep your property details updated to attract more serious buyers.
        </p>

    </div>

</section>

<section class="edit-section">

    <div class="container">

        <div class="edit-layout">

            <div class="edit-preview-card">

                <div class="edit-preview-image">

                    <img src="${pageContext.request.contextPath}/uploads/${property.imageName}"
                         alt="${property.title}">

                    <span>
                        Current Image
                    </span>

                </div>

                <div class="edit-preview-content">

                    <h3>
                        ${property.title}
                    </h3>

                    <p>
                        <i class="fas fa-map-marker-alt"></i>
                        ${property.location}
                    </p>

                    <h4>
                        ₹ ${property.price}
                    </h4>

                </div>

            </div>

            <div class="edit-form-card">

                <div class="section-heading edit-form-heading">

                    <span>Property Form</span>

                    <h2>
                        Edit Details
                    </h2>

                    <p>
                        Update title, type, description, location and price.
                    </p>

                </div>

                <form action="${pageContext.request.contextPath}/auth/properties/update"
                      method="post">

                    <input type="hidden"
                           name="id"
                           value="${property.id}">

                    <div class="row g-3">

                        <div class="col-md-6">

                            <label class="premium-label">
                                Property Title
                            </label>

                            <div class="premium-input">
                                <i class="fas fa-heading"></i>

                                <input type="text"
                                       name="title"
                                       value="${property.title}"
                                       required>
                            </div>

                        </div>

                        <div class="col-md-6">

                            <label class="premium-label">
                                Property Type
                            </label>

                            <div class="premium-input">
                                <i class="fas fa-building"></i>

                                <select name="type" required>

                                    <option value="Apartment" ${property.type == 'Apartment' ? 'selected' : ''}>Apartment</option>
                                    <option value="House" ${property.type == 'House' ? 'selected' : ''}>House</option>
                                    <option value="Plot" ${property.type == 'Plot' ? 'selected' : ''}>Plot</option>
                                    <option value="Villa" ${property.type == 'Villa' ? 'selected' : ''}>Villa</option>
                                    <option value="Duplex" ${property.type == 'Duplex' ? 'selected' : ''}>Duplex</option>
                                    <option value="Farmhouse" ${property.type == 'Farmhouse' ? 'selected' : ''}>Farmhouse</option>
                                    <option value="Commercial Land" ${property.type == 'Commercial Land' ? 'selected' : ''}>Commercial Land</option>
                                    <option value="Office Space" ${property.type == 'Office Space' ? 'selected' : ''}>Office Space</option>
                                    <option value="Shop" ${property.type == 'Shop' ? 'selected' : ''}>Shop</option>
                                    <option value="Warehouse" ${property.type == 'Warehouse' ? 'selected' : ''}>Warehouse</option>
                                    <option value="Industrial Property" ${property.type == 'Industrial Property' ? 'selected' : ''}>Industrial Property</option>

                                </select>
                            </div>

                        </div>

                        <div class="col-12">

                            <label class="premium-label">
                                Description
                            </label>

                            <div class="premium-input textarea-input">
                                <i class="fas fa-clipboard-list"></i>

                                <textarea name="description"
                                          required>${property.description}</textarea>
                            </div>

                        </div>

                        <div class="col-md-6">

                            <label class="premium-label">
                                Location
                            </label>

                            <div class="premium-input">
                                <i class="fas fa-location-dot"></i>

                                <select name="location" required>

                                    <option value="Indore" ${property.location == 'Indore' ? 'selected' : ''}>Indore</option>
                                    <option value="Dewas" ${property.location == 'Dewas' ? 'selected' : ''}>Dewas</option>
                                    <option value="Ujjain" ${property.location == 'Ujjain' ? 'selected' : ''}>Ujjain</option>
                                    <option value="Bhopal" ${property.location == 'Bhopal' ? 'selected' : ''}>Bhopal</option>
                                    <option value="Jabalpur" ${property.location == 'Jabalpur' ? 'selected' : ''}>Jabalpur</option>
                                    <option value="Gwalior" ${property.location == 'Gwalior' ? 'selected' : ''}>Gwalior</option>
                                    <option value="Ratlam" ${property.location == 'Ratlam' ? 'selected' : ''}>Ratlam</option>
                                    <option value="Khandwa" ${property.location == 'Khandwa' ? 'selected' : ''}>Khandwa</option>
                                    <option value="Khargone" ${property.location == 'Khargone' ? 'selected' : ''}>Khargone</option>
                                    <option value="Neemuch" ${property.location == 'Neemuch' ? 'selected' : ''}>Neemuch</option>
                                    <option value="Mandsaur" ${property.location == 'Mandsaur' ? 'selected' : ''}>Mandsaur</option>
                                    <option value="Burhanpur" ${property.location == 'Burhanpur' ? 'selected' : ''}>Burhanpur</option>
                                    <option value="Rewa" ${property.location == 'Rewa' ? 'selected' : ''}>Rewa</option>
                                    <option value="Satna" ${property.location == 'Satna' ? 'selected' : ''}>Satna</option>
                                    <option value="Hoshangabad" ${property.location == 'Hoshangabad' ? 'selected' : ''}>Hoshangabad</option>

                                </select>
                            </div>

                        </div>

                        <div class="col-md-6">

                            <label class="premium-label">
                                Price
                            </label>

                            <div class="premium-input">
                                <i class="fas fa-indian-rupee-sign"></i>

                                <input type="number"
                                       name="price"
                                       value="${property.price}"
                                       required>
                            </div>

                        </div>

                        <div class="col-12">

                            <div class="edit-actions">

                                <a href="${pageContext.request.contextPath}/auth/my-properties"
                                   class="edit-back-btn">
                                    <i class="fas fa-arrow-left"></i>
                                    Back
                                </a>

                                <button type="submit"
                                        class="edit-submit-btn">
                                    <i class="fas fa-save"></i>
                                    Update Property
                                </button>

                            </div>

                        </div>

                    </div>

                </form>

            </div>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>