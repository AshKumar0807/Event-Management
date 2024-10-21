package com.techblog.dao;
import com.techblog.helper.connectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistrationDao {
    public boolean registerUser(int postId, String email, String name) {
        boolean isSuccess = false;
        try {
            Connection conn = connectionProvider.connectionProvider(); // Ensure this is your DB connection method
            String query = "INSERT INTO EventRegistrations (post_id, email, name) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postId);
            pstmt.setString(2, email);
            pstmt.setString(3, name);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true; // Registration was successful
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }
        return isSuccess;
    }
}