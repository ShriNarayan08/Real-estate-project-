<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="auth-section">
    <div class="container">
        <div class="auth-wrapper">

            <div class="auth-info">
                <span class="auth-badge">Secure Recovery</span>

                <h1>Recover Your Account Securely</h1>

                <p>
                    Reset your password using OTP verification and regain access
                    to your Propify account instantly.
                </p>

                <div class="auth-points">
                    <div><i class="fas fa-shield-alt"></i> Secure OTP Verification</div>
                    <div><i class="fas fa-lock"></i> Safe Password Reset</div>
                    <div><i class="fas fa-user-check"></i> Fast Account Recovery</div>
                </div>
            </div>

            <div class="auth-card">
                <h2>Forgot Password?</h2>
                <p>Enter your email and verify OTP to reset your password.</p>

                <div id="step1">
                    <div class="auth-input">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" placeholder="Email Address" required>
                    </div>

                    <button type="button" class="auth-btn" id="requestOtpBtn">
                        Request OTP
                    </button>
                </div>

                <div id="step2" class="d-none">
                    <p class="text-success fw-bold">
                        OTP has been sent to your email.
                    </p>

                    <div class="auth-input">
                        <i class="fas fa-key"></i>
                        <input type="text" id="otp" placeholder="Enter OTP" required>
                    </div>

                    <button type="button" class="auth-btn mb-3" id="verifyOtpBtn">
                        Verify OTP
                    </button>

                    <button type="button" class="premium-outline-btn w-100" id="resendOtpBtn">
                        Resend OTP
                    </button>
                </div>

                <div id="step3" class="d-none">
                    <p class="text-success fw-bold">
                        OTP verified. Set your new password.
                    </p>

                    <div class="auth-input">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="newPassword" placeholder="New Password" required>
                    </div>

                    <div class="auth-input">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="confirmNewPassword" placeholder="Confirm New Password" required>
                    </div>

                    <button type="button" class="auth-btn" id="resetPasswordBtn">
                        Reset Password
                    </button>
                </div>

                <div class="auth-switch">
                    Remember your password?
                    <a href="${pageContext.request.contextPath}/auth/login">
                        Login here
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function() {
        const contextPath = "${pageContext.request.contextPath}";
        let userEmail = '';

        function showNotification(message, type) {
            $.notify(message, {
                position: "top center",
                className: type
            });
        }

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

        $('#resendOtpBtn').on('click', function() {
            if (!userEmail) {
                showNotification('Please enter your email first.', 'error');
                return;
            }

            $.ajax({
                url: contextPath + '/auth/forgot-password/request-otp',
                type: 'POST',
                data: { email: userEmail },
                success: function(response) {
                    showNotification(response + " (Resent)", 'success');
                    $('#otp').val('');
                },
                error: function(xhr) {
                    showNotification('Error resending OTP: ' + xhr.responseText, 'error');
                }
            });
        });

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
                data: {
                    email: userEmail,
                    newPassword: newPassword
                },
                success: function(response) {
                    showNotification(response, 'success');

                    setTimeout(function() {
                        window.location.href = contextPath + '/auth/login';
                    }, 2000);
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