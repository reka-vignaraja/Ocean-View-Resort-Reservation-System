package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.oceanview.util.DBConnection;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // 1️⃣ Check password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?msg=password_mismatch");
            return;
        }

        String sql = "INSERT INTO users(fullname, username, password) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, fullname);
            pst.setString(2, username);
            pst.setString(3, password);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("login.jsp?msg=success");
            } else {
                response.sendRedirect("signup.jsp?msg=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?msg=error");
        }
    }
}
