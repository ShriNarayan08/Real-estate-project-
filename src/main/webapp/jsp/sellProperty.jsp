<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add Property - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="homy-add-property">

    <div class="container">

        <div class="homy-add-header">
            <span>Add New Property</span>
            <h1>List Your Property</h1>
            <p>Add property details, owner contact and image to publish your listing on Propify.</p>
        </div>

        <form action="${pageContext.request.contextPath}/auth/save"
              method="post"
              enctype="multipart/form-data">

            <div class="homy-add-layout">

                <div class="homy-add-main">

                    <div class="homy-form-box">

                        <div class="homy-form-title">
                            <h3>Basic Information</h3>
                            <p>Enter property title, type, price and location.</p>
                        </div>

                        <div class="row g-4">

                            <div class="col-md-6">
                                <label>Property Title *</label>
                                <input type="text" name="title" placeholder="e.g. 2BHK in Vijay Nagar" required>
                            </div>

                            <div class="col-md-6">
                                <label>Property Type *</label>
                                <select name="type" required>
                                    <option value="">Select Type</option>
                                    <option>Apartment</option>
                                    <option>House</option>
                                    <option>Plot</option>
                                    <option>Villa</option>
                                    <option>Duplex</option>
                                    <option>Farmhouse</option>
                                    <option>Commercial Land</option>
                                    <option>Office Space</option>
                                    <option>Shop</option>
                                    <option>Warehouse</option>
                                    <option>Industrial Property</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label>Expected Price *</label>
                                <input type="number" name="price" placeholder="e.g. 3000000" required>
                            </div>

                            <div class="col-md-6">
                                <label>Property Location *</label>
                                <select name="location" required>
                                    <option value="">Select Location</option>
                                    <option>Indore</option>
                                    <option>Dewas</option>
                                    <option>Ujjain</option>
                                    <option>Bhopal</option>
                                    <option>Jabalpur</option>
                                    <option>Gwalior</option>
                                    <option>Ratlam</option>
                                    <option>Khandwa</option>
                                    <option>Khargone</option>
                                    <option>Neemuch</option>
                                    <option>Mandsaur</option>
                                    <option>Burhanpur</option>
                                    <option>Rewa</option>
                                    <option>Satna</option>
                                    <option>Hoshangabad</option>
                                </select>
                            </div>

                        </div>

                    </div>

                    <div class="homy-form-box">

                        <div class="homy-form-title">
                            <h3>Property Description</h3>
                            <p>Describe amenities, nearby landmarks and special features.</p>
                        </div>

                        <label>Description *</label>
                        <textarea name="description"
                                  placeholder="Enter detailed property information..."
                                  required></textarea>

                    </div>

                    <div class="homy-form-box">

                        <div class="homy-form-title">
                            <h3>Contact Information</h3>
                            <p>Buyer will contact you using these details.</p>
                        </div>

                        <div class="row g-4">

                            <div class="col-md-6">
                                <label>Owner Name *</label>
                                <input type="text" name="ownerName" placeholder="Your full name" required>
                            </div>

                            <div class="col-md-6">
                                <label>Contact Number *</label>
                                <input type="text" name="contactNumber" placeholder="10-digit mobile number" required>
                            </div>

                        </div>

                    </div>

                </div>

                <div class="homy-add-sidebar">

                    <div class="homy-upload-card">

                        <h3>Property Image</h3>
                        <p>Upload a clear and attractive property image.</p>

                        <div class="homy-upload-box">
                            <input type="file"
                                   name="image"
                                   accept="image/*"
                                   onchange="previewImage(event)"
                                   required>

                            <div id="preview" class="homy-preview">
                                <i class="fas fa-cloud-arrow-up"></i>
                                <strong>Upload Image</strong>
                                <span>JPG, PNG or JPEG supported</span>
                            </div>
                        </div>

                    </div>

                    <div class="homy-tips-card">

                        <h3>Listing Tips</h3>

                        <ul>
                            <li><i class="fas fa-check"></i> Use a clear property photo</li>
                            <li><i class="fas fa-check"></i> Add correct price and location</li>
                            <li><i class="fas fa-check"></i> Write detailed description</li>
                            <li><i class="fas fa-check"></i> Keep contact number active</li>
                        </ul>

                    </div>

                    <button type="submit" class="homy-submit-btn">
                        <i class="fas fa-paper-plane"></i>
                        Submit Property
                    </button>

                    <a href="${pageContext.request.contextPath}/dashboard" class="homy-cancel-btn">
                        Cancel
                    </a>

                </div>

            </div>

        </form>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script>
    function previewImage(event) {
        const preview = document.getElementById("preview");
        const file = event.target.files[0];

        if (file) {
            const reader = new FileReader();

            reader.onload = function () {
                preview.innerHTML = '<img src="' + reader.result + '" alt="Property Image Preview">';
            };

            reader.readAsDataURL(file);
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>