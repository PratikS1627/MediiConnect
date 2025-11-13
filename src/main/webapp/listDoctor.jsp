<%@page import="java.sql.*"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor List - MediConnect</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(rgba(255,255,255,0.85), rgba(255,255,255,0.9)),
                        url('https://img.freepik.com/free-photo/blur-hospital-clinic-interior_74190-5193.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            margin-top: 50px;
            background: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        }

        h2 {
            color: #007bff;
            text-align: center;
            font-weight: 600;
            margin-bottom: 25px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
        }

        /* 🔍 Search Bar */
        .search-bar {
            position: relative;
            margin-bottom: 25px;
        }
        .search-bar input {
            border-radius: 50px;
            padding: 10px 45px;
            border: 1px solid #007bff;
            box-shadow: 0 2px 5px rgba(0,123,255,0.2);
            transition: 0.3s;
        }
        .search-bar input:focus {
            border-color: #0056b3;
            box-shadow: 0 4px 10px rgba(0,123,255,0.3);
        }
        .search-bar i {
            position: absolute;
            top: 11px;
            left: 15px;
            color: #007bff;
            font-size: 18px;
        }

        /* 🩺 Table */
        table {
            border-radius: 10px;
            overflow: hidden;
        }
        thead {
            background-color: #007bff;
            color: white;
        }
        tbody tr:hover {
            background-color: #eaf4ff;
            transition: 0.3s;
        }

        /* ✅ Buttons */
        .btn-success {
            border-radius: 25px;
            transition: 0.3s;
        }
        .btn-success:hover {
            transform: scale(1.05);
        }

        /* 🔙 Back Button */
        .back-btn {
            display: inline-block;
            background-color: #007bff;
            color: white;
            border-radius: 30px;
            padding: 10px 25px;
            text-decoration: none;
            font-weight: 500;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        .back-btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 15px;
            }
            table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Available Doctors</h2>

    <!-- 🔍 Search Bar -->
    <div class="search-bar">
        <i class="bi bi-search"></i>
        <input type="text" id="searchInput" class="form-control" placeholder="Search by name, city, or qualification...">
    </div>

    <!-- 🧾 Doctor Table -->
    <div class="table-responsive">
        <table id="doctorTable" class="table table-striped table-hover text-center align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>City</th>
                    <th>Email</th>
                    <th>Qualification</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // ✅ Database Query
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        con = DatabaseConnection.initializeDatabase();
                        String sql = "SELECT * FROM doctor";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("fname") %></td>
                    <td><%= rs.getString("lname") %></td>
                    <td><%= rs.getString("city") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("qualification") %></td>
                    <td>
                        <a href="bookAppointment.jsp?doctor_id=<%= rs.getInt("id") %>" class="btn btn-success btn-sm">
                            <i class="bi bi-calendar-check"></i> Book Appointment
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7' class='text-danger'>Database Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ex) {}
                        if (ps != null) try { ps.close(); } catch (SQLException ex) {}
                        if (con != null) try { con.close(); } catch (SQLException ex) {}
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- 🔙 Back Button -->
    <div class="text-center">
        <a href="UserHome.jsp" class="back-btn"><i class="bi bi-arrow-left"></i> Back to Home</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 🔎 Live Search -->
<script>
    document.getElementById("searchInput").addEventListener("keyup", function() {
        const filter = this.value.toLowerCase();
        document.querySelectorAll("#doctorTable tbody tr").forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
</script>

</body>
</html>
