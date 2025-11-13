<%@page import="java.sql.*"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Integer doctorId = (Integer) session.getAttribute("doctor_id");
    if (doctorId == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    String message = "";
    String type = "success";

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String qualification = request.getParameter("qualification");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE doctor SET fname=?, lname=?, phone=?, city=?, gender=?, age=?, qualification=?, address=?, password=? WHERE id=?"
            );

            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, phone);
            ps.setString(4, city);
            ps.setString(5, gender);
            ps.setString(6, age);
            ps.setString(7, qualification);
            ps.setString(8, address);
            ps.setString(9, password);
            ps.setInt(10, doctorId);

            if (ps.executeUpdate() > 0) {
                message = "✅ Profile Updated Successfully!";
                type = "success";
            } else {
                message = "❌ Update Failed!";
                type = "danger";
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    String fname="", lname="", gender="", phone="", city="", email="", age="", address="", qualification="", password="";
    try {
        Connection con = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM doctor WHERE id=?");
        ps.setInt(1, doctorId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            fname = rs.getString("fname");
            lname = rs.getString("lname");
            gender = rs.getString("gender");
            phone = rs.getString("phone");
            city = rs.getString("city");
            email = rs.getString("email");
            age = rs.getString("age");
            address = rs.getString("address");
            qualification = rs.getString("qualification");
            password = rs.getString("password");
        }
        con.close();
    } catch(Exception e){
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Doctor Profile - MediConnect</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
body {
    background: linear-gradient(135deg, #72c6ff, #e0f7ff);
    font-family: 'Poppins', sans-serif;
}
.card {
    border-radius: 18px;
    background: #ffffffee;
    padding: 30px;
}
label { font-weight: 600; }
.input-group-text { background: #0d6efd; color: white; }
.btn-custom {
    width: 200px;
    border-radius: 25px;
    font-size: 18px;
    transition: 0.3s;
}
.btn-custom:hover { transform: scale(1.05); }
.profile-pic {
    width: 120px; height: 120px;
    border-radius: 50%;
    border: 4px solid #0d6efd;
    margin-bottom: 15px;
}
.alert { animation: fadeIn 0.7s ease-in-out; }
@keyframes fadeIn {
  from {opacity: 0; transform: translateY(-10px);}
  to {opacity: 1; transform: translateY(0);}
}
</style>

</head>
<body>

<div class="container mt-5">
    <div class="card shadow-lg p-4 text-center">

        <img src="https://cdn-icons-png.flaticon.com/512/387/387561.png" class="profile-pic">

        <h3 class="text-primary fw-bold">
            <i class="bi bi-person-badge"></i> Doctor Profile
        </h3>
        <hr>

        <% if(!message.equals("")) { %>
        <div class="alert alert-<%=type%> fw-bold"><%= message %></div>
        <% } %>

        <form method="post" class="text-start">

            <label class="mt-2">Doctor ID</label>
            <input type="text" class="form-control mb-3" value="<%=doctorId%>" readonly>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>First Name</label>
                    <input type="text" name="fname" class="form-control" value="<%=fname%>" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label>Last Name</label>
                    <input type="text" name="lname" class="form-control" value="<%=lname%>" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 mb-3">
                    <label>Gender</label>
                    <select name="gender" class="form-control" required>
                        <option <%=gender.equals("Male")?"selected":""%>>Male</option>
                        <option <%=gender.equals("Female")?"selected":""%>>Female</option>
                        <option <%=gender.equals("Other")?"selected":""%>>Other</option>
                    </select>
                </div>

                <div class="col-md-4 mb-3">
                    <label>Age</label>
                    <input type="number" name="age" min="25" max="90" class="form-control" value="<%=age%>" required>
                </div>

                <div class="col-md-4 mb-3">
                    <label>Qualification</label>
                    <input type="text" name="qualification" class="form-control" value="<%=qualification%>" required>
                </div>
            </div>

            <label>City</label>
            <input type="text" name="city" class="form-control mb-3" value="<%=city%>" required>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Phone</label>
                    <input type="text" name="phone" maxlength="10" pattern="[0-9]{10}" class="form-control" 
                    value="<%=phone%>" required placeholder="10-digit number only">
                </div>
                <div class="col-md-6 mb-3">
                    <label>Email (Not Editable)</label>
                    <input type="email" class="form-control" value="<%=email%>" disabled>
                </div>
            </div>

            <label>Address</label>
            <textarea name="address" class="form-control mb-3" rows="2" required><%=address%></textarea>

            <label>Password</label>
            <div class="input-group mb-4">
                <input type="password" name="password" id="password" class="form-control" value="<%=password%>" required>
                <span class="input-group-text" onclick="togglePassword()">
                    <i class="bi bi-eye" id="toggleIcon"></i>
                </span>
            </div>

            <div class="text-center">
                <button class="btn btn-primary btn-custom me-2"><i class="bi bi-save"></i> Update</button>
                <a href="doctorDashboard.jsp" class="btn btn-secondary btn-custom">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
            </div>
        </form>

    </div>
</div>

<script>
function togglePassword() {
    const pass = document.getElementById("password");
    const icon = document.getElementById("toggleIcon");
    if(pass.type === "password") {
        pass.type = "text";
        icon.classList.replace("bi-eye", "bi-eye-slash");
    } else {
        pass.type = "password";
        icon.classList.replace("bi-eye-slash", "bi-eye");
    }
}
</script>

</body>
</html>
