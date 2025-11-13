<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Doctor Login | MediConnect</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(rgba(13,110,253,0.6), rgba(13,110,253,0.6)),
                    url("img/Medical.jpg") center/cover no-repeat;
        font-family: "Poppins", sans-serif;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* Navbar */
    .navbar {
        background: rgba(255, 255, 255, 0.9);
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        backdrop-filter: blur(6px);
    }
    .navbar-brand {
        font-weight: 700;
        color: #0d6efd !important;
        font-size: 1.6rem;
        letter-spacing: 1px;
    }
    .nav-link {
        color: #0d6efd !important;
        font-weight: 500;
        transition: 0.3s;
    }
    .nav-link:hover {
        color: #ffc107 !important;
        transform: scale(1.1);
    }

    /* Title */
    h1.title {
        color: white;
        text-align: center;
        font-weight: 700;
        margin-top: 80px;
        text-shadow: 2px 2px 8px rgba(0,0,0,0.5);
    }

    /* Login Form */
    .login-container {
        flex-grow: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-box {
        background: rgba(255,255,255,0.97);
        padding: 40px 35px;
        border-radius: 15px;
        width: 400px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        animation: fadeInUp 0.8s ease;
        text-align: center;
    }

    .login-box h2 {
        color: #0d6efd;
        font-weight: 600;
        margin-bottom: 25px;
    }

    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0;
        border-radius: 6px;
        border: 1px solid #ddd;
        background: #f8f9fa;
        transition: 0.3s;
    }
    input[type=text]:focus, input[type=password]:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 8px rgba(13,110,253,0.3);
        background: #fff;
    }

    input[type=submit] {
        background: #0d6efd;
        color: white;
        border: none;
        padding: 12px 50px;
        border-radius: 50px;
        font-size: 16px;
        font-weight: 500;
        margin-top: 15px;
        transition: 0.3s;
    }
    input[type=submit]:hover {
        background: #0b5ed7;
        transform: scale(1.05);
    }

    /* Animation */
    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Footer */
    footer {
        background-color: rgba(255,255,255,0.9);
        padding: 15px 0;
        text-align: center;
        font-size: 0.9rem;
        color: #0d6efd;
        font-weight: 500;
        box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
    }
</style>
</head>

<body>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">MediConnect</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item"><a href="index.jsp" class="nav-link"><i class="bi bi-house-door"></i> Home</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- ✅ Title -->
<h1 class="title">Doctor Login Portal</h1>

<!-- ✅ Login Form -->
<div class="login-container">
    <div class="login-box">
        <h2>Doctor Login</h2>
        <form action="<%=request.getContextPath()%>/DoctorLogin" method="post">
            <input type="text" name="email" placeholder="Enter Registered Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Log In">
        </form>
    </div>
</div>

<!-- ✅ Footer -->
<footer>
  © 2025 MediConnect 
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
