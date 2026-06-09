<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Contact Us - Propify</title>
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

<section class="contact-hero">

    <div class="container">

        <span class="contact-badge">
            Contact Propify
        </span>

        <h1>
            Get In Touch With Us
        </h1>

        <p>
            Have questions about buying, selling, renting or listing a property?
            Our team is here to help you.
        </p>

    </div>

</section>

<section class="contact-section">

    <div class="container">

        <div class="contact-layout">

            <div class="contact-form-card">

                <div class="contact-heading">

                    <span>Send Message</span>

                    <h2>
                        Let's Talk
                    </h2>

                    <p>
                        Fill the form below and our team will contact you soon.
                    </p>

                </div>

                <form id="contactForm">

                    <div class="premium-input mb-3">
                        <i class="fas fa-user"></i>
                        <input type="text"
                               id="name"
                               placeholder="Your Name"
                               required>
                    </div>

                    <div class="premium-input mb-3">
                        <i class="fas fa-envelope"></i>
                        <input type="email"
                               id="email"
                               placeholder="Your Email"
                               required>
                    </div>

                    <div class="premium-input mb-3">
                        <i class="fas fa-heading"></i>
                        <input type="text"
                               id="subject"
                               placeholder="Subject"
                               required>
                    </div>

                    <div class="premium-input textarea-input mb-4">
                        <i class="fas fa-message"></i>
                        <textarea id="message"
                                  placeholder="Your Message"
                                  required></textarea>
                    </div>

                    <button type="submit" class="contact-submit-btn">
                        <i class="fas fa-paper-plane"></i>
                        Send Message
                    </button>

                </form>

            </div>

            <div class="contact-info-card">

                <div class="contact-heading">

                    <span>Contact Details</span>

                    <h2>
                        Reach Us
                    </h2>

                    <p>
                        Connect with Propify for premium real estate support in Indore.
                    </p>

                </div>

                <div class="contact-info-list">

                    <div class="contact-info-box">
                        <div class="contact-icon">
                            <i class="fas fa-location-dot"></i>
                        </div>

                        <div>
                            <h4>Office Address</h4>
                            <p>123 Propify Towers, A.B. Road, Indore, Madhya Pradesh 452001</p>
                        </div>
                    </div>

                    <div class="contact-info-box">
                        <div class="contact-icon">
                            <i class="fas fa-phone"></i>
                        </div>

                        <div>
                            <h4>Call Us</h4>
                            <p>+91 9131612287</p>
                            <p>Mon - Sat, 9 AM - 6 PM</p>
                        </div>
                    </div>

                    <div class="contact-info-box">
                        <div class="contact-icon">
                            <i class="fas fa-envelope"></i>
                        </div>

                        <div>
                            <h4>Email Us</h4>
                            <p>info@propifyindore.com</p>
                            <p>support@propifyindore.com</p>
                        </div>
                    </div>

                    <div class="contact-info-box">
                        <div class="contact-icon">
                            <i class="fas fa-clock"></i>
                        </div>

                        <div>
                            <h4>Business Hours</h4>
                            <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
                            <p>Saturday: 10:00 AM - 4:00 PM</p>
                            <p>Sunday: Closed</p>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <div class="contact-map-card">

            <div class="section-heading">

                <span>Location</span>

                <h2>
                    Find Us on Map
                </h2>

                <p>
                    Visit our office or explore our location through Google Maps.
                </p>

            </div>

            <div class="map-container-premium">

                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3679.529809988959!2d75.87784381488176!3d22.75328498509892!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3962fd2b5a5b29b5%3A0x6b7b0a7c4a1b0a7!2sIndore%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1678901234567!5m2!1sen!2sin"
                        width="100%"
                        height="460"
                        style="border:0;"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                </iframe>

            </div>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function() {

        function showNotification(message, type) {
            $.notify(message, {
                position: "top center",
                className: type
            });
        }

        $('#contactForm').on('submit', function(e) {
            e.preventDefault();

            const name = $('#name').val();
            const email = $('#email').val();
            const subject = $('#subject').val();
            const message = $('#message').val();

            if (!name || !email || !subject || !message) {
                showNotification('Please fill in all fields.', 'error');
                return;
            }

            showNotification('Message sent successfully! We will get back to you soon.', 'success');
            $('#contactForm')[0].reset();

            console.log('Contact Form Submitted:', {
                name,
                email,
                subject,
                message
            });
        });
    });
</script>

</body>

</html>