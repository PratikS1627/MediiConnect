<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration - MediConnect</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        body {
            background-image: url("img/Medical.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.6rem;
            font-weight: bold;
            color: #007bff !important;
            letter-spacing: 1px;
        }

        .navbar-nav .nav-link {
            color: #007bff !important;
            font-weight: 500;
            transition: 0.3s;
        }

        .navbar-nav .nav-link:hover {
            color: #0056b3 !important;
        }

        .register-container {
            margin: 60px auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            width: 450px;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            width: 100%;
            border-radius: 8px;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        .form-group label {
            font-weight: bold;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Clean Navbar -->
    <nav class="navbar navbar-expand-md">
        <a class="navbar-brand" href="index.jsp">MediConnect</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto" style="margin-right: 30px;">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="userLogin.jsp">User Login</a></li>
            </ul>
        </div>
    </nav>

    <div class="container register-container">
        <h2>User Registration</h2>
        <form action="UserRegister" method="post">
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="fullname" class="form-control" placeholder="Enter Full Name" required>
            </div>

            <div class="form-group">
                <label>Gender:</label>
                <select name="gender" class="form-control" required>
                    <option value="">Select Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>

            <div class="form-group">
                <label>Age:</label>
                <input type="number" name="age" class="form-control" placeholder="Enter Age" required>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email Address" required>
            </div>

            <div class="form-group">
                <label>Phone Number:</label>
                <input type="text" name="phone" class="form-control" placeholder="Enter Phone Number" required>
            </div>

            <div class="form-group">
                <label>Address:</label>
                <textarea name="address" class="form-control" rows="2" placeholder="Enter Address" required></textarea>
            </div>

            <div class="form-group">
                <label>Username:</label>
                <input type="text" name="username" class="form-control" placeholder="Enter Username" required>
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" placeholder="Enter Password" required>
            </div>

            <div class="form-group">
                <label>Confirm Password:</label>
                <input type="password" name="repassword" class="form-control" placeholder="Re-enter Password" required>
            </div>

            <button type="submit" class="btn btn-custom">Register</button>
        </form>

        <div class="text-center mt-3">
            <p>Already have an account? <a href="userLogin.jsp">Login Here</a></p>
        </div>
    </div>
</body>
</html>
