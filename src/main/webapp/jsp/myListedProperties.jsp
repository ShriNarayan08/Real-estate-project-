<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Listed Properties - Propify Indore</title>
    <%-- Link to consolidated CSS --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <%-- Bootstrap and Font Awesome via CDN (as they are external libraries) --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            <a class="nav-link" href="${pageContext.request.contextPath}/auth/my-properties">My Properties</a>
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
        <h1>All Listed Properties</h1>
        <p>Explore all the properties currently listed on Propify Indore.</p>
    </div>
</div>

<div class="container">
    <div class="row">
        <c:choose>
            <c:when test="${not empty properties}">
                <c:forEach var="property" items="${properties}">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="property-card">
                            <img src="${pageContext.request.contextPath}/images/${property.imageName}" class="card-img-top" alt="${property.title}">
                            <div class="card-body">
                                <h5 class="card-title">${property.title}</h5>
                                <p class="card-text text-truncate">${property.description}</p>
                                <div class="property-meta">
                                    <div><i class="fas fa-tag"></i> ${property.type}</div>
                                    <div><i class="fas fa-map-marker-alt"></i> ${property.location}</div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="property-price">₹ ${property.price}</div>
                                    <a href="${pageContext.request.contextPath}/properties/details?id=${property.id}" class="btn btn-details">View Details <i class="fas fa-arrow-right ms-2"></i></a>
                                </div>
                                <div class="mt-3 d-flex justify-content-end gap-2">
                                    <a href="${pageContext.request.contextPath}/properties/edit?id=${property.id}" class="btn btn-info btn-sm"><i class="fas fa-edit me-1"></i> Edit</a>
                                    <form action="${pageContext.request.contextPath}/properties/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this property?');">
                                        <input type="hidden" name="id" value="${property.id}">
                                        <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt me-1"></i> Delete</button>
                                    </form>
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
                        <p>No properties found yet. Be the first to list one!</p>
                        <a href="${pageContext.request.contextPath}/sell" class="btn btn-primary mt-3">List Your Property Now</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>