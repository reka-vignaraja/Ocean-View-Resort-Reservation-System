package com.oceanview.controller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import com.oceanview.util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Invalidate old session to prevent session conflicts
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }

        // 2️⃣ Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");   // customer/admin/staff

        if (username == null || password == null || role == null ||
            username.isEmpty() || password.isEmpty() || role.isEmpty()) {
            // Missing fields, redirect based on role
            if ("customer".equals(role)) {
                response.sendRedirect("customerLogin.jsp?error=Please+fill+all+fields");
            } else {
                response.sendRedirect("login.jsp?error=Please+fill+all+fields");
            }
            return;
        }

        // 3️⃣ SQL query to check username, password, and role
        String sql = "SELECT * FROM users WHERE username=? AND password=? AND role=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // ✅ Login successful
                HttpSession session = request.getSession(true);
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // Redirect based on role
                if ("admin".equals(role) || "staff".equals(role)) {
                    response.sendRedirect("dashboard.jsp");
                } else if ("customer".equals(role)) {
                    response.sendRedirect("reservation.jsp");
                }

            } else {
                //  Login failed - redirect to correct login page
                if ("customer".equals(role)) {
                    response.sendRedirect("customerLogin.jsp?error=Invalid+Username+or+Password");
                } else {
                    response.sendRedirect("login.jsp?error=Invalid+Username+or+Password");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Server error redirect
            if ("customer".equals(role)) {
                response.sendRedirect("customerLogin.jsp?error=Server+Error");
            } else {
                response.sendRedirect("login.jsp?error=Server+Error");
            }
        }
    }
}