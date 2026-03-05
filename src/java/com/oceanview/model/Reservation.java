package com.oceanview.model;

public class Reservation {

    private int reservationId;  // add this
    private String guestName;
    private String phone;
    private String roomType;
    private String checkin;
    private String checkout;

    // Constructor including ID
    public Reservation(int reservationId, String guestName, String phone, String roomType, String checkin, String checkout) {
        this.reservationId = reservationId;
        this.guestName = guestName;
        this.phone = phone;
        this.roomType = roomType;
        this.checkin = checkin;
        this.checkout = checkout;
    }

    // Constructor without ID (for new reservation)
    public Reservation(String guestName, String phone, String roomType, String checkin, String checkout) {
        this.guestName = guestName;
        this.phone = phone;
        this.roomType = roomType;
        this.checkin = checkin;
        this.checkout = checkout;
    }

    // Getter for ID
    public int getReservationId() {
        return reservationId;
    }

    // Other getters
    public String getGuestName() { return guestName; }
    public String getPhone() { return phone; }
    public String getRoomType() { return roomType; }
    public String getCheckin() { return checkin; }
    public String getCheckout() { return checkout; }

    // Setter for ID if needed
    public void setReservationId(int reservationId) { this.reservationId = reservationId; }
}