package com.oceanview.controller;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get parameters from JSP
        String reservationIdStr = request.getParameter("reservationId");
        String guestName = request.getParameter("guestName");
        String paymentMethod = request.getParameter("paymentMethod");
        String amountStr = request.getParameter("amount");
        String paymentDateStr = request.getParameter("paymentDate");

        try {
            int reservationId = Integer.parseInt(reservationIdStr);
            double amount = Double.parseDouble(amountStr);
            LocalDate paymentDate = LocalDate.parse(paymentDateStr);

            // 2️⃣ Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_reservation", "root", "");

            // 3️⃣ Insert payment record
            String insertPayment = "INSERT INTO payment (reservation_id, guest_name, payment_amount, payment_method, payment_date, payment_status) " +
                                   "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps1 = con.prepareStatement(insertPayment);
            ps1.setInt(1, reservationId);
            ps1.setString(2, guestName);
            ps1.setDouble(3, amount);
            ps1.setString(4, paymentMethod);
            ps1.setDate(5, Date.valueOf(paymentDate));
            ps1.setString(6, "Paid");

            int paymentResult = ps1.executeUpdate();
            ps1.close();

            // 4️⃣ Update reservation status to Paid
            if (paymentResult > 0) {
                String updateReservation = "UPDATE reservations SET status = 'Paid' WHERE reservation_id = ?";
                PreparedStatement ps2 = con.prepareStatement(updateReservation);
                ps2.setInt(1, reservationId);  // use reservation_id, not reservationId
                ps2.executeUpdate();
                ps2.close();

                HttpSession session = request.getSession();
                session.setAttribute("successMsg", "Payment Successful for Reservation " + reservationId);
                response.sendRedirect("viewReservations.jsp");
            } else {
                response.getWriter().println("Payment Failed");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Payment Error: " + e.getMessage());
        }
    }
}