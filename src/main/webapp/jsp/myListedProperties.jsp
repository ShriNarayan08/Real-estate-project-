<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>My Properties - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="my-listing-hero">

    <div class="container">

        <span class="my-listing-badge">
            My Listings
        </span>

        <h1>
            Manage Your Properties
        </h1>

        <p>
            View, edit and manage all your listed properties from one premium dashboard.
        </p>

        <a href="${pageContext.request.contextPath}/auth/sell" class="my-listing-hero-btn">
            <i class="fas fa-plus"></i>
            Add New Property
        </a>

    </div>

</section>

<section class="my-listing-section">

    <div class="container">

        <div class="listing-heading">

            <div>
                <span>Your Properties</span>
                <h2>Listed Properties</h2>
            </div>

            <p>
                Keep your listings updated to reach more buyers.
            </p>

        </div>

        <div class="row g-4">

            <c:choose>

                <c:when test="${not empty properties}">

                    <c:forEach var="property" items="${properties}">

                        <div class="col-lg-4 col-md-6">

                            <div class="premium-property-card manage-property-card">

                                <div class="property-img-box">

                                    <img src="${pageContext.request.contextPath}/uploads/${property.imageName}"
                                         alt="${property.title}">

                                    <span class="property-badge">
                                            ${property.type}
                                    </span>

                                </div>

                                <div class="property-content">

                                    <h3>
                                            ${property.title}
                                    </h3>

                                    <p class="location">
                                        <i class="fas fa-map-marker-alt"></i>
                                            ${property.location}
                                    </p>

                                    <p class="desc">
                                            ${property.description}
                                    </p>

                                    <div class="property-meta-premium">

                                        <span>
                                            <i class="fas fa-tag"></i>
                                            ${property.type}
                                        </span>

                                        <span>
                                            <i class="fas fa-indian-rupee-sign"></i>
                                            ₹ ${property.price}
                                        </span>

                                    </div>

                                    <div class="manage-actions">

                                        <a href="${pageContext.request.contextPath}/auth/properties/details?id=${property.id}"
                                           class="manage-btn view-btn">
                                            <i class="fas fa-eye"></i>
                                            View
                                        </a>

                                        <a href="${pageContext.request.contextPath}/auth/properties/edit?id=${property.id}"
                                           class="manage-btn edit-btn">
                                            <i class="fas fa-pen"></i>
                                            Edit
                                        </a>

                                        <form action="${pageContext.request.contextPath}/auth/properties/delete"
                                              method="post"
                                              onsubmit="return confirm('Are you sure you want to delete this property?');">

                                            <input type="hidden" name="id" value="${property.id}">

                                            <button type="submit" class="manage-btn delete-btn">
                                                <i class="fas fa-trash"></i>
                                                Delete
                                            </button>

                                        </form>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </c:forEach>

                </c:when>

                <c:otherwise>

                    <div class="col-12">

                        <div class="empty-state">

                            <i class="fas fa-house-chimney-crack"></i>

                            <h3>
                                No properties listed yet
                            </h3>

                            <p>
                                Start by listing your first property and reach potential buyers.
                            </p>

                            <a href="${pageContext.request.contextPath}/auth/sell" class="premium-outline-btn">
                                List Your Property Now
                            </a>

                        </div>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>