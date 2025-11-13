<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get form data
    int id = Integer.parseInt(request.getParameter("id"));
    String fullname = request.getParameter("fullname");
    String gender = request.getParameter("gender");
    int age = Integer.parseInt(request.getParameter("age"));
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Initialize database connection
        con = DatabaseConnection.initializeDatabase();

        // Prepare SQL update statement
        String query = "UPDATE user SET fullname=?, gender=?, age=?, email=?, phone=?, address=?, password=? WHERE id=?";
        ps = con.prepareStatement(query);
        ps.setString(1, fullname);
        ps.setString(2, gender);
        ps.setInt(3, age);
        ps.setString(4, email);
        ps.setString(5, phone);
        ps.setString(6, address);
        ps.setString(7, password);
        ps.setInt(8, id);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
%>
            <script>
                alert("Profile updated successfully!");
                window.location = "MyProfile.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Update failed! Please try again.");
                window.location = "profile.jsp";
            </script>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error occurred: <%= e.getMessage() %>");
            window.location = "userHome.jsp";
        </script>
<%
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
