package com.oceanview.controller;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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

        // Create model object
        Reservation reservation = new Reservation(
                guestName, phone, roomType, checkin, checkout
        );

        // DAO call
        ReservationDAO dao = new ReservationDAO();
        boolean result = dao.addReservation(reservation);

        if (result) {
            response.sendRedirect("reservation.jsp?msg=success");
        } else {
            response.sendRedirect("reservation.jsp?msg=failed");
        }
    }
}