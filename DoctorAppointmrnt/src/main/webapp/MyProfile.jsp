<%@page import="java.sql.*"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }

    int id = 0;
    String fullname = "", gender = "", email = "", phone = "", address = "", password = "";
    int age = 0;

    try {
        Connection con = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            id = rs.getInt("id");
            fullname = rs.getString("fullname");
            gender = rs.getString("gender");
            age = rs.getInt("age");
            email = rs.getString("email");
            phone = rs.getString("phone");
            address = rs.getString("address");
            password = rs.getString("password");
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile - MediConnect</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #e3f2fd);
            font-family: 'Poppins', sans-serif;
        }
        .profile-card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            width: 70%;
            margin: 60px auto;
            transition: 0.3s;
        }
        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        h3 {
            color: #0d6efd;
            margin-bottom: 30px;
            font-weight: 600;
            text-align: center;
        }
        label {
            font-weight: 500;
        }
        .btn-primary {
            background-color: #0d6efd;
            border-radius: 30px;
            padding: 10px 30px;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
            transform: scale(1.05);
        }
        .btn-secondary {
            border-radius: 30px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="profile-card">
        <h3>👤 My Profile</h3>

        <form action="updateProfile.jsp" method="post">
            <div class="row mb-3">
                <div class="col-md-4">
                    <label>User ID</label>
                    <input type="text" name="id" class="form-control" value="<%= id %>" readonly>
                </div>
                <div class="col-md-8">
                    <label>Full Name</label>
                    <input type="text" name="fullname" class="form-control" value="<%= fullname %>" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label>Gender</label>
                    <input type="text" name="gender" class="form-control" value="<%= gender %>" required>
                </div>
                <div class="col-md-4">
                    <label>Age</label>
                    <input type="number" name="age" class="form-control" value="<%= age %>" required>
                </div>
                <div class="col-md-4">
                    <label>Phone</label>
                    <input type="text" name="phone" class="form-control" value="<%= phone %>" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" value="<%= email %>" required>
                </div>
                <div class="col-md-6">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" value="<%= password %>" required>
                </div>
            </div>

            <div class="mb-3">
                <label>Address</label>
                <textarea name="address" class="form-control" rows="3" required><%= address %></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary me-3"><i class="bi bi-save"></i> Update Profile</button>
                <a href="UserHome.jsp" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Back</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
