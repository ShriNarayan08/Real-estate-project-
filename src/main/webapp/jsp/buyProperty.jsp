<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Buy Properties - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="homy-listing-hero">
    <div class="container">
        <span>Premium Properties</span>
        <h1>Find Your Dream Property</h1>
        <p>Explore verified homes, villas, plots and commercial spaces across Indore and nearby cities.</p>
    </div>
</section>

<section class="homy-listing-section">

    <div class="container">

        <div class="homy-search-card">

            <form action="${pageContext.request.contextPath}/auth/buy" method="get">

                <div class="row g-3 align-items-end">

                    <div class="col-lg-3 col-md-6">
                        <label>Property Type</label>
                        <select name="type">
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

                    <div class="col-lg-3 col-md-6">
                        <label>Location</label>
                        <select name="location">
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

                    <div class="col-lg-2 col-md-6">
                        <label>Min Price</label>
                        <input type="number" name="minPrice" placeholder="Min" value="${param.minPrice}">
                    </div>

                    <div class="col-lg-2 col-md-6">
                        <label>Max Price</label>
                        <input type="number" name="maxPrice" placeholder="Max" value="${param.maxPrice}">
                    </div>

                    <div class="col-lg-2 col-md-12">
                        <div class="homy-filter-actions">
                            <button type="submit">
                                <i class="fas fa-search"></i>
                                Search
                            </button>

                            <a href="${pageContext.request.contextPath}/auth/buy">
                                <i class="fas fa-rotate-right"></i>
                            </a>
                        </div>
                    </div>

                </div>

            </form>

        </div>

        <div class="homy-listing-top">

            <div>
                <span>Available Listings</span>
                <h2>Properties For Sale</h2>
            </div>

            <p>Browse premium property options matching your needs.</p>

        </div>

        <div class="row g-4">

            <c:choose>

                <c:when test="${not empty properties}">

                    <c:forEach var="property" items="${properties}">

                        <div class="col-lg-4 col-md-6">

                            <div class="homy-property-card">

                                <div class="homy-property-img">

                                    <img src="${pageContext.request.contextPath}/uploads/${property.imageName}"
                                         alt="${property.title}">

                                    <span class="homy-property-badge">
                                            ${property.type}
                                    </span>

                                    <button type="button" class="homy-heart">
                                        <i class="far fa-heart"></i>
                                    </button>

                                </div>

                                <div class="homy-property-body">

                                    <div class="homy-price">
                                        ₹ <fmt:formatNumber value="${property.price}" type="number" maxFractionDigits="0" groupingUsed="true"/>
                                    </div>

                                    <h3>
                                            ${property.title}
                                    </h3>

                                    <p class="homy-location">
                                        <i class="fas fa-location-dot"></i>
                                            ${property.location}
                                    </p>

                                    <p class="homy-desc">
                                            ${property.description}
                                    </p>

                                    <div class="homy-card-features">

                                        <span>
                                            <i class="fas fa-house"></i>
                                            ${property.type}
                                        </span>

                                        <span>
                                            <i class="fas fa-user-check"></i>
                                            Verified
                                        </span>

                                        <span>
                                            <i class="fas fa-phone"></i>
                                            Contact
                                        </span>

                                    </div>

                                    <div class="homy-card-footer">

                                        <a href="${pageContext.request.contextPath}/auth/properties/details?id=${property.id}">
                                            View Details
                                            <i class="fas fa-arrow-right"></i>
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

                            <i class="fas fa-house-chimney-crack"></i>

                            <h3>No properties found</h3>

                            <p>No properties match your filters. Try changing location, type or price range.</p>

                            <a href="${pageContext.request.contextPath}/auth/buy" class="premium-outline-btn">
                                Reset Filters
                            </a>

                        </div>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script>
    document.querySelectorAll(".homy-heart").forEach(function(btn){
        btn.addEventListener("click", function(){
            const icon = this.querySelector("i");
            icon.classList.toggle("far");
            icon.classList.toggle("fas");
            this.classList.toggle("active");
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>