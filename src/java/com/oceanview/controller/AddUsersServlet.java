package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.oceanview.util.DBConnection;

@WebServlet("/AddUsersServlet")
public class AddUsersServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get form parameters
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // "user" or "admin"
        String status = "active"; // default

        // 2️⃣ Basic validation
        if(fullname == null || username == null || email == null || password == null || role == null ||
           fullname.isEmpty() || username.isEmpty() || email.isEmpty() || password.isEmpty() || role.isEmpty()) {
            response.sendRedirect("manageUsers.jsp?msg=missing_fields");
            return;
        }

        // 3️⃣ SQL Insert
        String sql = "INSERT INTO users(fullname, username, email, password, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, fullname);
            pst.setString(2, username);
            pst.setString(3, email);
            pst.setString(4, password); // optional: hash password
            pst.setString(5, role);
            

            int rows = pst.executeUpdate();

            if(rows > 0){
                response.sendRedirect("manageUsers.jsp?msg=success");
            } else {
                response.sendRedirect("manageUsers.jsp?msg=failed");
            }

        } catch(SQLIntegrityConstraintViolationException e){
            // Handle duplicate username/email
            response.sendRedirect("manageUsers.jsp?msg=duplicate");
        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("manageUsers.jsp?msg=error");
        }
    }
}