<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    try {
        String mobile = request.getParameter("mobile");

        if (mobile != null && !mobile.isEmpty()) {
            Connection con = DatabaseConnection.initializeDatabase();

            String sql = "DELETE FROM recp WHERE mobile = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, mobile);

            int rows = ps.executeUpdate();
            con.close();

            if (rows > 0) {
                // ✅ Successfully deleted receptionist
                out.println("<script>alert('Receptionist deleted successfully!');window.location='adminRecpList.jsp';</script>");
            } else {
                out.println("<script>alert('Error: Receptionist not found or already deleted.');window.location='adminRecpList.jsp';</script>");
            }
        } else {
            out.println("<script>alert('Invalid receptionist ID or mobile number.');window.location='adminRecpList.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error deleting receptionist: " + e.getMessage() + "');window.location='adminRecpList.jsp';</script>");
    }
%>
