package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import Database.DatabaseConnection;


public class UpdateAppointmentStatus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE appointments SET status=? WHERE id=?");
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
            con.close();

            response.sendRedirect("doctorAppointments.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
