<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>${property.title} - Property Details - Propify Indore</title> <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        :root {
            --primary-blue: #0d6efd;
            --purple-brand: #6f42c1;
            --light-gray-bg: #f8f9fa;
            --dark-text: #343a40;
            --light-text: #6c757d;
        }

        body {
            background-color: var(--light-gray-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
        }

        /* Navbar Specific Styles */
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
        .nav-link {
            color: var(--dark-text) !important;
            font-weight: 500;
            margin-right: 15px;
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

        /* Main Container for Details */
        .container {
            max-width: 900px;
            margin-top: 50px;
            margin-bottom: 50px;
        }

        h2.page-title { /* Changed from h2.text-center for more specific styling */
            font-weight: 700;
            color: var(--primary-blue);
            margin-bottom: 40px;
            letter-spacing: 0.05em;
            text-align: center;
        }

        /* Property Image Styling */
        .property-img {
            width: 100%;
            max-height: 450px; /* Limit height for larger images */
            border-radius: 12px;
            object-fit: cover; /* Ensures image covers area without distortion */
            box-shadow: 0 8px 20px rgba(0,0,0,0.15); /* Stronger shadow */
            margin-bottom: 35px; /* More space below image */
            border: 1px solid #e9ecef; /* Lighter border */
        }

        /* Card Styling */
        .card {
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1); /* Slightly stronger shadow */
            padding: 35px; /* Increased padding */
            background-color: #ffffff;
            border: none; /* Remove default card border */
        }

        .card p {
            font-size: 1.1rem;
            margin-bottom: 15px;
            color: var(--dark-text);
            display: flex; /* Use flexbox for label-value alignment */
            align-items: baseline; /* Align text at baseline */
            line-height: 1.4;
        }

        .card p strong {
            color: var(--purple-brand); /* Changed to purple for brand consistency */
            min-width: 120px; /* Increased min-width for labels */
            display: inline-block;
            font-weight: 600; /* Slightly bolder */
            margin-right: 15px; /* Space between label and value */
        }

        .card p span {
            flex-grow: 1; /* Allow value to take remaining space */
            color: var(--light-text); /* Lighter color for values */
        }

        /* Specific styling for description to allow more flexibility */
        .card p.property-description span {
            white-space: pre-wrap; /* Preserves whitespace and wraps text */
            word-wrap: break-word; /* Breaks long words */
            font-style: italic; /* Emphasize description */
            color: var(--dark-text); /* Keep description dark */
        }

        /* Contact button styling */
        .contact-btn {
            background-color: var(--purple-brand);
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            display: inline-block; /* Allow other elements next to it */
            margin-top: 30px;
            transition: background-color 0.2s ease, transform 0.1s ease;
        }
        .contact-btn:hover {
            background-color: #5936a3; /* Darker purple */
            transform: translateY(-2px); /* Slight lift effect */
            color: white; /* Keep text white on hover */
        }
        .contact-btn:active {
            transform: translateY(0); /* Return to original position on click */
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                margin-top: 25px;
                margin-bottom: 25px;
            }
            .card {
                padding: 25px;
            }
            h2.page-title {
                font-size: 1.8rem;
                margin-bottom: 30px;
            }
            .card p {
                flex-direction: column; /* Stack label and value on small screens */
                align-items: flex-start;
            }
            .card p strong {
                margin-bottom: 5px;
                min-width: unset; /* Remove min-width on small screens */
            }
            .nav-link {
                margin-right: 0; /* Remove right margin on mobile */
            }
            .navbar-nav {
                text-align: center; /* Center nav items on collapse */
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
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Home</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/buy">Buy</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/sell">Sell</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/profile">Profile</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link text-warning" href="${pageContext.request.contextPath}/login">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<div class="container">
    <h2 class="page-title">Property Details</h2>

    <div class="text-center mb-4"> <img src="${pageContext.request.contextPath}/images/${property.imageName}" class="property-img img-fluid" alt="Property Image"/>
    </div>


    <div class="card">
        <p><strong>Title:</strong> <span>${property.title}</span></p>
        <p><strong>Type:</strong> <span>${property.type}</span></p>
        <p class="property-description"><strong>Description:</strong> <span>${property.description}</span></p>
        <p><strong>Price:</strong> <span>₹ ${property.price}</span></p>
        <p><strong>Location:</strong> <span>${property.location}</span></p>
        <p><strong>Owner:</strong> <span>${property.ownerName}</span></p>
        <p><strong>Contact:</strong> <span>${property.phone}</span></p>

        <a href="tel:${property.phone}" class="contact-btn text-decoration-none">Call Owner</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>