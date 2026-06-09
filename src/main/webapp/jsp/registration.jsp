<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Register - Propify</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <!-- GOOGLE FONT -->

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- BOOTSTRAP -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- FONT AWESOME -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- MAIN CSS -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">

</head>

<body class="auth-page-body">

<jsp:include page="include/header.jsp"/>

<section class="auth-section">

    <div class="container">

        <div class="auth-wrapper">

            <!-- LEFT SIDE -->

            <div class="auth-info">

                <span class="auth-badge">
                    Join Propify
                </span>

                <h1>
                    Create Your Premium Account
                </h1>

                <p>
                    Register now to explore luxury properties,
                    connect with verified sellers,
                    and manage your real estate journey easily.
                </p>

                <div class="auth-points">

                    <div>
                        <i class="fas fa-check-circle"></i>
                        Verified Property Access
                    </div>

                    <div>
                        <i class="fas fa-check-circle"></i>
                        Trusted Real Estate Platform
                    </div>

                    <div>
                        <i class="fas fa-check-circle"></i>
                        Buy, Sell & Rent Securely
                    </div>

                </div>

            </div>

            <!-- REGISTER CARD -->

            <div class="auth-card">

                <h2>
                    Create Account
                </h2>

                <p>
                    Start your property journey with Propify today.
                </p>

                <form id="registerForm"
                      action="${pageContext.request.contextPath}/auth/register"
                      method="post">

                    <div class="auth-input">

                        <i class="fas fa-user"></i>

                        <input type="text"
                               name="firstName"
                               placeholder="First Name"
                               required>

                    </div>

                    <div class="auth-input">

                        <i class="fas fa-user"></i>

                        <input type="text"
                               name="lastName"
                               placeholder="Last Name"
                               required>

                    </div>

                    <div class="auth-input">

                        <i class="fas fa-envelope"></i>

                        <input type="email"
                               name="email"
                               placeholder="Email Address"
                               required>

                    </div>

                    <div class="auth-input">

                        <i class="fas fa-phone"></i>

                        <input type="tel"
                               name="phone"
                               placeholder="Phone Number">

                    </div>

                    <div class="auth-input">

                        <i class="fas fa-lock"></i>

                        <input type="password"
                               id="password"
                               name="password"
                               placeholder="Password"
                               required>

                    </div>

                    <div class="auth-input">

                        <i class="fas fa-lock"></i>

                        <input type="password"
                               id="confirmPassword"
                               name="confirmPassword"
                               placeholder="Confirm Password"
                               required>

                    </div>

                    <!-- TERMS -->

                    <label class="remember-box mb-4 d-flex align-items-center">

                        <input type="checkbox"
                               id="terms"
                               required>

                        <span class="ms-2">
                            I agree to the
                            <a href="#">
                                Terms
                            </a>
                            &
                            <a href="#">
                                Privacy Policy
                            </a>
                        </span>

                    </label>

                    <!-- BUTTON -->

                    <button type="submit"
                            class="auth-btn">

                        Sign Up

                    </button>

                    <!-- SWITCH -->

                    <div class="auth-switch">

                        Already have an account?

                        <a href="${pageContext.request.contextPath}/auth/login">
                            Login here
                        </a>

                    </div>

                </form>

            </div>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

    document.getElementById("registerForm")
        .addEventListener("submit", function(event) {

            const password =
                document.getElementById("password").value;

            const confirmPassword =
                document.getElementById("confirmPassword").value;

            const terms =
                document.getElementById("terms");

            if(password !== confirmPassword){

                alert("Passwords do not match");

                event.preventDefault();
            }

            if(!terms.checked){

                alert("Please accept terms & conditions");

                event.preventDefault();
            }

        });

</script>

</body>
</html>