<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("reservation_id"));
    String guestName = "", contactNumber = "", roomType = "", checkinDate = "", checkoutDate = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hotel_reservation", "root", ""
        );

        PreparedStatement ps = con.prepareStatement("SELECT * FROM reservations WHERE reservation_id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            guestName = rs.getString("guest_name");
            contactNumber = rs.getString("contact_number");
            roomType = rs.getString("room_type");
            checkinDate = rs.getString("checkin_date");
            checkoutDate = rs.getString("checkout_date");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Reservation</title>
</head>
<body>

<h2>Edit Reservation</h2>

<form action="EditReservationServlet" method="post">
    <input type="hidden" name="reservation_id" value="<%= id %>">

    Guest Name:
    <input type="text" name="guest_name" value="<%= guestName %>" required><br><br>

    Contact Number:
    <input type="text" name="contact_number" value="<%= contactNumber %>" required><br><br>

    Room Type:
    <select name="room_type" required>
        <option value="Single" <%= "Single".equals(roomType) ? "selected" : "" %>>Single</option>
        <option value="Double" <%= "Double".equals(roomType) ? "selected" : "" %>>Double</option>
        <option value="Suite" <%= "Suite".equals(roomType) ? "selected" : "" %>>Suite</option>
    </select><br><br>

    Check-in Date:
    <input type="date" name="checkin_date" value="<%= checkinDate %>" required><br><br>

    Check-out Date:
    <input type="date" name="checkout_date" value="<%= checkoutDate %>" required><br><br>

    <button type="submit">Update Reservation</button>
</form>

</body>
</html>