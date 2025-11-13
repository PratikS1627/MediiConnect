<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - MediConnect</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #f5f8fc;
            font-family: 'Poppins', sans-serif;
        }
        .sidebar {
            height: 100vh;
            background: #007bff;
            color: white;
            padding: 20px;
            position: fixed;
            width: 250px;
        }
        .sidebar h4 { text-align: center; margin-bottom: 30px; }
        .sidebar a {
            color: white;
            display: block;
            padding: 10px;
            text-decoration: none;
            border-radius: 8px;
            transition: 0.3s;
        }
        .sidebar a:hover { background: #0056b3; }
        .content {
            margin-left: 270px;
            padding: 20px;
        }
        .hero {
            background: linear-gradient(rgba(0, 123, 255, 0.7), rgba(0, 123, 255, 0.7)),
                        url('https://img.freepik.com/free-photo/medical-banner-with-doctor-holding-stethoscope_23-2149611192.jpg') center/cover no-repeat;
            color: white;
            padding: 60px 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .hero h2 { font-weight: bold; }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
<%
    // Ensure user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Welcome, <%= username %> 👋</h4>
    <a href="MyProfile.jsp">👤 My Profile</a>
    <a href="listDoctor.jsp">👨‍⚕️ Doctor List</a>
    <a href="myAppointments.jsp">📅 My Appointments</a>
    <a href="logout.jsp">🚪 Logout</a>
</div>

<!-- Main Content -->
<div class="content">
    <div class="container">
        <div class="hero mb-4">
            <h2>Welcome to MediConnect, <%= username %>!</h2>
            <p>Your health, our priority. Access appointments, doctors, and health info all in one place.</p>
        </div>

        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card p-3">
                    <img src="https://cdn-icons-png.flaticon.com/512/2966/2966489.png" class="card-img-top mx-auto" style="width:90px;" alt="Profile">
                    <div class="card-body">
                        <h5 class="card-title">My Profile</h5>
                        <p class="card-text">View and update your personal health information.</p>
                        <a href="MyProfile.jsp" class="btn btn-primary">Go</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card p-3">
                    <img src="https://cdn-icons-png.flaticon.com/512/3209/3209265.png" class="card-img-top mx-auto" style="width:90px;" alt="Doctors">
                    <div class="card-body">
                        <h5 class="card-title">Find Doctors</h5>
                        <p class="card-text">Browse and connect with trusted healthcare professionals.</p>
                        <a href="listDoctor.jsp" class="btn btn-success">View</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card p-3">
                    <img src="https://cdn-icons-png.flaticon.com/512/3004/3004613.png" class="card-img-top mx-auto" style="width:90px;" alt="Appointments">
                    <div class="card-body">
                        <h5 class="card-title">Appointments</h5>
                        <p class="card-text">Check your upcoming appointments and visit history.</p>
                        <a href="myAppointments.jsp" class="btn btn-warning">Check</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-5 text-center">
            <h4>🩺 Health Tip of the Day</h4>
            <p>Stay hydrated and take short breaks to stretch while working or studying!</p>
        </div>
    </div>
</div>

</body>
</html>
