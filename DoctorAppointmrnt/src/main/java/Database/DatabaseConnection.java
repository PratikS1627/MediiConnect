/*
 * Database Connection Utility
 * Compatible with MySQL Connector 8.0.12 and later
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // Method to initialize and return database connection
    public static Connection initializeDatabase() 
            throws SQLException, ClassNotFoundException {
        
        // Load MySQL JDBC Driver (updated driver class)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Database URL with additional parameters for compatibility
        String dbURL = "jdbc:mysql://localhost:3306/hospital?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        
        // Database credentials
        String dbUsername = "root";   // change if your MySQL username is different
        String dbPassword = "root123";   // change if your MySQL password is different

        // Create and return connection
        Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        System.out.println("✅ Database connected successfully!");
        return con;
    }
}
