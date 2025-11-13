package Controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import Database.DatabaseConnection;

public class DoctorLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM doctor WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("doctor_id", rs.getInt("id"));
                session.setAttribute("doctorName", rs.getString("fname") + " " + rs.getString("lname"));
                session.setAttribute("doctorEmail", rs.getString("email"));  // ✅ IMPORTANT FIX

                response.sendRedirect("doctorDashboard.jsp");

            } else {
                response.getWriter().println("<script>alert('Invalid email or password!');window.location='doctorLogin.jsp';</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error occurred!');window.location='doctorLogin.jsp';</script>");
        }
    }
}
