package com.oceanview.dao;

import com.oceanview.model.Reservation;
import com.oceanview.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    //  Add Reservation
    public boolean addReservation(Reservation r) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO reservations (guest_name, contact_number, room_type, checkin_date, checkout_date) VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getPhone());
            ps.setString(3, r.getRoomType());
            ps.setString(4, r.getCheckin());
            ps.setString(5, r.getCheckout());
            int row = ps.executeUpdate();
            if (row > 0) status = true;
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //  Delete Reservation (add this)
    public boolean deleteReservation(int reservationId) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM reservations WHERE reservation_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, reservationId);
            int row = ps.executeUpdate();
            if (row > 0) status = true;
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //  Get All Reservations (optional, for viewing)
    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM reservations ORDER BY reservation_id DESC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation(
                        rs.getInt("reservation_id"),
                        rs.getString("guest_name"),
                        rs.getString("contact_number"),
                        rs.getString("room_type"),
                        rs.getString("checkin_date"),
                        rs.getString("checkout_date")
                );
                list.add(r);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}