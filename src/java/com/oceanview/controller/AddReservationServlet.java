package com.oceanview.controller;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            // 1. Collect data from form
            Reservation r = new Reservation();
            r.setGuestName(request.getParameter("guestName"));
            r.setContactNumber(request.getParameter("phone"));
            r.setRoomType(request.getParameter("roomType"));
            r.setCheckinDate(request.getParameter("checkin"));
            r.setCheckoutDate(request.getParameter("checkout"));
            r.setFoodCharges(0.0);      // default value
            r.setLaundryCharges(0.0);   // default value
            r.setStatus("Pending");      // default status

            // 2. Insert into DB
            ReservationDAO dao = new ReservationDAO();
            int reservationId = dao.addReservation(r);

            if (reservationId > 0) {
                // 3. Store info in session for payment page
                session.setAttribute("reservationId", reservationId);
                session.setAttribute("guestName", r.getGuestName());

                // 4. Redirect to payment page
                response.sendRedirect("payment.jsp");
            } else {
                // Failed to insert
                session.setAttribute("successMsg", "Failed to add reservation!");
                response.sendRedirect("reservation.jsp?msg=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("successMsg", "Error: " + e.getMessage());
            response.sendRedirect("reservation.jsp?msg=failed");
        }
    }
}