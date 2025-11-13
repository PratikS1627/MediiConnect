<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    try {
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);

            Connection con = DatabaseConnection.initializeDatabase();
            String sql = "DELETE FROM doctor WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int rows = ps.executeUpdate();
            con.close();

            if (rows > 0) {
                // ✅ Deletion successful — redirect back to doctor list
                response.sendRedirect("adminDoctorList.jsp");
            } else {
                out.println("<script>alert('Error: Doctor not found or already deleted.');window.location='adminDoctorList.jsp';</script>");
            }
        } else {
            out.println("<script>alert('Invalid doctor ID.');window.location='adminDoctorList.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error deleting doctor: " + e.getMessage() + "');window.location='adminDoctorList.jsp';</script>");
    }
%>
