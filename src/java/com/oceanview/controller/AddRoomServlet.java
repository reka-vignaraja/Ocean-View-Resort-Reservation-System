package com.oceanview.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomNumber = request.getParameter("roomNumber");
        String roomType = request.getParameter("roomType");
        String priceStr = request.getParameter("price");
        String status = request.getParameter("status");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            double price = Double.parseDouble(priceStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_reservation",
                    "root",
                    "" );

            String sql = "INSERT INTO rooms (room_number, room_type, price, status) VALUES (?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, roomNumber);
            ps.setString(2, roomType);
            ps.setDouble(3, price);
            ps.setString(4, status);

            int row = ps.executeUpdate();
            if (row > 0) {
                // Success → redirect back to rooms.jsp
                response.sendRedirect("rooms.jsp");
            } else {
                response.getWriter().println("Error adding room!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}