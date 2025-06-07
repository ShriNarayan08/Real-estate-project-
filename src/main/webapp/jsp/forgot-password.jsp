<%-- src/main/webapp/WEB-INF/jsp/forgot-password.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - Propify Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        /* Optional: Add some specific styles for forgot-password if needed, or rely on style.css */
        .card {
            border-radius: 1rem;
        }
        .form-floating > label {
            padding: 1rem .75rem;
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
                  <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item mx-3">
                  <a class="nav-link" href="${pageContext.request.contextPath}/buy">Buy</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
                </li>
                <li class="nav-item mx-3">
                  <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                </li>
                <li class="nav-item mx-3">
                  <a class="nav-link text-warning" href="${pageContext.request.contextPath}/regis">Register</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </header>

    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7">
                <div class="card shadow-lg p-4">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Forgot Your Password?</h2>
                        <p class="text-muted text-center mb-4">Enter your email to receive a password reset OTP.</p>

                        <div id="step1" class="mb-4">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" placeholder="name@example.com" required>
                                <label for="email">Email address</label>
                            </div>
                            <button type="button" class="btn btn-primary w-100 py-2" id="requestOtpBtn">Request OTP</button>
                        </div>

                        <div id="step2" class="d-none mb-4">
                            <p class="text-center text-success mb-3">An OTP has been sent to your email.</p>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="otp" placeholder="Enter OTP" required>
                                <label for="otp">Enter OTP</label>
                            </div>
                            <button type="button" class="btn btn-primary w-100 py-2 mb-2" id="verifyOtpBtn">Verify OTP</button>
                            <button type="button" class="btn btn-outline-secondary w-100 py-2" id="resendOtpBtn">Resend OTP</button>
                        </div>

                        <div id="step3" class="d-none mb-4">
                            <p class="text-center text-success mb-3">OTP verified. Set your new password.</p>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="newPassword" placeholder="New Password" required>
                                <label for="newPassword">New Password</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="confirmNewPassword" placeholder="Confirm New Password" required>
                                <label for="confirmNewPassword">Confirm New Password</label>
                            </div>
                            <button type="button" class="btn btn-success w-100 py-2" id="resetPasswordBtn">Reset Password</button>
                        </div>

                        <div class="mt-4 text-center">
                            <p>Remember your password? <a href="${pageContext.request.contextPath}/login">Log in</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="bg-dark text-white py-4 mt-auto">
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
    <script>
        $(document).ready(function() {
            const contextPath = "${pageContext.request.contextPath}";
            let userEmail = ''; // Store email globally once entered

            // Function to show notifications
            function showNotification(message, type) {
                $.notify(message, {
                    position: "top center",
                    className: type
                });
            }

            // Step 1: Request OTP
            $('#requestOtpBtn').on('click', function() {
                userEmail = $('#email').val();
                if (!userEmail) {
                    showNotification('Please enter your email.', 'error');
                    return;
                }

                $.ajax({
                    url: contextPath + '/auth/forgot-password/request-otp',
                    type: 'POST',
                    data: { email: userEmail },
                    success: function(response) {
                        showNotification(response, 'success');
                        $('#step1').addClass('d-none');
                        $('#step2').removeClass('d-none');
                    },
                    error: function(xhr) {
                        showNotification('Error: ' + xhr.responseText, 'error');
                    }
                });
            });

            // Step 2: Verify OTP
            $('#verifyOtpBtn').on('click', function() {
                const otp = $('#otp').val();
                if (!otp) {
                    showNotification('Please enter the OTP.', 'error');
                    return;
                }

                $.ajax({
                    url: contextPath + '/auth/forgot-password/verify-otp',
                    type: 'POST',
                    data: { email: userEmail, otp: otp },
                    success: function(response) {
                        if (response.includes("verified successfully")) {
                            showNotification(response, 'success');
                            $('#step2').addClass('d-none');
                            $('#step3').removeClass('d-none');
                        } else {
                            showNotification(response, 'error');
                        }
                    },
                    error: function(xhr) {
                        showNotification('Error: ' + xhr.responseText, 'error');
                    }
                });
            });

            // Resend OTP
            $('#resendOtpBtn').on('click', function() {
                if (!userEmail) {
                    showNotification('Please enter your email first.', 'error');
                    return;
                }
                // Resend OTP is essentially the same as request OTP
                $.ajax({
                    url: contextPath + '/auth/forgot-password/request-otp',
                    type: 'POST',
                    data: { email: userEmail },
                    success: function(response) {
                        showNotification(response + " (Resent)", 'success');
                        $('#otp').val(''); // Clear OTP field
                    },
                    error: function(xhr) {
                        showNotification('Error resending OTP: ' + xhr.responseText, 'error');
                    }
                });
            });


            // Step 3: Reset Password
            $('#resetPasswordBtn').on('click', function() {
                const newPassword = $('#newPassword').val();
                const confirmNewPassword = $('#confirmNewPassword').val();

                if (!newPassword || !confirmNewPassword) {
                    showNotification('Please enter and confirm your new password.', 'error');
                    return;
                }
                if (newPassword !== confirmNewPassword) {
                    showNotification('New passwords do not match.', 'error');
                    return;
                }

                $.ajax({
                    url: contextPath + '/auth/forgot-password/reset-password',
                    type: 'POST',
                    data: { email: userEmail, newPassword: newPassword },
                    success: function(response) {
                        showNotification(response, 'success');
                        setTimeout(function() {
                            window.location.href = contextPath + '/auth/login'; // Redirect to login after successful reset
                        }, 2000); // Redirect after 2 seconds
                    },
                    error: function(xhr) {
                        showNotification('Error: ' + xhr.responseText, 'error');
                    }
                });
            });
        });
    </script>
</body>
</html>