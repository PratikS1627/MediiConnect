/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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


@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        try {
            // Database connection
            Connection con = DatabaseConnection.initializeDatabase();

            // Get all parameters from form
            String fullname = request.getParameter("fullname");
            String gender = request.getParameter("gender");
            String age = request.getParameter("age");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");

            // ✅ Password validation
            if (!password.equals(repassword)) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Passwords do not match. Please try again.');");
                pw.println("window.location.href = 'userRegister.jsp';");
                pw.println("</script>");
                return;
            }

            // ✅ SQL Insert
            String sql = "INSERT INTO user (fullname, gender, age, email, phone, address, username, password) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, fullname);
            pst.setString(2, gender);
            pst.setString(3, age);
            pst.setString(4, email);
            pst.setString(5, phone);
            pst.setString(6, address);
            pst.setString(7, username);
            pst.setString(8, password);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Registration Successful! You can now login.');");
                pw.println("window.location.href = 'userLogin.jsp';");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Registration Failed! Try Again.');");
                pw.println("window.location.href = 'userRegister.jsp';");
                pw.println("</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Error: " + e.getMessage() + "');");
            pw.println("window.location.href = 'userRegister.jsp';");
            pw.println("</script>");
        }
    }
}
