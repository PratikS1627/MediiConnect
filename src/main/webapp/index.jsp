<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediConnect - Doctor Appointment</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        html {
            scroll-behavior: smooth; /* Enables smooth scrolling */
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }

        /* Navbar */
        .navbar {
            background-color: #0d6efd;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: #fff !important;
        }
        .nav-link {
            color: #fff !important;
            font-weight: 500;
            margin-right: 15px;
            transition: 0.3s;
        }
        .nav-link:hover {
            color: #ffc107 !important;
            transform: scale(1.05);
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(13,110,253,0.7), rgba(13,110,253,0.7)), 
                        url("img/Medical.jpg") center/cover no-repeat;
            color: white;
            padding: 120px 0;
            text-align: center;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: 700;
        }
        .hero p {
            font-size: 1.2rem;
        }

        /* Services */
        .service-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 30px;
            transition: 0.3s;
        }
        .service-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        /* Doctors */
        .doctor-card {
            border-radius: 20px;
            transition: 0.3s;
        }
        .doctor-card:hover {
            transform: scale(1.05);
        }
        .doctor-card img {
            border-radius: 50%;
            height: 150px;
            width: 150px;
            object-fit: cover;
        }

        /* FAQ */
        .accordion-button:focus {
            box-shadow: none;
            background-color: #e9f5ff;
        }

        /* Footer */
        footer {
            background-color: #0d6efd;
            color: white;
            padding: 40px 0;
        }
        footer a {
            color: #ffc107;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark py-3 fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">MediConnect</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navMenu">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#services">Our Services</a></li>
        <li class="nav-item"><a class="nav-link" href="#doctors">Doctors</a></li>
        <li class="nav-item"><a class="nav-link" href="#faq">FAQ</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Login</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="userLogin.jsp">Patient Login</a></li>
            <li><a class="dropdown-item" href="doctorLogin.jsp">Doctor Login</a></li>
            <li><a class="dropdown-item" href="adminLogin.jsp">Admin Login</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero" id="home">
  <div class="container">
    <h1 class="mb-3 animate__animated animate__fadeInDown">We Help Patients Live a Healthy Life</h1>
    <p class="mb-4 animate__animated animate__fadeInUp">Connecting patients and doctors through one platform — making healthcare simple and reliable.</p>
    <a href="userLogin.jsp" class="btn btn-warning btn-lg rounded-pill"><i class="bi bi-calendar-heart"></i> Request Appointment</a>
  </div>
</section>

<!-- Services -->
<section class="py-5" id="services">
  <div class="container text-center">
    <h2 class="mb-5 fw-bold text-primary">Our Medical Services</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="service-card">
          <i class="bi bi-search-heart fs-1 text-primary mb-3"></i>
          <h5>Find a Doctor</h5>
          <p>Search and connect with the best doctors around you.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="service-card">
          <i class="bi bi-hospital fs-1 text-danger mb-3"></i>
          <h5>24/7 Emergency</h5>
          <p>Immediate care for emergency health issues — anytime, anywhere.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="service-card">
          <i class="bi bi-laptop fs-1 text-success mb-3"></i>
          <h5>Online Consultation</h5>
          <p>Talk to a doctor from the comfort of your home.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Doctors -->
<section class="py-5 bg-light" id="doctors">
  <div class="container text-center">
    <h2 class="mb-5 fw-bold text-primary">Our Top Doctors</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="doctor-card p-4 bg-white shadow-sm">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9JN-j3e0fEgDPHamAEmPjObfwkqwx4TfGqg&s" alt="Doctor" class="mb-3">
          <h5>Dr. John Doe</h5>
          <p class="text-muted">Cardiologist</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="doctor-card p-4 bg-white shadow-sm">
          <img src="https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=" alt="Doctor" class="mb-3">
          <h5>Dr. Sarah Smith</h5>
          <p class="text-muted">Neurologist</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="doctor-card p-4 bg-white shadow-sm">
          <img src="data:image/jpeg;base64,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" alt="Doctor" class="mb-3">
          <h5>Dr. Emily White</h5>
          <p class="text-muted">Orthopedic Specialist</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- FAQ -->
<section class="py-5" id="faq">
  <div class="container">
    <h2 class="text-center mb-4 fw-bold text-primary">Frequently Asked Questions</h2>
    <div class="accordion" id="faqAccordion">
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#faq1">
            What is MediConnect?
          </button>
        </h2>
        <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            MediConnect is a platform that helps patients easily book doctor appointments and access healthcare services online.
          </div>
        </div>
      </div>

      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#faq2">
            Do you offer online consultations?
          </button>
        </h2>
        <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            Yes, MediConnect provides 24/7 online consultations through our verified medical experts.
          </div>
        </div>
      </div>

      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#faq3">
            Can I cancel or reschedule an appointment?
          </button>
        </h2>
        <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            Yes, appointments can be canceled or rescheduled easily through your dashboard anytime before the scheduled slot.
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="text-center">
  <div class="container">
    <p class="mb-2">© 2025 <strong>MediConnect</strong> </p>
    <div>
      <a href="#"><i class="bi bi-facebook fs-4 mx-2"></i></a>
      <a href="#"><i class="bi bi-twitter fs-4 mx-2"></i></a>
      <a href="#"><i class="bi bi-linkedin fs-4 mx-2"></i></a>
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
	