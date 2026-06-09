<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body class="auth-page-body">

<jsp:include page="include/header.jsp"/>

<section class="auth-section">
    <div class="container">
        <div class="auth-wrapper">

            <div class="auth-info">
                <span class="auth-badge">Welcome Back</span>

                <h1>Continue Your Property Journey</h1>

                <p>
                    Login to explore premium properties, manage your listings,
                    and connect with verified property owners.
                </p>

                <div class="auth-points">
                    <div><i class="fas fa-check-circle"></i> Verified Property Listings</div>
                    <div><i class="fas fa-check-circle"></i> Secure Account Access</div>
                    <div><i class="fas fa-check-circle"></i> Buy, Sell & Rent Easily</div>
                </div>
            </div>

            <div class="auth-card">
                <h2>Sign In</h2>
                <p>Enter your credentials to access your account.</p>

                <form action="${pageContext.request.contextPath}/auth/login" method="post">

                    <div class="auth-input">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="Email Address" required>
                    </div>

                    <div class="auth-input">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" placeholder="Password" required>
                    </div>

                    <div class="auth-row">
                        <label class="remember-box">
                            <input type="checkbox" id="rememberMe" name="rememberMe">
                            Remember Me
                        </label>

                        <a href="${pageContext.request.contextPath}/auth/forgot-password">
                            Forgot Password?
                        </a>
                    </div>

                    <button type="submit" class="auth-btn">
                        Login
                    </button>

                    <div class="auth-switch">
                        Don't have an account?
                        <a href="${pageContext.request.contextPath}/auth/register">
                            Register here
                        </a>
                    </div>

                </form>
            </div>

        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>