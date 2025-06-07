<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find Your Dream Property in Indore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
 <style>
      body {
        font-family: 'Inter', sans-serif;
      }
      .hero {
        background-color: #607D8B;
      }
      .search-bar {
        padding: 1.5rem;
        border-radius: 1rem;
        background-color: rgba(255, 255, 255, 0.9);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin-bottom: 2rem;
      }

      .search-bar h2 {
        font-size: 1.8rem;
        font-weight: bold;
        margin-bottom: 1.5rem;
        color: #333;
      }

      .search-bar form {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        align-items: center;
      }

      .search-bar .form-group {
        flex: 1 1 180px;
        margin-bottom: 0;
      }

      .search-bar label {
        display: block;
        margin-bottom: 0.5rem;
        color: #444;
        font-weight: 500;
      }

      .search-bar select,
      .search-bar input[type="text"] {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid #ddd;
        border-radius: 0.5rem;
        font-size: 1rem;
        transition: border-color 0.3s ease;
      }

      .search-bar select:focus,
      .search-bar input[type="text"]:focus {
        outline: none;
        border-color: #007bff;
        box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
      }

      .search-bar button {
        padding: 0.75rem 1.5rem;
        border-radius: 0.5rem;
        background-color: #007bff;
        color: #fff;
        font-size: 1.1rem;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
        white-space: nowrap;
      }

      .search-bar button:hover {
        background-color: #0056b3;
      }

      @media (max-width: 992px) {
        .search-bar form {
          flex-direction: column;
          align-items: stretch;
        }
        .search-bar .form-group {
          flex: 1 1 auto;
        }
        .search-bar button {
          width: 100%;
        }
      }
    </style>

<body>
    <header class="bg-white shadow-sm">
        <div class="container">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/">
                        <img src="/images/logo.png" alt="Your Company Logo" height="40" class="d-inline-block align-top">
                        <span class="ms-2 h4">Propify</span>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="/home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/login">Buy</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/login">Rent</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/login">Agents</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/login">Contact Us</a>
                            </li>
                            <li class="nav-item">
                                 <a class="nav-link active" href="/login"> Login / Register</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>

    <section class="hero text-center py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <h1 class="display-4 fw-bold text-white">Find Your Dream Property in Indore</h1>
                    <p class="lead text-white mb-4">Explore a wide range of homes, apartments, and more in the heart of Madhya Pradesh. The group is developing large scale logistics parks with state-of-the-art warehousing and storage facilities. It aims to reach 1 million square feet of warehousing space.</p>
                    <div class="search-bar">
                        <h2 class="text-center mb-4">Search Properties</h2>
                        <form action="/auth/login" method="get" class="form-row">
                            <div class="form-group">
                                <label for="location">Location</label>
                                <select name="location" id="location" class="form-select">
                                    <option value="">Select Location</option>
                                    <option value="indore">Indore</option>
                                    <option value="bhopal">Bhopal</option>
                                    <option value="ujjain">Ujjain</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="propertyType">Property Type</label>
                                <select name="propertyType" id="propertyType" class="form-select">
                                    <option value="">Select Property Type</option>
                                    <option value="house">House</option>
                                    <option value="apartment">Apartment</option>
                                    <option value="land">Land</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="budget">Budget</label>
                                <input type="text" name="budget" id="budget" class="form-control" placeholder="Enter Budget (e.g., 10 Lakh - 50 Lakh)">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-search me-2"></i> Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="featured-properties py-5">
        <div class="container">
            <h2 class="text-center mb-4">Featured Listings in Indore</h2>
            <div id="featured-properties-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card property-card shadow-sm rounded-3">
                                    <img src="/images/sanjanapark1.png" alt="Property 1" class="card-img-top rounded-top-3">
                                    <div class="card-body">
                                        <h3 class="card-title">SANJANA PARK</h3>
                                        <p class="card-text"><i class="fas fa-map-marker-alt text-muted me-1"></i> Near Nakhrali Dhani, IIM , CAT Road, Rau, Indore (M.P.)</p>
                                        <p class="card-text fw-bold">₹ 1 Lakh</p>
                                        <a href="/auth/login" class="btn btn-outline-primary rounded-pill">View Details</a>
                                         <button class="btn btn-link text-danger float-end add-to-favorites" data-property-id="1">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="card property-card shadow-sm rounded-3">
                                    <img src="/images/sanjanaparkpre.png" alt="Property 1" class="card-img-top rounded-top-3">
                                    <div class="card-body">
                                        <h3 class="card-title">SHREE CITY</h3>
                                        <p class="card-text"><i class="fas fa-map-marker-alt text-muted me-1"></i> Sanjana Park Premium, Near Agarwal Public School, Bicholi Mardana Road, Indore.</p>
                                        <p class="card-text fw-bold">₹ 2 Lakh</p>
                                        <a href="/auth/login" class="btn btn-outline-primary rounded-pill">View Details</a>
                                        <button class="btn btn-link text-danger float-end add-to-favorites" data-property-id="2">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                 <div class="card property-card shadow-sm rounded-3">
                                    <img src="/images/market.png" alt="Property 3" class="card-img-top rounded-top-3">
                                    <div class="card-body">
                                        <h3 class="card-title">AGARWAL MARKET</h3>
                                        <p class="card-text"><i class="fas fa-map-marker-alt text-muted me-1"></i> Agrawal Market, A.B. Road,Dewas Naka,Indore,(M.P.) </p>
                                        <p class="card-text fw-bold">₹ 1 Lakh</p>
                                        <a href="/auth/login" class="btn btn-outline-primary rounded-pill">View Details</a>
                                        <button class="btn btn-link text-danger float-end add-to-favorites" data-property-id="3">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                         <div class="row">
                            <div class="col-md-4">
                                <div class="card property-card shadow-sm rounded-3">
                                    <img src="/images/123.png" alt="Property 4" class="card-img-top rounded-top-3">
                                    <div class="card-body">
                                        <h3 class="card-title">Property Title 4</h3>
                                        <p class="card-text"><i class="fas fa-map-marker-alt text-muted me-1"></i> Agrawal Market, A.B. Road,Dewas Naka,Indore,(M.P.)  Indore</p>
                                         <p class="card-text fw-bold">₹ 1 Lakh</p>
                                        <a href="/auth/login" class="btn btn-outline-primary rounded-pill">View Details</a>
                                        <button class="btn btn-link text-danger float-end add-to-favorites" data-property-id="4">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card property-card shadow-sm rounded-3">
                                    <img src="/images/abc.png" alt="Property 5" class="card-img-top rounded-top-3">
                                    <div class="card-body">
                                        <h3 class="card-title">Property Title 5</h3>
                                        <p class="card-text"><i class="fas fa-map-marker-alt text-muted me-1"></i> Agrawal Market, A.B. Road,Dewas Naka,Indore,(M.P.)  Indore</p>
                                         <p class="card-text fw-bold">₹ 1 Lakh</p>
                                        <a href="/auth/login" class="btn btn-outline-primary rounded-pill">View Details</a>
                                         <button class="btn btn-link text-danger float-end add-to-favorites" data-property-id="5">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card property-card shadow-sm rounded-3">
                                    <img src="/images/111.png" alt="Property 6" class="card-img-top rounded-top-3">
                                    <div class="card-body">
                                        <h3 class="card-title">Property Title 6</h3>
                                        <p class="card-text"><i class="fas fa-map-marker-alt text-muted me-1"></i> Agrawal Market, A.B. Road,Dewas Naka,Indore,(M.P.)  Indore</p>
                                         <p class="card-text fw-bold">₹ 6 Lakh</p>
                                        <a href="/auth/login" class="btn btn-outline-primary rounded-pill">View Details</a>
                                        <button class="btn btn-link text-danger float-end add-to-favorites" data-property-id="6">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#featured-properties-carousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#featured-properties-carousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="text-center mt-4">
                 <a href="/auth/login" class="btn btn-outline-secondary rounded-pill px-4">See All Listings in Indore</a>
            </div>
        </div>
    </section>

    <section class="why-choose-us bg-light py-5">
        <div class="container">
            <h2 class="text-center mb-5">Why Choose Our Services in Indore?</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card border-0 shadow-sm rounded-3 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-home fa-3x text-primary mb-3"></i>
                            <h3 class="card-title">Wide Range of Properties</h3>
                            <p class="card-text text-muted">Discover a diverse selection of properties across Indore to meet your unique needs.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card border-0 shadow-sm rounded-3 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-users fa-3x text-primary mb-3"></i>
                            <h3 class="card-title">Experienced Local Agents</h3>
                            <p class="card-text text-muted">Our agents have in-depth knowledge of the Indore real estate market.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card border-0 shadow-sm rounded-3 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-hand-holding-heart fa-3x text-primary mb-3"></i>
                            <h3 class="card-title">Personalized Support</h3>
                            <p class="card-text text-muted">We provide tailored assistance to help you find the perfect property in Indore.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-dark text-white py-4">
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
        $(document).ready(function() {
            $('.carousel').carousel({
                interval: 3000,
                pause: "hover"
            });

            $('.add-to-favorites').on('click', function() {
                const propertyId = $(this).data('property-id');
                // yahan aap ajax call karke backend mein favorite property add karenge
                console.log('Property ID:', propertyId, 'added to favorites');
                $(this).find('i').toggleClass('far fa-heart fas fa-heart');
                // yahan aap user ko feedback bhi de sakte hain, jaise ek toast message dikhana
                 $.notify({
                    message: "Added to Favorites",
                    icon: 'fas fa-heart'
                },{
                    type: 'success',
                    timer: 2000,
                    placement: {
                        from: "top",
                        align: "center"
                    }
                });
            });
        });
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" xintegrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js" xintegrity="sha512-zxFxL9g5e9m5jE6bgP5f7FjQ3j9xK5Uo9xj3yJ9zC89a8wgd/cqo7l5c7Oj3+nH8jk/6wWd+i9Z6m9HffA6w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>