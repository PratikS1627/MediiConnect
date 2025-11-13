package Controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import Database.DatabaseConnection;

public class BookAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String docParam = request.getParameter("doctor_id");
            String patParam = request.getParameter("patient_id");
            String appointmentDate = request.getParameter("appointment_date");

            // Validate parameters
            if (docParam == null || patParam == null || docParam.isEmpty() || patParam.isEmpty()) {
                out.println("<script>alert('Missing doctor or patient information!'); window.location='listDoctor.jsp';</script>");
                return;
            }

            int doctorId = Integer.parseInt(docParam);
            int patientId = Integer.parseInt(patParam);

            Connection con = DatabaseConnection.initializeDatabase();
            String query = "INSERT INTO appointments (doctor_id, patient_id, appointment_date, status) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, doctorId);
            ps.setInt(2, patientId);
            ps.setString(3, appointmentDate);
            ps.setString(4, "Confirmed");

            int rows = ps.executeUpdate();
            con.close();

            if (rows > 0) {
                out.println("<script>alert('Appointment booked successfully!'); window.location='myAppointments.jsp';</script>");
            } else {
                out.println("<script>alert('Booking failed. Please try again.'); window.location='bookAppointment.jsp';</script>");
            }

        } catch (NumberFormatException e) {
            out.println("<script>alert('Invalid doctor or patient ID!'); window.location='listDoctor.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='bookAppointment.jsp';</script>");
        }
    }
}
