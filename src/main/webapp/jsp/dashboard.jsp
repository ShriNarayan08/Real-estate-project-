<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Agarwal Group Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

    <!-- Session Check -->
    <c:if test="${empty loggedInUser}">
        <c:redirect url="${pageContext.request.contextPath}/auth/login" />
    </c:if>

    <header class="bg-white shadow-sm">
        <div class="container">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Agarwal Group Indore Logo" height="40" class="d-inline-block align-top">
                        <span class="ms-2 h4">Agarwal Group Indore</span>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/properties/buy">Buy</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/properties/sell">Sell</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/profile">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/auth/logout">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>

    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <h1 class="text-center mb-4">Welcome, ${loggedInUser.firstName}!</h1>

                <c:if test="${not empty welcomeMessage}">
                    <div class="alert alert-success text-center" role="alert">
                        ${welcomeMessage}
                    </div>
                </c:if>

                <div class="row mt-4">
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm rounded-3 h-100 dashboard-card">
                            <div class="card-body text-center">
                                <i class="fas fa-search-location fa-4x text-primary mb-3"></i>
                                <h3 class="card-title">Explore Properties</h3>
                                <p class="card-text text-muted">Find your next home or investment.</p>
                                <a href="${pageContext.request.contextPath}/properties/buy" class="btn btn-primary rounded-pill">View Listings</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm rounded-3 h-100 dashboard-card">
                            <div class="card-body text-center">
                                <i class="fas fa-hand-holding-usd fa-4x text-success mb-3"></i>
                                <h3 class="card-title">List Your Property</h3>
                                <p class="card-text text-muted">Sell your property with ease and confidence.</p>
                                <a href="${pageContext.request.contextPath}/properties/sell" class="btn btn-success rounded-pill">Sell Now</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm rounded-3 h-100 dashboard-card">
                            <div class="card-body text-center">
                                <i class="fas fa-user-circle fa-4x text-info mb-3"></i>
                                <h3 class="card-title">Manage Profile</h3>
                                <p class="card-text text-muted">Update your personal information and preferences.</p>
                                <a href="${pageContext.request.contextPath}/profile" class="btn btn-info rounded-pill">Go to Profile</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm rounded-3 h-100 dashboard-card">
                            <div class="card-body text-center">
                                <i class="fas fa-heart fa-4x text-danger mb-3"></i>
                                <h3 class="card-title">Your Favorites</h3>
                                <p class="card-text text-muted">View properties you've saved.</p>
                                <a href="${pageContext.request.contextPath}/favorites" class="btn btn-danger rounded-pill">View Favorites</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm rounded-3 h-100 dashboard-card">
                            <div class="card-body text-center">
                                <i class="fas fa-calendar-alt fa-4x text-warning mb-3"></i>
                                <h3 class="card-title">Appointments</h3>
                                <p class="card-text text-muted">Manage your property showings.</p>
                                <a href="${pageContext.request.contextPath}/appointments" class="btn btn-warning rounded-pill">View Appointments</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm rounded-3 h-100 dashboard-card">
                            <div class="card-body text-center">
                                <i class="fas fa-chart-line fa-4x text-secondary mb-3"></i>
                                <h3 class="card-title">Market Insights</h3>
                                <p class="card-text text-muted">Stay updated on Indore's real estate trends.</p>
                                <a href="${pageContext.request.contextPath}/market-insights" class="btn btn-secondary rounded-pill">Learn More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="bg-dark text-white py-4">
        <div class="container text-center">
            <p>&copy; 2025 Agarwal Group Indore. All rights reserved.</p>
            <div class="mt-2">
                <a href="${pageContext.request.contextPath}/privacy" class="text-white me-3">Privacy Policy</a>
                <a href="${pageContext.request.contextPath}/terms" class="text-white me-3">Terms of Service</a>
                <a href="${pageContext.request.contextPath}/contact" class="text-white">Contact Us</a>
            </div>
        </div>
    </footer>

</body>
</html>