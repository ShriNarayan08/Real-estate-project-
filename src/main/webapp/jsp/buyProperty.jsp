<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <%-- Ye naya import kiya hai price formatting ke liye --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buy Properties - Propify </title>
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
            padding-top: 0; /* No need for fixed navbar padding if it's not fixed */
        }

        /* --- Navbar Styles (retained from previous pages) --- */
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

        /* --- Main Content Layout --- */
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

        /* --- Filter Section --- */
        .filter-section {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            margin-bottom: 40px;
        }
        .filter-section .form-label {
            font-weight: 600;
            color: var(--dark-text);
            margin-bottom: 8px;
        }
        .filter-section .form-control,
        .filter-section .form-select {
            border-radius: 8px;
            border: 1px solid #ced4da;
            padding: 10px 15px;
            font-size: 1rem;
        }
        .filter-section .btn-primary {
            background-color: var(--primary-blue);
            border-color: var(--primary-blue);
            font-weight: 600;
            padding: 10px 25px;
            border-radius: 8px;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .filter-section .btn-primary:hover {
            background-color: #0b5ed7;
            border-color: #0a58ca;
        }
        .filter-section .btn-secondary {
            background-color: var(--light-text);
            border-color: var(--light-text);
            font-weight: 600;
            padding: 10px 25px;
            border-radius: 8px;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .filter-section .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }


        /* --- Property Listing Cards --- */
        .property-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            margin-bottom: 30px;
            overflow: hidden; /* Ensures image corners are rounded */
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
            height: 100%; /* Make cards same height */
            display: flex;
            flex-direction: column;
        }
        .property-card:hover {
            transform: translateY(-8px); /* Lift effect on hover */
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }
        .property-card img {
            width: 100%;
            height: 220px; /* Fixed height for consistent card appearance */
            object-fit: cover; /* Ensures image fills space without distortion */
            border-bottom: 1px solid #eee;
        }
        .property-card .card-body {
            padding: 25px;
            flex-grow: 1; /* Allows card body to take remaining height */
            display: flex;
            flex-direction: column;
        }
        .property-card .card-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--purple-brand);
            margin-bottom: 15px;
            line-height: 1.3;
        }
        .property-card .card-text {
            color: var(--light-text);
            margin-bottom: 10px;
            flex-grow: 1; /* Allows text to grow if multiline */
        }
        .property-card .property-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            font-size: 0.95rem;
            color: var(--dark-text);
        }
        .property-card .property-meta i {
            color: var(--primary-blue);
            margin-right: 5px;
        }
        .property-card .property-price {
            font-size: 1.6rem;
            font-weight: 700;
            color: var(--primary-blue);
            margin-bottom: 15px;
        }
        .property-card .btn-details {
            background-color: var(--purple-brand);
            border-color: var(--purple-brand);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .property-card .btn-details:hover {
            background-color: #5936a3;
            border-color: #5936a3;
        }

        /* No Properties Found Message */
        .no-properties-found {
            text-align: center;
            padding: 50px 0;
            color: var(--light-text);
            font-size: 1.2rem;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            margin-bottom: 40px;
        }
        .no-properties-found i {
            font-size: 3rem;
            color: #ccc;
            margin-bottom: 20px;
        }

        /* --- Responsive Adjustments --- */
        @media (max-width: 991px) { /* Medium devices and below */
            .page-header h1 {
                font-size: 2.8rem;
            }
            .page-header p {
                font-size: 1rem;
            }
            .filter-section .col-md-3,
            .filter-section .col-md-2 {
                margin-bottom: 15px; /* Add space between stacked filter columns */
            }
            .filter-section .btn {
                width: 100%; /* Full width buttons on smaller screens */
            }
            .filter-section .d-flex {
                flex-direction: column; /* Stack filter buttons */
            }
        }

        @media (max-width: 767px) { /* Small devices and below */
            .navbar-nav {
                text-align: center;
            }
            .nav-item.mx-2 {
                margin: 0.5rem 0 !important;
            }
            .page-header {
                padding: 40px 0;
                margin-bottom: 30px;
            }
            .page-header h1 {
                font-size: 2.2rem;
            }
            .property-card .card-body {
                padding: 20px;
            }
            .property-card .card-title {
                font-size: 1.3rem;
            }
            .property-card .property-price {
                font-size: 1.4rem;
            }
            .property-card .property-meta {
                flex-direction: column; /* Stack meta info */
                align-items: flex-start;
            }
            .property-card .property-meta div {
                margin-bottom: 5px;
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
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/buy">Buy</a> <%-- Changed from /properties/buy to /buy --%>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/sell">Sell</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/my-properties">My Properties</a> <%-- Added My Properties link --%>
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

<div class="page-header">
    <div class="container">
        <h1>Find Your Dream Property</h1>
        <p>Explore a wide range of properties available for sale across Indore and nearby regions.</p>
    </div>
</div>

<div class="container">

    <div class="filter-section">
        <form action="${pageContext.request.contextPath}/auth/buy" method="get"> <%-- Changed form action to /buy --%>
            <div class="row g-3 align-items-end">
                <div class="col-md-3 col-sm-6">
                    <label for="propertyType" class="form-label">Property Type</label>
                    <select class="form-select" id="propertyType" name="type">
                        <option value="">All Types</option>
                        <option value="Apartment" <c:if test="${param.type eq 'Apartment'}">selected</c:if>>Apartment</option>
                        <option value="House" <c:if test="${param.type eq 'House'}">selected</c:if>>House</option>
                        <option value="Plot" <c:if test="${param.type eq 'Plot'}">selected</c:if>>Plot</option>
                        <option value="Villa" <c:if test="${param.type eq 'Villa'}">selected</c:if>>Villa</option>
                        <option value="Duplex" <c:if test="${param.type eq 'Duplex'}">selected</c:if>>Duplex</option>
                        <option value="Farmhouse" <c:if test="${param.type eq 'Farmhouse'}">selected</c:if>>Farmhouse</option>
                        <option value="Commercial Land" <c:if test="${param.type eq 'Commercial Land'}">selected</c:if>>Commercial Land</option>
                        <option value="Office Space" <c:if test="${param.type eq 'Office Space'}">selected</c:if>>Office Space</option>
                        <option value="Shop" <c:if test="${param.type eq 'Shop'}">selected</c:if>>Shop</option>
                        <option value="Warehouse" <c:if test="${param.type eq 'Warehouse'}">selected</c:if>>Warehouse</option>
                        <option value="Industrial Property" <c:if test="${param.type eq 'Industrial Property'}">selected</c:if>>Industrial Property</option>
                    </select>
                </div>
                <div class="col-md-3 col-sm-6">
                    <label for="location" class="form-label">Location</label>
                    <select class="form-select" id="location" name="location">
                        <option value="">All Locations</option>
                        <option value="Indore" <c:if test="${param.location eq 'Indore'}">selected</c:if>>Indore</option>
                        <option value="Dewas" <c:if test="${param.location eq 'Dewas'}">selected</c:if>>Dewas</option>
                        <option value="Ujjain" <c:if test="${param.location eq 'Ujjain'}">selected</c:if>>Ujjain</option>
                        <option value="Bhopal" <c:if test="${param.location eq 'Bhopal'}">selected</c:if>>Bhopal</option>
                        <option value="Jabalpur" <c:if test="${param.location eq 'Jabalpur'}">selected</c:if>>Jabalpur</option>
                        <option value="Gwalior" <c:if test="${param.location eq 'Gwalior'}">selected</c:if>>Gwalior</option>
                        <option value="Ratlam" <c:if test="${param.location eq 'Ratlam'}">selected</c:if>>Ratlam</option>
                        <option value="Khandwa" <c:if test="${param.location eq 'Khandwa'}">selected</c:if>>Khandwa</option>
                        <option value="Khargone" <c:if test="${param.location eq 'Khargone'}">selected</c:if>>Khargone</option>
                        <option value="Neemuch" <c:if test="${param.location eq 'Neemuch'}">selected</c:if>>Neemuch</option>
                        <option value="Mandsaur" <c:if test="${param.location eq 'Mandsaur'}">selected</c:if>>Mandsaur</option>
                        <option value="Burhanpur" <c:if test="${param.location eq 'Burhanpur'}">selected</c:if>>Burhanpur</option>
                        <option value="Rewa" <c:if test="${param.location eq 'Rewa'}">selected</c:if>>Rewa</option>
                        <option value="Satna" <c:if test="${param.location eq 'Satna'}">selected</c:if>>Satna</option>
                        <option value="Hoshangabad" <c:if test="${param.location eq 'Hoshangabad'}">selected</c:if>>Hoshangabad</option>
                    </select>
                </div>
                <div class="col-md-2 col-sm-6">
                    <label for="minPrice" class="form-label">Min Price</label>
                    <input type="number" class="form-control" id="minPrice" name="minPrice" placeholder="Min" value="${param.minPrice}">
                </div>
                <div class="col-md-2 col-sm-6">
                    <label for="maxPrice" class="form-label">Max Price</label>
                    <input type="number" class="form-control" id="maxPrice" name="maxPrice" placeholder="Max" value="${param.maxPrice}">
                </div>
                <div class="col-md-2 d-flex gap-2">
                    <button type="submit" class="btn btn-primary flex-grow-1"><i class="fas fa-search me-2"></i>Apply Filters</button>
                    <a href="${pageContext.request.contextPath}/auth/buy" class="btn btn-secondary"><i class="fas fa-redo me-2"></i>Reset</a> <%-- Changed reset link to /buy --%>
                </div>
            </div>
        </form>
    </div>
    <div class="row">
        <%-- JSTL 'forEach' loop to iterate over properties. --%>
        <c:choose>
            <c:when test="${not empty properties}">
                <c:forEach var="property" items="${properties}">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="property-card">
                            <%-- Image will now dynamically load from the correct path --%>
                            <img src="${pageContext.request.contextPath}/images/${property.imageName}" class="card-img-top" alt="${property.title}">
                            <div class="card-body">
                                <h5 class="card-title">${property.title}</h5>
                                <p class="card-text text-truncate">${property.description}</p>
                                <div class="property-meta">
                                    <div><i class="fas fa-tag"></i> ${property.type}</div>
                                    <div><i class="fas fa-map-marker-alt"></i> ${property.location}</div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <%-- Price formatting ke liye fmt tag use kiya --%>
                                    <div class="property-price">₹ <fmt:formatNumber value="${property.price}" type="number" maxFractionDigits="0" groupingUsed="true"/></div>
                                    <%-- View Details link dynamically property ID ke saath --%>
                                    <a href="${pageContext.request.contextPath}/auth/properties/details?id=${property.id}" class="btn btn-details">View Details <i class="fas fa-arrow-right ms-2"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-12">
                    <div class="no-properties-found">
                        <i class="fas fa-house-chimney-crack"></i>
                        <p>No properties found matching your criteria. Try adjusting your filters!</p>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <%-- ***** DUMMY PROPERTY CARDS REMOVED FROM HERE ***** --%>
        <%-- Upar wala c:choose block hi ab data show karega ya "No properties found" message --%>

    </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>