<%-- src/main/webapp/jsp/auth/login.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login to MyProperty Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
   <header class="bg-white shadow-sm">
     <nav class="navbar navbar-expand-lg navbar-light bg-white px-4">
       <div class="container-fluid">
         <!-- Logo -->
         <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
           <img src="${pageContext.request.contextPath}/images/logo2.png" alt="Propify Indore Logo" height="60" class="me-2">
           <span class="fw-bold fs-4 text-primary">Propify Indore</span>
         </a>

         <!-- Mobile toggle -->
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
         </button>

         <!-- Navbar links -->
         <div class="collapse navbar-collapse" id="mainNavbar">
           <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
             <li class="nav-item">
               <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
             </li>
             <li class="nav-item">
               <a class="nav-link text-warning" href="${pageContext.request.contextPath}/regis">Register</a>
             </li>
           </ul>
         </div>
       </div>
     </nav>
   </header>

    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow-lg rounded-3">
                    <div class="card-body p-4">
                        <h1 class="card-title text-center mb-4">Sign In</h1>
                        <p class="text-muted text-center mb-4">Welcome back! Please enter your credentials to access your account.</p>
                        <form action="/auth/login" method="post">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" name="email" placeholder="john.doe@example.com" required>
                                <label for="email">Email Address</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                <label for="password">Password</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                <label class="form-check-label" for="rememberMe">
                                    Remember Me
                                </label>
                            </div>
                            <button class="btn btn-primary w-100 py-2" type="submit">Log In</button>

                            <div class="mt-3 text-center">
                                <p>Forgot your password? <a href="${pageContext.request.contextPath}/auth/forgot-password">Reset it here</a></p>
                                <p>Don't have an account? <a href="/regis">Register here</a></p>
                            </div>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="bg-dark text-white py-4">
        <div class="container text-center">
            <p>&copy; 2025 Propify Indore. All rights reserved.</p>
            <div class="mt-2">
                <a href="/privacy" class="text-white me-3">Privacy Policy</a>
                <a href="/terms" class="text-white me-3">Terms of Service</a>
                <a href="/contact" class="text-white">Contact Us</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
