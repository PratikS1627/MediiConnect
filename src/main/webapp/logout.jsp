<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logging Out...</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #f5f8fc;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .logout-box {
            background: white;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: #007bff;
            font-weight: bold;
        }
        p {
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%
    // Invalidate the current user session
    session.invalidate();

    // Redirect directly to index.jsp (instant logout)
    response.sendRedirect("index.jsp");
%>

<div class="logout-box">
    <h2>Logging Out...</h2>
    <p>You are being redirected to the home page.</p>
    <a href="index.jsp" class="btn btn-primary mt-3">Go to Home</a>
</div>

</body>
</html>
