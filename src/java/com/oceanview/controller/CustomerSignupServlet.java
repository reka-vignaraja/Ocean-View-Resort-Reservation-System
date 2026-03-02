package com.oceanview.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.oceanview.util.DBConnection;

@WebServlet("/CustomerSignupServlet")
public class CustomerSignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Password match check
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("customerSignup.jsp?msg=password_mismatch");
            return;
        }

        String sql = "INSERT INTO users(fullname, username, password, role) VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, fullname);
            pst.setString(2, username);
            pst.setString(3, password);
            pst.setString(4, "customer");   // 🔥 Important

            int rows = pst.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("customerLogin.jsp?msg=success");
            } else {
                response.sendRedirect("customerSignup.jsp?msg=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customerSignup.jsp?msg=error");
        }
    }
}