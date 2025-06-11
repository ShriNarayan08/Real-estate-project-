<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - Propify Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* Custom styles for About Us page */
        .page-header {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('${pageContext.request.contextPath}/images/indore-skyline.jpg') no-repeat center center; /* Replace with a suitable image of Indore if possible */
            background-size: cover;
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        .page-header h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 15px;
        }
        .page-header p {
            font-size: 1.25rem;
            max-width: 800px;
            margin: 0 auto;
        }
        .section-title {
            font-size: 2.5rem;
            font-weight: 600;
            color: var(--bs-primary); /* Assuming --bs-primary is defined in your style.css or Bootstrap */
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }
        .section-title::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: var(--bs-warning); /* A contrasting color */
            border-radius: 2px;
        }
        .feature-icon {
            font-size: 3rem;
            color: var(--bs-primary);
            margin-bottom: 20px;
        }
        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid var(--bs-primary);
            margin-bottom: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .team-member h5 {
            font-weight: 600;
            color: var(--bs-dark);
        }
        .team-member p {
            color: var(--bs-secondary);
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
              <li class="nav-item mx-3">
                <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Home</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="${pageContext.request.contextPath}/auth/buy">Buy</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="${pageContext.request.contextPath}/sell">Sell</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="${pageContext.request.contextPath}/auth/my-properties">My Properties</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="${pageContext.request.contextPath}/auth/profile">Profile</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/about">About</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link text-warning" href="${pageContext.request.contextPath}/login">Logout</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <div class="page-header">
        <div class="container">
            <h1>About Propify Indore</h1>
            <p class="lead">Your trusted partner for buying, selling, and renting properties in Indore.</p>
        </div>
    </div>

    <main class="container py-5">
        <section class="mb-5 text-center">
            <h2 class="section-title">Who We Are</h2>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <p class="lead">
                        Propify Indore is a leading real estate platform dedicated to simplifying your property journey in the vibrant city of Indore.
                        Whether you're looking for your dream home, an ideal investment opportunity, or the perfect buyer for your property, we are here to guide you every step of the way.
                    </p>
                    <p>
                        Founded with a vision to bring transparency, efficiency, and personalized service to the Indore real estate market, Propify Indore leverages cutting-edge technology
                        and local expertise to deliver unparalleled results. We believe in building lasting relationships with our clients, rooted in trust and mutual respect.
                    </p>
                </div>
            </div>
        </section>

        <section class="mb-5 text-center bg-light p-5 rounded-3">
            <h2 class="section-title">Our Mission & Values</h2>
            <div class="row mt-4">
                <div class="col-md-4 mb-4">
                    <i class="bi bi-bullseye feature-icon"></i>
                    <h4>Mission</h4>
                    <p>To empower individuals and families to achieve their property aspirations in Indore through an intuitive, reliable, and comprehensive platform.</p>
                </div>
                <div class="col-md-4 mb-4">
                    <i class="bi bi-lightbulb feature-icon"></i>
                    <h4>Innovation</h4>
                    <p>Continuously striving to implement the latest technology to enhance user experience and streamline property transactions.</p>
                </div>
                <div class="col-md-4 mb-4">
                    <i class="bi bi-hand-thumbs-up feature-icon"></i>
                    <h4>Integrity</h4>
                    <p>Conducting all our dealings with the highest ethical standards, ensuring honesty and transparency in every interaction.</p>
                </div>
                <div class="col-md-4 mb-4">
                    <i class="bi bi-people feature-icon"></i>
                    <h4>Customer Centricity</h4>
                    <p>Placing our clients' needs at the forefront, providing personalized support and exceptional service.</p>
                </div>
                <div class="col-md-4 mb-4">
                    <i class="bi bi-journal-check feature-icon"></i>
                    <h4>Local Expertise</h4>
                    <p>Leveraging deep knowledge of the Indore real estate market to offer informed advice and optimal solutions.</p>
                </div>
                <div class="col-md-4 mb-4">
                    <i class="bi bi-shield-check feature-icon"></i>
                    <h4>Trust</h4>
                    <p>Building long-term relationships based on reliability, security, and proven results.</p>
                </div>
            </div>
        </section>

        <section class="mb-5 text-center">
            <h2 class="section-title">Our Team</h2>
            <p class="lead mb-4">Meet the dedicated professionals who make Propify Indore a success.</p>
            <div class="row justify-content-center">
                <div class="col-md-4 col-sm-6 mb-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team-member-1.jpg" alt="Team Member 1">
                        <h5>Aarav Sharma</h5>
                        <p class="text-primary">Founder & CEO</p>
                        <p class="text-muted">Visionary leader guiding Propify Indore's strategic growth and innovation.</p>
                        <div class="social-icons">
                            <a href="#" class="text-primary me-2"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="text-primary"><i class="fab fa-twitter"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 mb-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team-member-2.jpg" alt="Team Member 2">
                        <h5>Priya Singh</h5>
                        <p class="text-primary">Head of Sales</p>
                        <p class="text-muted">Expert in connecting clients with their perfect properties.</p>
                        <div class="social-icons">
                            <a href="#" class="text-primary me-2"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="text-primary"><i class="fab fa-twitter"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 mb-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/team-member-3.jpg" alt="Team Member 3">
                        <h5>Rahul Verma</h5>
                        <p class="text-primary">Technology Lead</p>
                        <p class="text-muted">Driving the technological innovations behind our platform.</p>
                        <div class="social-icons">
                            <a href="#" class="text-primary me-2"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="text-primary"><i class="fab fa-twitter"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-5 text-center bg-info bg-opacity-10 p-5 rounded-3">
            <h2 class="section-title">Why Choose Us?</h2>
            <div class="row justify-content-center align-items-center mt-4">
                <div class="col-lg-6">
                    <ul class="list-unstyled text-start fs-5">
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i> Extensive Property Listings in Indore</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i> Verified Properties & Authentic Information</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i> User-Friendly Interface & Advanced Search</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i> Dedicated Customer Support</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i> Secure and Transparent Transactions</li>
                    </ul>
                </div>
                <div class="col-lg-6 mt-4 mt-lg-0">
                    <img src="${pageContext.request.contextPath}/images/why-choose-us.jpg" alt="Why Choose Us" class="img-fluid rounded shadow-sm">
                </div>
            </div>
        </section>

    </main>

    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-1">&copy; 2025 <strong>Propify Indore</strong>. All rights reserved.</p>
            <div class="d-flex justify-content-center gap-3 mt-2 flex-wrap">
                <a href="${pageContext.request.contextPath}/privacy" class="text-white text-decoration-none footer-link">Privacy Policy</a>
                <a href="${pageContext.request.contextPath}/terms" class="text-white text-decoration-none footer-link">Terms of Service</a>
                <a href="${pageContext.request.contextPath}/contact" class="text-white text-decoration-none footer-link">Contact Us</a>
            </div>
            <div class="mt-3 social-icons">
                <a href="#" class="text-white me-3"><i class="bi bi-facebook fs-5"></i></a>
                <a href="#" class="text-white me-3"><i class="bi bi-instagram fs-5"></i></a>
                <a href="#" class="text-white"><i class="bi bi-twitter fs-5"></i></a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>