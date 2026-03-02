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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");   // ✅ GET ROLE

        String sql = "SELECT * FROM users WHERE username=? AND password=? AND role=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, role);   // ✅ SET ROLE PARAMETER

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // Redirect based on role
                if ("admin".equals(role)) {
    response.sendRedirect("dashboard.jsp");
} 
else if ("staff".equals(role)) {
    response.sendRedirect("dashboard.jsp");
} 
else if ("customer".equals(role)) {
    response.sendRedirect("reservation.jsp");
}

            } else {
                response.sendRedirect("login.jsp?error=Invalid+Username+or+Password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Server+Error");
        }
    }
}