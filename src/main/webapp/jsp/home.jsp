<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Find Your Dream Property in Indore - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>


<!-- Hero Section -->
<section class="hero text-center">

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-lg-10">

                <h1>
                    Find Your Dream Property in Indore
                </h1>

                <p>
                    Explore premium homes, luxury villas, apartments and commercial spaces
                    with Propify — your trusted real estate partner.
                </p>

                <div class="search-bar">

                    <h2 class="text-center mb-4">
                        Search Properties
                    </h2>

                    <form action="${pageContext.request.contextPath}/auth/login"
                          method="get"
                          class="form-row">

                        <div class="form-group">

                            <label for="location">
                                Location
                            </label>

                            <select name="location"
                                    id="location"
                                    class="form-select">

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

                        <div class="form-group">

                            <label for="propertyType">
                                Property Type
                            </label>

                            <select name="propertyType"
                                    id="propertyType"
                                    class="form-select">

                                <option value="">Select Property Type</option>
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

                        <div class="form-group">

                            <label for="budget">
                                Budget
                            </label>

                            <input type="text"
                                   name="budget"
                                   id="budget"
                                   class="form-control"
                                   placeholder="10 Lakh - 50 Lakh">

                        </div>

                        <div class="form-group">

                            <button type="submit"
                                    class="btn btn-primary w-100">

                                <i class="fas fa-search me-2"></i>
                                Search

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</section>

<!-- Premium Stats Section -->
<section class="premium-stats">

    <div class="container">

        <div class="stats-wrapper">

            <div class="stat-card">
                <h2>10K+</h2>
                <p>Properties Listed</p>
            </div>

            <div class="stat-card">
                <h2>5K+</h2>
                <p>Happy Clients</p>
            </div>

            <div class="stat-card">
                <h2>50+</h2>
                <p>Cities Covered</p>
            </div>

            <div class="stat-card">
                <h2>99%</h2>
                <p>Success Rate</p>
            </div>

        </div>

    </div>

</section>

<!-- Premium Featured Properties -->
<section class="featured-properties premium-section">

    <div class="container">

        <div class="section-heading">

            <span>Featured Listings</span>

            <h2>
                Premium Properties in Indore
            </h2>

            <p>
                Explore handpicked luxury properties, villas, apartments and commercial spaces.
            </p>

        </div>

        <div class="row g-4">

            <div class="col-lg-4 col-md-6">

                <div class="premium-property-card">

                    <div class="property-img-box">

                        <img src="${pageContext.request.contextPath}/images/sanjanapark1.png"
                             alt="Sanjana Park">

                        <span class="property-badge">
                            Featured
                        </span>

                    </div>

                    <div class="property-content">

                        <h3>SANJANA PARK</h3>

                        <p class="location">
                            <i class="fas fa-map-marker-alt"></i>
                            Rau, Indore
                        </p>

                        <p class="desc">
                            Near Nakhrali Dhani, IIM, CAT Road, Rau, Indore.
                        </p>

                        <div class="property-bottom">

                            <h4>₹ 1 Lakh</h4>

                            <a href="${pageContext.request.contextPath}/auth/login">
                                View Details
                            </a>

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-lg-4 col-md-6">

                <div class="premium-property-card">

                    <div class="property-img-box">

                        <img src="${pageContext.request.contextPath}/images/sanjanaparkpre.png"
                             alt="Shree City">

                        <span class="property-badge">
                            Luxury
                        </span>

                    </div>

                    <div class="property-content">

                        <h3>SHREE CITY</h3>

                        <p class="location">
                            <i class="fas fa-map-marker-alt"></i>
                            Bicholi Mardana, Indore
                        </p>

                        <p class="desc">
                            Near Agarwal Public School, Bicholi Mardana Road.
                        </p>

                        <div class="property-bottom">

                            <h4>₹ 2 Lakh</h4>

                            <a href="${pageContext.request.contextPath}/auth/login">
                                View Details
                            </a>

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-lg-4 col-md-6">

                <div class="premium-property-card">

                    <div class="property-img-box">

                        <img src="${pageContext.request.contextPath}/images/market.png"
                             alt="Agarwal Market">

                        <span class="property-badge">
                            Commercial
                        </span>

                    </div>

                    <div class="property-content">

                        <h3>AGARWAL MARKET</h3>

                        <p class="location">
                            <i class="fas fa-map-marker-alt"></i>
                            Dewas Naka, Indore
                        </p>

                        <p class="desc">
                            A.B. Road, Dewas Naka, Indore, Madhya Pradesh.
                        </p>

                        <div class="property-bottom">

                            <h4>₹ 1 Lakh</h4>

                            <a href="${pageContext.request.contextPath}/auth/login">
                                View Details
                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <div class="text-center mt-5">

            <a href="${pageContext.request.contextPath}/auth/login"
               class="premium-outline-btn">

                See All Listings

            </a>

        </div>

    </div>

</section>

<!-- Premium Why Choose Us -->
<section class="why-premium">

    <div class="container">

        <div class="section-heading">

            <span>Why Propify?</span>

            <h2>
                Why Choose Our Services?
            </h2>

            <p>
                We make property buying, selling and renting simple, secure and premium.
            </p>

        </div>

        <div class="row g-4">

            <div class="col-lg-4 col-md-6">

                <div class="why-card">

                    <div class="why-icon">
                        <i class="fas fa-home"></i>
                    </div>

                    <h3>
                        Wide Range of Properties
                    </h3>

                    <p>
                        Discover premium villas, apartments, plots and commercial spaces across Indore.
                    </p>

                </div>

            </div>

            <div class="col-lg-4 col-md-6">

                <div class="why-card">

                    <div class="why-icon">
                        <i class="fas fa-user-tie"></i>
                    </div>

                    <h3>
                        Trusted Local Experts
                    </h3>

                    <p>
                        Get guidance from experienced people who understand the local real estate market.
                    </p>

                </div>

            </div>

            <div class="col-lg-4 col-md-6">

                <div class="why-card">

                    <div class="why-icon">
                        <i class="fas fa-handshake"></i>
                    </div>

                    <h3>
                        Personalized Support
                    </h3>

                    <p>
                        From search to contact, we help users find the right property with confidence.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>


<!-- Scripts -->
<script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>