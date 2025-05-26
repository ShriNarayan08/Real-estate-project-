<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile - Agarwal Group Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">
    <script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<header class="bg-white shadow-sm">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">
                    <img src="/images/logo.png" alt="Agarwal Group Indore Logo" height="40">
                    <span class="ms-2 h4">Agarwal Group Indore</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="/home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/properties/buy">Buy</a></li>
                        <li class="nav-item"><a class="nav-link" href="/properties/sell">Sell</a></li>
                        <li class="nav-item"><a class="nav-link active" href="/auth/profile">Profile</a></li>
                        <li class="nav-item"><a class="nav-link" href="/about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/contact">Contact</a></li>
                        <li class="nav-item">
                            <form method="post" action="/auth/logout">
                                <button class="btn btn-link nav-link" type="submit">Logout</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <h1 class="text-center mb-4">My Profile</h1>

            <!-- Flash messages -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <!-- Profile Info -->
            <div class="card shadow-lg mb-5">
                <div class="card-body p-4">
                    <h2 class="card-title mb-4">Personal Information</h2>
                    <form:form method="post" modelAttribute="userProfile" id="userProfile">
                        <div class="form-floating mb-3">
                            <form:input path="firstName" class="form-control" id="firstName" placeholder="First Name" readonly="true"/>
                            <label for="firstName">First Name</label>
                            <form:errors path="firstName" cssClass="text-danger"/>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input path="lastName" class="form-control" id="lastName" placeholder="Last Name" readonly="true"/>
                            <label for="lastName">Last Name</label>
                            <form:errors path="lastName" cssClass="text-danger"/>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input path="email" class="form-control" id="email" placeholder="Email" readonly="true"/>
                            <label for="email">Email Address</label>
                            <form:errors path="email" cssClass="text-danger"/>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input path="phone" class="form-control" id="phone" placeholder="Phone" readonly="true"/>
                            <label for="phone">Phone Number</label>
                            <form:errors path="phone" cssClass="text-danger"/>
                        </div>
                        <div class="d-flex justify-content-end mt-4">
                            <button type="button" class="btn btn-outline-primary me-2" id="editProfileBtn">Edit Profile</button>
                            <button type="submit" class="btn btn-primary d-none" id="saveProfileBtn">Save Changes</button>
                            <button type="button" class="btn btn-secondary ms-2 d-none" id="cancelEditBtn">Cancel</button>
                        </div>
                    </form:form>
                </div>
            </div>

            <!-- Change Password -->
            <div class="card shadow-lg">
                <div class="card-body p-4">
                    <h2 class="card-title mb-4">Change Password</h2>
                    <form action="change-password" method="post" id="changePasswordForm">
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Current Password" required autocomplete="off">
                            <label for="currentPassword">Current Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required autocomplete="off">
                            <label for="newPassword">New Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" placeholder="Confirm New Password" required autocomplete="off">
                            <label for="confirmNewPassword">Confirm New Password</label>
                        </div>
                        <div class="d-flex justify-content-end mt-4">
                            <button type="submit" class="btn btn-warning">Change Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="bg-dark text-white py-4 mt-5">
    <div class="container text-center">
        <p>&copy; 2025 Agarwal Group Indore. All rights reserved.</p>
        <div class="mt-2">
            <a href="/privacy" class="text-white me-3">Privacy Policy</a>
            <a href="/terms" class="text-white me-3">Terms of Service</a>
            <a href="/contact" class="text-white">Contact Us</a>
        </div>
    </div>
</footer>

<script>
    $(function () {
        const fields = $('#firstName, #lastName, #email, #phone');
        const editBtn = $('#editProfileBtn');
        const saveBtn = $('#saveProfileBtn');
        const cancelBtn = $('#cancelEditBtn');

        function toggleEditMode(isEditable) {
            fields.prop('readonly', !isEditable);
            editBtn.toggleClass('d-none', isEditable);
            saveBtn.toggleClass('d-none', !isEditable);
            cancelBtn.toggleClass('d-none', !isEditable);
        }

        toggleEditMode(false);

        editBtn.on('click', () => toggleEditMode(true));
        cancelBtn.on('click', () => {
            toggleEditMode(false);
            location.reload();
        });

        $('#changePasswordForm').on('submit', function (e) {
            const newPassword = $('#newPassword').val();
            const confirmNewPassword = $('#confirmNewPassword').val();

            if (newPassword !== confirmNewPassword) {
                $.notify("New passwords do not match.", {
                    className: 'error',
                    globalPosition: 'top center'
                });
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>