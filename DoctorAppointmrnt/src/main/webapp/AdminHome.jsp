<%-- 
    Document   : UserHome
    Created on : 13 Aug, 2020, 9:56:36 AM
    Author     : Admin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MediConnect | Admin Dashboard</title>

    <!-- Bootstrap & Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-image: url("img/Medical.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            backdrop-filter: blur(3px);
        }

        /* Navbar */
        .navbar {
            background: rgba(255,255,255,0.9);
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .navbar-brand h3 {
            color: #0d6efd;
            font-weight: 700;
        }

        .nav-link {
            color: #333 !important;
            font-weight: 500;
            transition: 0.3s;
        }

        .nav-link:hover {
            color: #0d6efd !important;
            transform: scale(1.05);
        }

        .logout-btn {
            background: linear-gradient(135deg, #dc3545, #ff4b5c);
            color: white !important;
            border: none;
            padding: 8px 15px;
            border-radius: 30px;
            transition: 0.3s;
            font-weight: 500;
        }

        .logout-btn:hover {
            transform: scale(1.08);
            box-shadow: 0 0 10px rgba(220,53,69,0.5);
        }

        /* Dashboard Title */
        .dashboard-title {
            text-align: center;
            color: #004085;
            font-weight: 700;
            margin-top: 40px;
            margin-bottom: 10px;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
        }

        .dashboard-sub {
            text-align: center;
            color: #6c757d;
            margin-bottom: 30px;
        }

        /* Cards */
        .card {
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease;
            cursor: pointer;
            color: #fff;
            position: relative;
            overflow: hidden;
        }

        .card .card-block {
            border-radius: 15px;
            padding: 25px 10px;
            text-align: center;
            transition: 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .card i {
            font-size: 3.5rem;
            margin-bottom: 15px;
            opacity: 0.9;
        }

        .card h6 {
            font-size: 1.1rem;
            letter-spacing: 0.5px;
        }

        .card h1 {
            font-weight: bold;
        }

        .bg-success {
            background: linear-gradient(135deg, #198754, #28a745);
        }

        .bg-danger {
            background: linear-gradient(135deg, #dc3545, #f06575);
        }

        .bg-info {
            background: linear-gradient(135deg, #0dcaf0, #17a2b8);
        }

        .bg-warning {
            background: linear-gradient(135deg, #ffc107, #f5c542);
            color: #212529 !important;
        }

        .card a {
            color: inherit;
            text-decoration: none;
        }

        .card a:hover {
            text-decoration: underline;
        }

        footer {
            text-align: center;
            margin-top: 50px;
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>

<body>

<%
    Connection con = null;
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a href="#" class="navbar-brand">
            <h3>MediConnect</h3>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto" style="margin-right: 30px;">

                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Patient</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="addpatient.jsp">Add Patient</a>
                        <a class="dropdown-item" href="adminPatientList.jsp">Patient List</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Doctor</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="addDoctor.jsp">Add Doctor</a>
                        <a class="dropdown-item" href="adminDoctorList.jsp">View Doctor</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Receptionist</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="addRecp.jsp">Add Receptionist</a>
                        <a class="dropdown-item" href="adminRecpList.jsp">View Receptionist</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Worker</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="addWorker.jsp">Add Worker</a>
                        <a class="dropdown-item" href="adminWorkerList.jsp">View Worker</a>
                    </div>
                </li>

                <!-- Logout -->
                <li class="nav-item ml-3">
                    <a href="index.jsp" class="logout-btn"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- Dashboard Header -->
<h2 class="dashboard-title">Welcome Admin 👋</h2>
<p class="dashboard-sub">Here’s a quick overview of your hospital statistics</p>

<!-- Dashboard Cards -->
<div class="container">
    <div class="row mb-3 justify-content-center">

        <%
            try {
                con = DatabaseConnection.initializeDatabase();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select count(*) from patient");
                if (rs.next()) {
                    int patient = rs.getInt(1);
        %>
        <div class="col-xl-3 col-lg-6 mt-4">
            <div class="card card-inverse card-success">
                <div class="card-block bg-success text-white p-3">
                    <i class="fa fa-user-injured"></i>
                    <h6 class="text-uppercase text-center"><a href="adminPatientList.jsp">Patient</a></h6>
                    <h1 class="display-1 text-center"><%= patient %></h1>
                </div>
            </div>
        </div>
        <% } con.close(); } catch (Exception e) { e.printStackTrace(); } %>

        <%
            try {
                con = DatabaseConnection.initializeDatabase();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select count(*) from doctor");
                if (rs.next()) {
                    int doctor = rs.getInt(1);
        %>
        <div class="col-xl-3 col-lg-6 mt-4">
            <div class="card card-inverse card-danger">
                <div class="card-block bg-danger text-white p-3">
                    <i class="fa fa-user-md"></i>
                    <h6 class="text-uppercase text-center"><a href="adminDoctorList.jsp">Doctor</a></h6>
                    <h1 class="display-1 text-center"><%= doctor %></h1>
                </div>
            </div>
        </div>
        <% } con.close(); } catch (Exception e) { e.printStackTrace(); } %>

        <%
            try {
                con = DatabaseConnection.initializeDatabase();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select count(*) from recp");
                if (rs.next()) {
                    int recp = rs.getInt(1);
        %>
        <div class="col-xl-3 col-lg-6 mt-4">
            <div class="card card-inverse card-info">
                <div class="card-block bg-info text-white p-3">
                    <i class="fa fa-user-tie"></i>
                    <h6 class="text-uppercase text-center"><a href="adminRecpList.jsp">Receptionist</a></h6>
                    <h1 class="display-1 text-center"><%= recp %></h1>
                </div>
            </div>
        </div>
        <% } con.close(); } catch (Exception e) { e.printStackTrace(); } %>

        <%
            try {
                con = DatabaseConnection.initializeDatabase();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select count(*) from worker");
                if (rs.next()) {
                    int worker = rs.getInt(1);
        %>
        <div class="col-xl-3 col-lg-6 mt-4">
            <div class="card card-inverse card-warning">
                <div class="card-block bg-warning text-white p-3">
                    <i class="fa fa-user-gear"></i>
                    <h6 class="text-uppercase text-center"><a href="adminWorkerList.jsp">Worker</a></h6>
                    <h1 class="display-1 text-center"><%= worker %></h1>
                </div>
            </div>
        </div>
        <% } con.close(); } catch (Exception e) { e.printStackTrace(); } %>
    </div>
</div>

<!-- Footer -->
<footer>
    © 2025 MediConnect | Admin Dashboard
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
