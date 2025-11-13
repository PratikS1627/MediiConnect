package Controller;

import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        String userp = request.getParameter("your_name");
        String passp = request.getParameter("your_pass");

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            // ✅ Use PreparedStatement for safety and correct matching
            String sql = "SELECT * FROM adminreg WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userp);
            ps.setString(2, passp);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Login Successfully..!');");
                pw.println("window.location.href='AdminHome.jsp';");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Username or Password is Incorrect..!');");
                pw.println("window.location.href='adminLogin.jsp';");
                pw.println("</script>");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Database Error: " + e.getMessage() + "');");
            pw.println("window.location.href='adminLogin.jsp';");
            pw.println("</script>");
        }
    }
}
