<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard - MediConnect</title>
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
                        url('https://img.freepik.com/free-photo/top-view-doctor-s-tools-arrangement_23-2149343804.jpg') center/cover no-repeat;
            color: white;
            padding: 60px 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .card:hover { transform: translateY(-5px); }
    </style>
</head>
<body>

<%
    String doctorName = (String) session.getAttribute("doctorName");
    if (doctorName == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Dr. <%= doctorName %> 🩺</h4>
    <a href="doctorProfile.jsp">👤 My Profile</a>
    <a href="doctorAppointments.jsp">📅 Appointments</a>
    <a href="logout.jsp">🚪 Logout</a>
</div>

<!-- Main Content -->
<div class="content">
    <div class="container">

        <div class="hero mb-4">
            <h2>Welcome, Dr. <%= doctorName %>!</h2>
            <p>Manage your appointments and patient interactions seamlessly.</p>
        </div>

        <div class="row text-center">

            <div class="col-md-6 mb-4">
                <div class="card p-3">
                    <img src="https://cdn-icons-png.flaticon.com/512/387/387561.png" class="card-img-top mx-auto" style="width:90px;">
                    <div class="card-body">
                        <h5 class="card-title">My Profile</h5>
                        <p class="card-text">View and update your professional details.</p>
                        <a href="doctorProfile.jsp" class="btn btn-primary">Manage</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mb-4">
                <div class="card p-3">
                    <img src="https://cdn-icons-png.flaticon.com/512/3004/3004613.png" class="card-img-top mx-auto" style="width:90px;">
                    <div class="card-body">
                        <h5 class="card-title">Appointments</h5>
                        <p class="card-text">Check and manage your appointments.</p>
                        <a href="doctorAppointments.jsp" class="btn btn-success">View</a>
                    </div>
                </div>
            </div>

        </div>

        <div class="mt-5 text-center">
            <h4>💡 Tip for Doctors</h4>
            <p>Regularly update consultation notes for improved patient care.</p>
        </div>

    </div>
</div>

</body>
</html>
