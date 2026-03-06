package com.oceanview.dao;

import com.oceanview.model.Reservation;
import com.oceanview.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ReservationDAO {

    // Add reservation and return generated reservation ID
    public int addReservation(Reservation r) {
        int generatedId = 0;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO reservations " +
                    "(guest_name, contact_number, room_type, checkin_date, checkout_date, food_charges, laundry_charges, status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getContactNumber());
            ps.setString(3, r.getRoomType());
            ps.setString(4, r.getCheckinDate());
            ps.setString(5, r.getCheckoutDate());
            ps.setDouble(6, r.getFoodCharges());
            ps.setDouble(7, r.getLaundryCharges());
            ps.setString(8, r.getStatus());

            int row = ps.executeUpdate();

            if (row > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                    r.setReservationId(generatedId);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return generatedId;
    }
}