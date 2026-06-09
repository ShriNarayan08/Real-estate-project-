<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="main-header">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <nav class="navbar navbar-expand-lg">

        <div class="container">

            <a class="navbar-brand d-flex align-items-center"
               href="${pageContext.request.contextPath}/home">

                <img src="${pageContext.request.contextPath}/images/logo2.png"
                     height="55"
                     class="logo-img">

                <span class="brand-name ms-2">
                    Propify
                </span>

            </a>

            <button class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#mainNavbar">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div class="collapse navbar-collapse"
                 id="mainNavbar">

                <ul class="navbar-nav ms-auto align-items-center">

                    <!-- Guest User -->
                    <c:if test="${empty sessionScope.loggedInUser}">

                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/home">
                                Home
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/contact">
                                Contact
                            </a>
                        </li>

                        <li class="nav-item ms-3">
                            <a class="logout-btn"
                               href="${pageContext.request.contextPath}/auth/login">
                                Login
                            </a>
                        </li>

                        <li class="nav-item ms-2">
                            <a class="logout-btn"
                               href="${pageContext.request.contextPath}/auth/register">
                                Register
                            </a>
                        </li>

                    </c:if>

                    <!-- Logged In User -->
                    <c:if test="${not empty sessionScope.loggedInUser}">

                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/dashboard">
                                Dashboard
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/auth/buy">
                                Buy
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/auth/sell">
                                Sell
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"
                               href="#">
                                Rent
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/auth/my-properties">
                                My Properties
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/auth/profile">
                                Profile
                            </a>
                        </li>

                        <li class="nav-item">
                            <span class="nav-link text-primary fw-bold">
                                <i class="fas fa-user-circle me-1"></i>
                                ${loggedInUser.firstName}
                            </span>
                        </li>

                        <li class="nav-item ms-3">
                            <a class="logout-btn"
                               href="${pageContext.request.contextPath}/auth/logout">
                                Logout
                            </a>
                        </li>

                    </c:if>

                </ul>

            </div>

        </div>

    </nav>

</header>