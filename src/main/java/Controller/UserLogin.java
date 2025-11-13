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
import javax.servlet.http.HttpSession;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            // ✅ Query user table
            String sql = "SELECT * FROM user WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ Create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("fullname", rs.getString("fullname"));

                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Login Successful! Welcome, " + rs.getString("fullname") + "');");
                pw.println("window.location.href = 'UserHome.jsp';");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Incorrect username or password. Try again.');");
                pw.println("window.location.href = 'userLogin.jsp';");
                pw.println("</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Error: " + e.getMessage() + "');");
            pw.println("window.location.href = 'userLogin.jsp';");
            pw.println("</script>");
        }
    }
}
