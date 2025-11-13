<%@page import="java.sql.*"%>
<%@page import="Database.DatabaseConnection"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Appointments</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body>

<%
    Integer doctorId = (Integer) session.getAttribute("doctor_id");
    if (doctorId == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="text-primary">📅 Patient Appointments</h2>
        <!-- ✅ Back button -->
        <a href="doctorDashboard.jsp" class="btn btn-secondary">← Back</a>
    </div>

    <%
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement(
                "SELECT a.id, a.appointment_date, a.status, u.fullname, u.email, u.phone " +
                "FROM appointments a JOIN user u ON a.patient_id = u.id WHERE a.doctor_id = ?"
            );
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.print("<p class='text-center text-danger'>No Appointments!</p>");
            } else {
    %>

    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>ID</th><th>Patient</th><th>Email</th><th>Phone</th>
                <th>Date</th><th>Status</th><th>Action</th>
            </tr>
        </thead>
        <tbody>
    <%
        while(rs.next()) {
    %>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("fullname")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("phone")%></td>
            <td><%=rs.getDate("appointment_date")%></td>
            <td><%=rs.getString("status")%></td>
            <td>
                <form action="UpdateAppointmentStatus" method="post">
                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>">
                    <select name="status" class="form-select form-select-sm">
                        <option>Pending</option>
                        <option>Confirmed</option>
                        <option>Completed</option>
                        <option>Cancelled</option>
                    </select>
                    <button class="btn btn-sm btn-primary mt-1">Update</button>
                </form>
            </td>
        </tr>
    <%
        }
    %>
        </tbody>
    </table>

    <%
            }
            con.close();
        } catch(Exception e) {
            out.print("<p class='text-danger text-center'>Error: " + e.getMessage() + "</p>");
        }
    %>
</div>

</body>
</html>
