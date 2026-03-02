package com.oceanview.controller;   // change if your package is different

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditReservationServlet")
public class EditReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("reservation_id"));
        String guestName = request.getParameter("guest_name");
        String contactNumber = request.getParameter("contact_number");
        String roomType = request.getParameter("room_type");
        String checkinDate = request.getParameter("checkin_date");
        String checkoutDate = request.getParameter("checkout_date");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_reservation",
                    "root",
                    ""
            );

            String sql = "UPDATE reservations SET guest_name=?, contact_number=?, room_type=?, checkin_date=?, checkout_date=? ,food_charges=?, laundry_charges=? WHERE reservation_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, guestName);
            ps.setString(2, contactNumber);
            ps.setString(3, roomType);
            ps.setString(4, checkinDate);
            ps.setString(5, checkoutDate);
            ps.setInt(6, id);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("viewReservations.jsp");
    }
}