<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Appointment - MediConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5 p-4 bg-white rounded shadow" style="max-width:600px;">
    <h2 class="text-center mb-4">Book Appointment</h2>

    <%
        String docId = request.getParameter("doctor_id");
        String docName = "";
        String docSpec = "";

        if (docId == null || docId.trim().isEmpty()) {
            out.println("<div class='alert alert-danger'>⚠️ Invalid Doctor ID! Please select a doctor again from the list.</div>");
        } else {
            try {
                Connection con = DatabaseConnection.initializeDatabase();
                PreparedStatement ps = con.prepareStatement("SELECT fname, lname, qualification FROM doctor WHERE id=?");
                ps.setInt(1, Integer.parseInt(docId));
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    docName = rs.getString("fname") + " " + rs.getString("lname");
                    docSpec = rs.getString("qualification");
                } else {
                    out.println("<div class='alert alert-warning'>Doctor not found!</div>");
                }
                con.close();
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
        }
    %>

    <% if (docId != null && !docId.trim().isEmpty()) { %>
    <form action="BookAppointmentServlet" method="post">
        <input type="hidden" name="doctor_id" value="<%= docId %>">

        <div class="mb-3">
            <label>Doctor Name</label>
            <input type="text" class="form-control" value="<%= docName %>" readonly>
        </div>

        <div class="mb-3">
            <label>Qualification</label>
            <input type="text" class="form-control" value="<%= docSpec %>" readonly>
        </div>

        <div class="mb-3">
            <label>Patient ID</label>
            <input type="number" name="patient_id" class="form-control" placeholder="Enter your Patient ID" required>
        </div>

        <div class="mb-3">
            <label>Appointment Date</label>
            <input type="date" name="appointment_date" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Confirm Appointment</button>
    </form>
    <% } %>
</div>
</body>
</html>
