<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="pro-dashboard-hero">
    <div class="container">
        <div class="pro-dashboard-content">
            <span>Welcome Back</span>
            <h1>Hello, ${sessionScope.loggedInUser.firstName}!</h1>
            <p>Manage buying, selling, renting, profile and property listings from one powerful dashboard.</p>
        </div>
    </div>
</section>

<section class="pro-dashboard-section">
    <div class="container">

        <div class="pro-stats-grid">
            <div class="pro-stat-card">
                <i class="fas fa-building"></i>
                <h2>10K+</h2>
                <p>Properties Listed</p>
            </div>

            <div class="pro-stat-card">
                <i class="fas fa-users"></i>
                <h2>5K+</h2>
                <p>Happy Clients</p>
            </div>

            <div class="pro-stat-card">
                <i class="fas fa-city"></i>
                <h2>50+</h2>
                <p>Cities Covered</p>
            </div>

            <div class="pro-stat-card">
                <i class="fas fa-chart-line"></i>
                <h2>99%</h2>
                <p>Success Rate</p>
            </div>
        </div>

        <div class="dashboard-main-grid">

            <div class="dashboard-left">

                <div class="dashboard-section-title">
                    <span>Quick Actions</span>
                    <h2>What would you like to do?</h2>
                </div>

                <div class="dashboard-action-grid">

                    <a href="${pageContext.request.contextPath}/auth/buy" class="pro-action-card">
                        <div class="pro-action-icon"><i class="fas fa-search-location"></i></div>
                        <h3>Buy Properties</h3>
                        <p>Explore premium homes, plots, flats and commercial properties.</p>
                        <strong>Explore Now <i class="fas fa-arrow-right"></i></strong>
                    </a>

                    <a href="${pageContext.request.contextPath}/auth/sell" class="pro-action-card">
                        <div class="pro-action-icon"><i class="fas fa-building"></i></div>
                        <h3>Sell Property</h3>
                        <p>List your property and connect with serious buyers quickly.</p>
                        <strong>List Now <i class="fas fa-arrow-right"></i></strong>
                    </a>

                    <a href="#" class="pro-action-card">
                        <div class="pro-action-icon"><i class="fas fa-key"></i></div>
                        <h3>Rent Rooms</h3>
                        <p>Find or list rental rooms, PGs and student accommodation.</p>
                        <strong>Coming Soon <i class="fas fa-arrow-right"></i></strong>
                    </a>

                    <a href="${pageContext.request.contextPath}/auth/my-properties" class="pro-action-card">
                        <div class="pro-action-icon"><i class="fas fa-list-check"></i></div>
                        <h3>My Properties</h3>
                        <p>View, edit and manage all your listed properties.</p>
                        <strong>Manage <i class="fas fa-arrow-right"></i></strong>
                    </a>

                    <a href="${pageContext.request.contextPath}/auth/profile" class="pro-action-card">
                        <div class="pro-action-icon"><i class="fas fa-user-circle"></i></div>
                        <h3>Profile</h3>
                        <p>Update your personal information and account details.</p>
                        <strong>Update Profile <i class="fas fa-arrow-right"></i></strong>
                    </a>

                    <a href="${pageContext.request.contextPath}/contact" class="pro-action-card">
                        <div class="pro-action-icon"><i class="fas fa-headset"></i></div>
                        <h3>Support</h3>
                        <p>Need help? Contact Propify support for assistance.</p>
                        <strong>Contact Us <i class="fas fa-arrow-right"></i></strong>
                    </a>

                </div>
            </div>

            <div class="dashboard-right">

                <div class="market-card">
                    <span>Market Overview</span>
                    <h3>Indore Property Growth</h3>

                    <div class="bar-row">
                        <p>Residential</p>
                        <div><span style="width:85%"></span></div>
                    </div>

                    <div class="bar-row">
                        <p>Commercial</p>
                        <div><span style="width:70%"></span></div>
                    </div>

                    <div class="bar-row">
                        <p>Rental</p>
                        <div><span style="width:62%"></span></div>
                    </div>

                    <div class="bar-row">
                        <p>Plots</p>
                        <div><span style="width:78%"></span></div>
                    </div>
                </div>



            </div>

        </div>

        <div class="recent-property-section">

            <div class="dashboard-section-title">
                <span>Recently Added</span>
                <h2>Latest Properties</h2>
            </div>

            <div class="row g-4">

                <c:choose>
                    <c:when test="${not empty recentProperties}">
                        <c:forEach var="property" items="${recentProperties}">
                            <div class="col-lg-4 col-md-6">
                                <div class="premium-property-card">
                                    <div class="property-img-box">
                                        <img src="${pageContext.request.contextPath}/uploads/${property.imageName}" alt="${property.title}">
                                        <span class="property-badge">${property.type}</span>
                                    </div>

                                    <div class="property-content">
                                        <h3>${property.title}</h3>

                                        <p class="location">
                                            <i class="fas fa-map-marker-alt"></i>
                                                ${property.location}
                                        </p>

                                        <p class="desc">${property.description}</p>

                                        <div class="property-bottom">
                                            <h4>₹ ${property.price}</h4>
                                            <a href="${pageContext.request.contextPath}/auth/properties/details?id=${property.id}">
                                                View Details
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <div class="col-12">
                            <div class="empty-state">
                                <i class="fas fa-house"></i>
                                <h3>No recent properties</h3>
                                <p>Add your first property to show it here.</p>
                                <a href="${pageContext.request.contextPath}/auth/sell" class="premium-outline-btn">
                                    Add Property
                                </a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>

        </div>

    </div>
</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>