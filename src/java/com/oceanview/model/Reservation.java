package com.oceanview.model;

public class Reservation {

    private int reservationId;
    private String guestName;
    private String contactNumber;
    private String roomType;
    private String checkinDate;
    private String checkoutDate;
    private double foodCharges;
    private double laundryCharges;
    private String status;

    // Getters and Setters
    public int getReservationId() { return reservationId; }
    public void setReservationId(int reservationId) { this.reservationId = reservationId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public String getCheckinDate() { return checkinDate; }
    public void setCheckinDate(String checkinDate) { this.checkinDate = checkinDate; }

    public String getCheckoutDate() { return checkoutDate; }
    public void setCheckoutDate(String checkoutDate) { this.checkoutDate = checkoutDate; }

    public double getFoodCharges() { return foodCharges; }
    public void setFoodCharges(double foodCharges) { this.foodCharges = foodCharges; }

    public double getLaundryCharges() { return laundryCharges; }
    public void setLaundryCharges(double laundryCharges) { this.laundryCharges = laundryCharges; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}