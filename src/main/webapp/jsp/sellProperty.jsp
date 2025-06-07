<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sell Your Property - Propify Indore</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        :root {
            --primary-blue: #0d6efd;
            --purple-brand: #6f42c1;
            --light-gray-bg: #f8f9fa;
            --dark-text: #343a40;
            --light-text: #6c757d;
            --card-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-gray-bg);
            margin: 0;
            padding-top: 0; /* Remove if fixed navbar was removed */
        }

        /* --- Navbar Styles (retained for consistency) --- */
        .navbar {
            padding-top: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e0e0e0;
        }
        .navbar-brand img {
            margin-right: 0.75rem;
        }
        .navbar-brand .text-primary {
            color: var(--purple-brand) !important;
            font-weight: 700;
        }
        /* Adjusted nav-link margin to be consistent with mx-2 on nav-item */
        .nav-link {
            color: var(--dark-text) !important;
            font-weight: 500;
            /* margin-right: 15px; */ /* This can be removed or kept, as mx-2 on li handles spacing */
            transition: color 0.2s ease;
        }
        .nav-link:hover {
            color: var(--purple-brand) !important;
        }
        .nav-link.text-warning {
            color: #ffc107 !important;
        }
        .nav-link.text-warning:hover {
            color: #e0a800 !important;
        }
        .navbar-toggler {
            border-color: rgba(0,0,0,.1);
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%280, 0, 0, 0.55%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }

        /* --- Page Specific Styles --- */
        .page-header {
            background: linear-gradient(135deg, var(--purple-brand), #8a5acd);
            color: white;
            padding: 60px 0;
            text-align: center;
            margin-bottom: 40px;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            box-shadow: var(--card-shadow);
        }
        .page-header h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 15px;
            letter-spacing: 0.05em;
        }
        .page-header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            margin-bottom: 50px;
        }

        .form-container h2 {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--purple-brand);
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group label {
            font-weight: 600;
            color: var(--dark-text);
            margin-bottom: 8px;
            display: flex; /* For icon alignment */
            align-items: center;
        }
        .form-group label i {
            margin-right: 8px;
            color: var(--primary-blue); /* Icon color */
        }

        .form-control, .form-select, .form-control-file {
            border-radius: 8px;
            padding: 12px 15px;
            font-size: 1rem;
            border: 1px solid #dee2e6;
        }
        .form-control:focus, .form-select:focus, .form-control-file:focus {
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        textarea.form-control {
            min-height: 120px; /* Slightly taller textarea */
            resize: vertical;
        }

        .image-preview {
            width: 100%;
            height: 200px;
            border: 2px dashed #a0a0a0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #888;
            font-size: 1rem; /* Adjusted font size */
            border-radius: 8px; /* Consistent border radius */
            margin-top: 15px; /* More space */
            overflow: hidden;
            background-color: #e9ecef;
            flex-direction: column; /* Center text vertically */
            gap: 10px; /* Space between text and icon */
        }
        .image-preview i {
            font-size: 2.5rem; /* Larger icon */
            color: #adb5bd;
        }
        .image-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            display: block;
        }

        .submit-btn {
            background: var(--purple-brand);
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 1.2rem;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            margin-top: 30px;
            transition: background-color 0.2s ease, transform 0.2s ease;
        }
        .submit-btn:hover {
            background: #5936a3;
            transform: translateY(-2px); /* Slight lift effect */
        }

        /* Responsive adjustments */
        @media (max-width: 991px) { /* Medium devices and below */
            .page-header h1 {
                font-size: 2.8rem;
            }
            .page-header p {
                font-size: 1rem;
            }
            .form-container {
                padding: 30px;
            }
            .form-container h2 {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 767px) { /* Small devices and below */
            .navbar-nav {
                text-align: center;
            }
            .nav-item.mx-2 {
                margin: 0.5rem 0 !important; /* Ensure vertical spacing on small screens */
            }
            .page-header {
                padding: 40px 0;
                margin-bottom: 30px;
            }
            .page-header h1 {
                font-size: 2.2rem;
            }
            .form-container {
                padding: 20px;
                margin: 30px auto;
            }
            .submit-btn {
                font-size: 1.1rem;
                padding: 12px 25px;
            }
        }
    </style>
</head>
<body>

<header class="bg-white shadow-sm">
  <nav class="navbar navbar-expand-lg navbar-light bg-white px-4">
    <div class="container-fluid">
      <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
        <img src="${pageContext.request.contextPath}/images/logo2.png" alt="Propify Indore Logo" height="60" class="me-2">
        <span class="fw-bold fs-4 text-primary">Propify Indore</span>
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="mainNavbar">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Home</a>
          </li>
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/buy">Buy</a>
          </li>
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link" href="${pageContext.request.contextPath}/sell">Sell</a>
          </li>
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/my-properties">My Properties</a>
          </li>
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/profile">Profile</a>
          </li>
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
          </li>
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
          </li>
          <li class="nav-item mx-2"> <%-- Added mx-2 for consistent spacing --%>
            <a class="nav-link text-warning" href="${pageContext.request.contextPath}/login">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<div class="page-header">
    <div class="container">
        <h1>List Your Property with Propify Indore</h1>
        <p>Fill out the form below to easily list your property for sale and reach potential buyers.</p>
    </div>
</div>

<div class="container form-container">
    <h2>Property Details</h2>
    <form action="${pageContext.request.contextPath}/auth/save" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="propertyTitle"><i class="fas fa-heading"></i> Property Title</label>
                    <input type="text" id="propertyTitle" name="title" placeholder="e.g. 2BHK in Vijay Nagar" required class="form-control">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="propertyType"><i class="fas fa-building"></i> Property Type</label>
                    <select id="propertyType" name="type" required class="form-control">
                         <option value="">-- Select Type --</option>
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
            </div>
        </div>

        <div class="form-group mb-3">
            <label for="propertyDescription"><i class="fas fa-clipboard-list"></i> Property Description</label>
            <textarea id="propertyDescription" name="description" placeholder="Enter detailed property information: amenities, nearby landmarks, unique features, etc." required class="form-control"></textarea>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="expectedPrice"><i class="fas fa-rupee-sign"></i> Expected Price (INR)</label>
                    <input type="number" id="expectedPrice" name="price" placeholder="e.g. 3000000" required class="form-control">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="propertyLocation"><i class="fas fa-map-marker-alt"></i> Property Location</label>
                    <select id="propertyLocation" name="location" required class="form-control">
                        <option value="">-- Select Location --</option>
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

        <h3 class="mt-4 mb-3 text-secondary text-center">Contact Information</h3>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="ownerName"><i class="fas fa-user"></i> Your Name</label>
                    <input type="text" id="ownerName" name="ownerName" placeholder="Your Full Name" required class="form-control">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="contactNumber"><i class="fas fa-phone-alt"></i> Contact Number</label>
                    <input type="text" id="contactNumber" name="contactNumber" placeholder="10-digit mobile number" required class="form-control">
                </div>
            </div>
        </div>

        <div class="form-group mb-4">
            <label for="propertyImage"><i class="fas fa-image"></i> Upload Property Image</label>
            <input type="file" id="propertyImage" name="image" accept="image/*" onchange="previewImage(event)" required class="form-control">
            <div class="image-preview" id="preview">
                <i class="fas fa-cloud-arrow-up"></i>
                <span>Image Preview</span>
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="submit-btn"><i class="fas fa-paper-plane me-2"></i> Submit Property</button>
        </div>
    </form>
</div>

<script>
   function previewImage(event) {
       const preview = document.getElementById("preview");
       const file = event.target.files[0];

       if (file) {
           const reader = new FileReader();

           reader.onload = function () {
               // Log the entire Data URL to the console (for debugging)
               console.log("FileReader result (Data URL):", reader.result.substring(0, 100) + "..."); // Log only first 100 chars
               preview.innerHTML = `<img src="${reader.result}" alt="Property Image Preview">`;
           }

           reader.onerror = function(e) {
               console.error("FileReader error:", e);
               preview.innerHTML = `<i class="fas fa-exclamation-circle text-danger"></i> <span>Error loading image.</span>`;
           };

           reader.readAsDataURL(file);
       } else {
           preview.innerHTML = `<i class="fas fa-cloud-arrow-up"></i> <span>Image Preview</span>`; // Reset to initial state
       }
   }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>