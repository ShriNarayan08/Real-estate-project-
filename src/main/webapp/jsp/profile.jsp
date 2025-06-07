<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile - Propify Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- External CSS and Fonts --%>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <%-- Internal CSS for Profile Page Specific Styling --%>
    <style>
        :root {
            --primary-blue: #0d6efd;
            --purple-brand: #6f42c1; /* Adjusted to match your desired brand color */
            --light-gray-bg: #f8f9fa;
            --dark-text: #343a40;
            --light-text: #6c757d;
            --card-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        body {
            font-family: 'Inter', sans-serif; /* Consistent font */
            background-color: var(--light-gray-bg);
        }

        /* Navbar styles (can be moved to style.css if not already there) */
        .navbar-brand .text-primary {
            color: var(--purple-brand) !important;
            font-weight: 700;
        }
        .nav-link {
            color: var(--dark-text) !important;
            font-weight: 500;
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

        /* Page Header - consistent with sell.jsp */
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

        /* Card and Form Styling */
        .card {
            border: none;
            transition: transform 0.2s ease-in-out;
        }
        .card:hover {
            transform: translateY(-3px);
        }

        .form-label {
            font-weight: 600;
            color: var(--dark-text);
            display: flex;
            align-items: center;
            margin-bottom: 8px; /* Added margin-bottom for labels */
        }
        .form-label i {
            margin-right: 8px;
            color: var(--primary-blue);
        }

        .form-control[readonly] {
            background-color: #e9ecef; /* Light gray background for readonly fields */
            cursor: default;
        }

        /* Footer - consistent with sell.jsp */
        .footer-link {
            transition: color 0.2s ease;
        }
        .footer-link:hover {
            color: var(--primary-blue) !important;
        }
        .social-icons a {
            transition: color 0.2s ease, transform 0.2s ease;
        }
        .social-icons a:hover {
            color: var(--primary-blue) !important;
            transform: translateY(-2px);
        }

        /* Responsive adjustments */
        @media (max-width: 991px) { /* Medium devices and below */
            .page-header h1 {
                font-size: 2.8rem;
            }
            .page-header p {
                font-size: 1rem;
            }
            .card {
                padding: 30px !important;
            }
        }

        @media (max-width: 767px) { /* Small devices and below */
            .navbar-nav {
                text-align: center;
            }
            .nav-item.mx-3 {
                margin: 0.5rem 0 !important;
            }
            .page-header {
                padding: 40px 0;
                margin-bottom: 30px;
            }
            .page-header h1 {
                font-size: 2.2rem;
            }
            .card {
                padding: 20px !important;
                margin: 30px auto;
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
            <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
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
        <h1>My Profile</h1>
        <p>Manage your personal information and password.</p>
    </div>
</div>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7">
            <div class="card shadow-lg rounded-4 p-4 mb-5">
                <div class="text-center mb-4">
                    <%-- Dynamic Profile Image Source --%>
                    <img src="<c:url value="${userProfile.profileImage != null && !userProfile.profileImage.isEmpty() ? '/uploads/' += userProfile.profileImage : '/images/default-profile.png'}" />"
                         alt="Profile Picture" class="rounded-circle border border-3 border-secondary shadow-sm" id="profileImagePreview"
                         style="width: 150px; height: 150px; object-fit: cover;">
                    <div class="mt-3">
                        <%-- Input for image file upload (initially hidden) --%>
                        <input type="file" id="profileImageInput" name="profileImageFile" class="d-none" accept="image/*">
                        <button type="button" class="btn btn-sm btn-outline-primary d-none" id="uploadImageBtn">
                            <i class="fas fa-upload me-2"></i> Upload Image
                        </button>
                    </div>
                </div>

                <form:form method="post" modelAttribute="userProfile" id="userProfileForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/auth/profile">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="firstName" class="form-label"><i class="fas fa-user me-2"></i>First Name</label>
                            <form:input path="firstName" class="form-control" id="firstName" readonly="true"/>
                        </div>
                        <div class="col-md-6">
                            <label for="lastName" class="form-label"><i class="fas fa-user me-2"></i>Last Name</label>
                            <form:input path="lastName" class="form-control" id="lastName" readonly="true"/>
                        </div>
                        <div class="col-md-12">
                            <label for="email" class="form-label"><i class="fas fa-envelope me-2"></i>Email</label>
                            <form:input path="email" class="form-control" id="email" readonly="true"/>
                        </div>
                        <div class="col-md-12">
                            <label for="phone" class="form-label"><i class="fas fa-phone me-2"></i>Phone</label>
                            <form:input path="phone" class="form-control" id="phone" readonly="true"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end mt-4 gap-2">
                        <button type="button" class="btn btn-outline-primary" id="editProfileBtn"><i class="fas fa-edit me-2"></i>Edit</button>
                        <button type="submit" class="btn btn-success d-none" id="saveProfileBtn"><i class="fas fa-save me-2"></i>Save</button>
                        <button type="button" class="btn btn-secondary d-none" id="cancelEditBtn"><i class="fas fa-times me-2"></i>Cancel</button>
                    </div>
                </form:form>
            </div>

            <div class="card shadow-lg rounded-4 p-4">
                <h5 class="mb-4 text-primary"><i class="fas fa-key me-3"></i>Change Password</h5>
                <form action="${pageContext.request.contextPath}/auth/change-password" method="post" id="changePasswordForm">
                    <div class="mb-3">
                        <label for="currentPassword" class="form-label"><i class="fas fa-lock me-2"></i>Current Password</label>
                        <input type="password" name="currentPassword" id="currentPassword" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="newPassword" class="form-label"><i class="fas fa-lock-open me-2"></i>New Password</label>
                        <input type="password" name="newPassword" id="newPassword" class="form-control" required>
                    </div>
                    <div class="mb-4">
                        <label for="confirmNewPassword" class="form-label"><i class="fas fa-check-circle me-2"></i>Confirm New Password</label>
                        <input type="password" name="confirmNewPassword" id="confirmNewPassword" class="form-control" required>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-warning"><i class="fas fa-exchange-alt me-2"></i>Change Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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

<%-- JQuery and Bootstrap JS --%>
<script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<%-- Notify.js for flash messages --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    $(function () {
        const fields = $('#firstName, #lastName, #email, #phone');
        const editBtn = $('#editProfileBtn');
        const saveBtn = $('#saveProfileBtn');
        const cancelBtn = $('#cancelEditBtn');
        const profileImageInput = $('#profileImageInput');
        const profileImagePreview = $('#profileImagePreview');
        const uploadImageBtn = $('#uploadImageBtn');
        const userProfileForm = $('#userProfileForm');

        // Function to toggle edit mode
        function toggleEdit(editMode) {
            fields.prop('readonly', !editMode);
            editBtn.toggleClass('d-none', editMode);
            saveBtn.toggleClass('d-none', !editMode);
            cancelBtn.toggleClass('d-none', !editMode);
            // The upload button should ONLY be visible when in editMode
            uploadImageBtn.toggleClass('d-none', !editMode);
        }

        // Initial state: not in edit mode
        // The uploadImageBtn is initially hidden by the `d-none` class in the HTML.
        // It should only appear when the user clicks 'Edit'.
        toggleEdit(false); // This ensures the upload button is hidden at page load.


        // Edit button click handler
        editBtn.on('click', () => toggleEdit(true));

        // Cancel button click handler: revert changes and exit edit mode
        cancelBtn.on('click', () => {
            location.reload(); // Reloads the page to fetch fresh data and reset form
        });

        // Trigger file input click when upload button is clicked
        uploadImageBtn.on('click', () => profileImageInput.click());

        // Handle image preview
        profileImageInput.on('change', function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => profileImagePreview.attr('src', e.target.result);
                reader.readAsDataURL(file);
            }
        });

        // Handle success/error messages using notify.js
        <c:if test="${not empty successMessage}">
            $.notify("${successMessage}", {
                position: "top center",
                className: "success"
            });
        </c:if>
        <c:if test="${not empty errorMessage}">
            $.notify("${errorMessage}", {
                position: "top center",
                className: "error"
            });
        </c:if>

        // Password change form validation
        $('#changePasswordForm').on('submit', function (e) {
            const newPass = $('#newPassword').val();
            const confirmPass = $('#confirmNewPassword').val();
            if (newPass !== confirmPass) {
                e.preventDefault();
                $.notify("New passwords do not match.", {
                    position: "top center",
                    className: "error"
                });
            }
        });
    });
</script>

</body>
</html>