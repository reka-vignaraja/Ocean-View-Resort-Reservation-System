/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanview.dao;
import com.oceanview.model.Payment;
import com.oceanview.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PaymentDAO {

    public static boolean addPayment(Payment p) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO payment(reservation_id, guest_name, amount, payment_method, payment_date, status) VALUES (?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, p.getReservationId());
            ps.setString(2, p.getGuestName());
            ps.setDouble(3, p.getAmount());
            ps.setString(4, p.getPaymentMethod());
            ps.setString(5, p.getPaymentDate());
            ps.setString(6, p.getStatus());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
}
