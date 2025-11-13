<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    try {
        String mobile = request.getParameter("mobile");

        if (mobile != null && !mobile.isEmpty()) {
            Connection con = DatabaseConnection.initializeDatabase();

            String sql = "DELETE FROM worker WHERE mobile = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, mobile);

            int rows = ps.executeUpdate();
            con.close();

            if (rows > 0) {
                // ✅ Worker deleted successfully
                out.println("<script>alert('Worker deleted successfully!');window.location='adminWorkerList.jsp';</script>");
            } else {
                out.println("<script>alert('Error: Worker not found or already deleted.');window.location='adminWorkerList.jsp';</script>");
            }
        } else {
            out.println("<script>alert('Invalid Worker ID or mobile number.');window.location='adminWorkerList.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error deleting worker: " + e.getMessage() + "');window.location='adminWorkerList.jsp';</script>");
    }
%>
