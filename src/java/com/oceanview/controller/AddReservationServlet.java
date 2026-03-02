package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName = request.getParameter("guestName");
        String phone = request.getParameter("phone");
        String roomType = request.getParameter("roomType");
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_reservation",
                    "root",
                    ""
            );

            String sql = "INSERT INTO reservations "
                    + "(guest_name, contact_number, room_type, checkin_date, checkout_date) "
                    + "VALUES (?, ?, ?, ?, ?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, guestName);
            ps.setString(2, phone);
            ps.setString(3, roomType);
            ps.setString(4, checkin);
            ps.setString(5, checkout);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // ✅ Redirect back to SAME form with success message
                response.sendRedirect("reservation.jsp?msg=success");
            } else {
                response.sendRedirect("reservation.jsp?msg=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reservation.jsp?msg=error");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
