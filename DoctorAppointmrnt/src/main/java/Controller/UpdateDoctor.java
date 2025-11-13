package Controller;

import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        Integer doctorId = (Integer) session.getAttribute("doctor_id");

        if (doctorId == null) {
            response.sendRedirect("doctorLogin.jsp");
            return;
        }

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String qualification = request.getParameter("qualification");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement pst = con.prepareStatement(
                "UPDATE doctor SET fname=?, lname=?, gender=?, age=?, qualification=?, city=?, phone=?, address=?, password=? WHERE id=?"
            );

            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, gender);
            pst.setString(4, age);
            pst.setString(5, qualification);
            pst.setString(6, city);
            pst.setString(7, phone);
            pst.setString(8, address);
            pst.setString(9, password);
            pst.setInt(10, doctorId);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                pw.println("<script>");
                pw.println("alert('Profile Updated Successfully!');");
                pw.println("window.location='doctorProfile.jsp';");
                pw.println("</script>");
            } else {
                pw.println("<script>");
                pw.println("alert('Update Failed! Try Again Later');");
                pw.println("window.location='doctorProfile.jsp';");
                pw.println("</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            pw.println("<script>");
            pw.println("alert('Error: " + e.getMessage() + "');");
            pw.println("window.location='doctorProfile.jsp';");
            pw.println("</script>");
        }
    }
}
