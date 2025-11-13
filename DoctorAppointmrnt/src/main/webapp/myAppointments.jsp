<%@page import="java.sql.*"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Appointments</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            margin-top: 50px;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center text-primary mb-4">My Appointments</h2>

    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("userLogin.jsp");
        } else {
            try {
                Connection con = DatabaseConnection.initializeDatabase();
                String sql = "SELECT a.id, a.appointment_date, a.status, d.fname, d.lname, d.qualification " +
                             "FROM appointments a JOIN doctor d ON a.doctor_id = d.id " +
                             "JOIN user u ON a.patient_id = u.id WHERE u.username = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();

                if (!rs.isBeforeFirst()) {
                    out.println("<div class='alert alert-info text-center'>No appointments found.</div>");
                } else {
    %>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Appointment ID</th>
                <th>Doctor</th>
                <th>Specialization</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <%
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("fname") + " " + rs.getString("lname") %></td>
                <td><%= rs.getString("qualification") %></td>
                <td><%= rs.getDate("appointment_date") %></td>
                <td><span class="badge bg-success"><%= rs.getString("status") %></span></td>
            </tr>
        <%
                }
            }
            con.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
    %>
        </tbody>
    </table>

    <!-- ✅ Back Button -->
    <div class="text-center mt-4">
        <a href="UserHome.jsp" class="btn btn-secondary">Back</a>
    </div>
</div>
</body>
</html>
