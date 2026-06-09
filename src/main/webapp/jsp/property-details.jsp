<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>${property.title} - Property Details - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="homy-details-section">

    <div class="container">

        <div class="homy-breadcrumb">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <span>/</span>
            <a href="${pageContext.request.contextPath}/auth/buy">Properties</a>
            <span>/</span>
            <strong>${property.title}</strong>
        </div>

        <div class="homy-details-top">

            <div>

                <span class="homy-tag">
                    ${property.type}
                </span>

                <h1>
                    ${property.title}
                </h1>

                <p>
                    <i class="fas fa-location-dot"></i>
                    ${property.location}
                </p>

            </div>

            <div class="homy-price-box">
                <span>Property Price</span>
                <h2>₹ ${property.price}</h2>
            </div>

        </div>

        <div class="homy-gallery">

            <div class="homy-main-image">
                <img src="${pageContext.request.contextPath}/uploads/${property.imageName}"
                     alt="${property.title}">
            </div>

            <div class="homy-small-gallery">

                <img src="${pageContext.request.contextPath}/uploads/${property.imageName}"
                     alt="${property.title}">

                <img src="${pageContext.request.contextPath}/uploads/${property.imageName}"
                     alt="${property.title}">

            </div>

        </div>

        <div class="homy-content-layout">

            <div class="homy-left-content">

                <div class="homy-overview-card">

                    <div class="homy-overview-item">
                        <i class="fas fa-house"></i>
                        <span>Type</span>
                        <strong>${property.type}</strong>
                    </div>

                    <div class="homy-overview-item">
                        <i class="fas fa-location-dot"></i>
                        <span>Location</span>
                        <strong>${property.location}</strong>
                    </div>

                    <div class="homy-overview-item">
                        <i class="fas fa-indian-rupee-sign"></i>
                        <span>Price</span>
                        <strong>₹ ${property.price}</strong>
                    </div>

                    <div class="homy-overview-item">
                        <i class="fas fa-user-check"></i>
                        <span>Owner</span>
                        <strong>${property.ownerName}</strong>
                    </div>

                </div>

                <div class="homy-card">

                    <h3>
                        Property Description
                    </h3>

                    <p>
                        ${property.description}
                    </p>

                </div>

                <div class="homy-card">

                    <h3>
                        Property Highlights
                    </h3>

                    <div class="homy-amenities">

                        <div>
                            <i class="fas fa-check"></i>
                            Verified Owner
                        </div>

                        <div>
                            <i class="fas fa-check"></i>
                            Prime Location
                        </div>

                        <div>
                            <i class="fas fa-check"></i>
                            Direct Contact
                        </div>

                        <div>
                            <i class="fas fa-check"></i>
                            Premium Listing
                        </div>

                        <div>
                            <i class="fas fa-check"></i>
                            Safe Deal Support
                        </div>

                        <div>
                            <i class="fas fa-check"></i>
                            Propify Verified
                        </div>

                    </div>

                </div>

                <div class="homy-card">

                    <h3>
                        Location
                    </h3>

                    <div class="homy-location-box">

                        <i class="fas fa-map-location-dot"></i>

                        <div>
                            <strong>${property.location}</strong>
                            <p>This property is listed in ${property.location}. Contact owner for exact address and visit details.</p>
                        </div>

                    </div>

                </div>

            </div>

            <div class="homy-sidebar">

                <div class="homy-agent-card">

                    <div class="homy-agent-top">

                        <div class="agent-avatar">
                            <i class="fas fa-user"></i>
                        </div>

                        <div>
                            <span>Property Owner</span>
                            <h3>${property.ownerName}</h3>
                        </div>

                    </div>

                    <div class="agent-contact-row">
                        <i class="fas fa-phone"></i>
                        <span>${property.phone}</span>
                    </div>

                    <a href="tel:${property.phone}"
                       class="agent-call-btn">
                        <i class="fas fa-phone"></i>
                        Call Owner
                    </a>

                    <a href="https://wa.me/91${property.phone}"
                       class="agent-whatsapp-btn"
                       target="_blank">
                        <i class="fab fa-whatsapp"></i>
                        WhatsApp
                    </a>

                </div>

                <div class="homy-inquiry-card">

                    <h3>
                        Send Inquiry
                    </h3>

                    <form>

                        <input type="text"
                               placeholder="Your Name"
                               required>

                        <input type="tel"
                               placeholder="Phone Number"
                               required>

                        <textarea placeholder="I am interested in this property"></textarea>

                        <button type="button"
                                onclick="alert('Inquiry feature backend will be added next.')">
                            Send Message
                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>