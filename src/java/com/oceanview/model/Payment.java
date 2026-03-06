/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanview.model;


public class Payment {

    private int reservationId;
    private String guestName;
    private double amount;
    private String paymentMethod;
    private String paymentDate;
    private String status;

    public Payment(int reservationId, String guestName, double amount,
                   String paymentMethod, String paymentDate, String status) {
        this.reservationId = reservationId;
        this.guestName = guestName;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.paymentDate = paymentDate;
        this.status = status;
    }

    public int getReservationId() {
        return reservationId;
    }

    public String getGuestName() {
        return guestName;
    }

    public double getAmount() {
        return amount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public String getStatus() {
        return status;
    }
}
