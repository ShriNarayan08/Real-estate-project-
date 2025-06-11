<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Propify Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        /* Custom styles for Contact Us page */
        .page-header {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('${pageContext.request.contextPath}/images/contact-banner.jpg') no-repeat center center; /* Replace with a suitable image */
            background-size: cover;
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        .page-header h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 15px;
        }
        .page-header p {
            font-size: 1.25rem;
            max-width: 800px;
            margin: 0 auto;
        }
        .section-title {
            font-size: 2.5rem;
            font-weight: 600;
            color: var(--bs-primary);
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }
        .section-title::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: var(--bs-warning);
            border-radius: 2px;
        }
        .contact-info-item {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
        }
        .contact-info-item .icon {
            font-size: 2rem;
            color: var(--bs-primary);
            margin-right: 20px;
            min-width: 50px;
            text-align: center;
        }
        .contact-info-item .text h5 {
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--bs-dark);
        }
        .contact-info-item .text p {
            margin-bottom: 0;
            color: var(--bs-secondary);
        }
        .map-container {
            border-radius: 0.5rem;
            overflow: hidden;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
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
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/contact">Contact</a>
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
            <h1>Contact Us</h1>
            <p class="lead">We'd love to hear from you! Reach out to us for any inquiries.</p>
        </div>
    </div>

    <main class="container py-5">
        <section class="mb-5">
            <div class="row">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <h2 class="section-title text-center text-lg-start">Get In Touch</h2>
                    <p class="mb-4 text-center text-lg-start">
                        Have a question, need assistance, or just want to talk about the Indore real estate market?
                        Fill out the form below or use our contact details to connect with us.
                    </p>
                    <form id="contactForm">
                        <div class="mb-3">
                            <label for="name" class="form-label">Your Name</label>
                            <input type="text" class="form-control" id="name" placeholder="John Doe" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Your Email</label>
                            <input type="email" class="form-control" id="email" placeholder="name@example.com" required>
                        </div>
                        <div class="mb-3">
                            <label for="subject" class="form-label">Subject</label>
                            <input type="text" class="form-control" id="subject" placeholder="Inquiry about property listing" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Your Message</label>
                            <textarea class="form-control" id="message" rows="5" placeholder="Tell us more..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 py-3">Send Message</button>
                    </form>
                </div>
                <div class="col-lg-6">
                    <h2 class="section-title text-center text-lg-start">Our Contact Details</h2>
                    <div class="ps-lg-5 pt-4 pt-lg-0">
                        <div class="contact-info-item">
                            <div class="icon"><i class="bi bi-geo-alt-fill"></i></div>
                            <div class="text">
                                <h5>Our Office Address</h5>
                                <p>123 Propify Towers, A.B. Road,</p>
                                <p>Indore, Madhya Pradesh 452001, India</p>
                            </div>
                        </div>
                        <div class="contact-info-item">
                            <div class="icon"><i class="bi bi-phone-fill"></i></div>
                            <div class="text">
                                <h5>Call Us</h5>
                                <p>+91 12345 67890</p>
                                <p>Mon - Sat, 9 AM - 6 PM</p>
                            </div>
                        </div>
                        <div class="contact-info-item">
                            <div class="icon"><i class="bi bi-envelope-fill"></i></div>
                            <div class="text">
                                <h5>Email Us</h5>
                                <p>info@propifyindore.com</p>
                                <p>support@propifyindore.com</p>
                            </div>
                        </div>
                        <div class="contact-info-item">
                            <div class="icon"><i class="bi bi-clock-fill"></i></div>
                            <div class="text">
                                <h5>Business Hours</h5>
                                <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
                                <p>Saturday: 10:00 AM - 4:00 PM</p>
                                <p>Sunday: Closed</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="mt-5 text-center">
            <h2 class="section-title">Find Us on Map</h2>
            <div class="map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3679.529809988959!2d75.87784381488176!3d22.75328498509892!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3962fd2b5a5b29b5%3A0x6b7b0a7c4a1b0a7!2sIndore%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1678901234567!5m2!1sen!2sin"
                        width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            // Function to show notifications
            function showNotification(message, type) {
                $.notify(message, {
                    position: "top center",
                    className: type
                });
            }

            // Simple form submission handler (client-side only for now)
            $('#contactForm').on('submit', function(e) {
                e.preventDefault(); // Prevent default form submission

                const name = $('#name').val();
                const email = $('#email').val();
                const subject = $('#subject').val();
                const message = $('#message').val();

                if (!name || !email || !subject || !message) {
                    showNotification('Please fill in all fields.', 'error');
                    return;
                }

                // In a real application, you would send this data to a backend endpoint via AJAX
                // Example of what an AJAX call might look like:
                /*
                $.ajax({
                    url: '${pageContext.request.contextPath}/submit-contact', // Your backend endpoint
                    type: 'POST',
                    data: {
                        name: name,
                        email: email,
                        subject: subject,
                        message: message
                    },
                    success: function(response) {
                        showNotification('Message sent successfully! We will get back to you soon.', 'success');
                        $('#contactForm')[0].reset(); // Clear the form
                    },
                    error: function(xhr) {
                        showNotification('Failed to send message. Please try again later.', 'error');
                        console.error('Contact form submission error:', xhr.responseText);
                    }
                });
                */

                // For now, simulate success and clear form
                showNotification('Message sent successfully! We will get back to you soon.', 'success');
                $('#contactForm')[0].reset(); // Clear the form
                console.log('Contact Form Submitted:', { name, email, subject, message });
            });
        });
    </script>
</body>
</html>