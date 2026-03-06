<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Reservations</title>
<style>
body { font-family: Arial; background-color: #f4f4f4; margin: 0; }
h2 { text-align: center; margin-top: 20px; }
table { width: 95%; margin: 20px auto; border-collapse: collapse; background: white; }
th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
th { background-color: #003366; color: white; }
tr:hover { background-color: #f1f1f1; }
.btn { padding: 6px 12px; border: none; border-radius: 5px; cursor: pointer; }
.edit-btn { background-color: #0072b1; color: white; }
.edit-btn:hover { background-color: #005f8d; }
.delete-btn { background-color: #cc0000; color: white; }
.delete-btn:hover { background-color: #990000; }
.pay-btn { background-color: #28a745; color: white; }
.pay-btn:hover { background-color: #1e7e34; }
.back-btn { display: block; width: 150px; margin: 20px auto; text-align: center; padding: 10px; background: #003366; color: white; text-decoration: none; border-radius: 5px; }
.back-btn:hover { background: #001f4d; }
.status-paid { color: green; font-weight: bold; }
.status-pending { color: red; font-weight: bold; }
</style>
</head>

<body>

<h2>Reservation List</h2>
<a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>

<table>
<tr>
    <th>ID</th>
    <th>Guest Name</th>
    <th>Contact Number</th>
    <th>Room Type</th>
    <th>Check-in Date</th>
    <th>Check-out Date</th>
    <th>Status</th>
    <th>Actions</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hotel_reservation", "root", ""
    );

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(
        "SELECT * FROM reservations ORDER BY reservation_id DESC"
    );

    while (rs.next()) {
        int reservationId = rs.getInt("reservation_id");
        String status = rs.getString("status"); // get the new status column
%>

<tr>
<td><%= reservationId %></td>
<td><%= rs.getString("guest_name") %></td>
<td><%= rs.getString("contact_number") %></td>
<td><%= rs.getString("room_type") %></td>
<td><%= rs.getString("checkin_date") %></td>
<td><%= rs.getString("checkout_date") %></td>
<td class="<%= status.equals("Paid") ? "status-paid" : "status-pending" %>">
    <%= status %>
</td>
<td>
    <!-- Edit -->
    <form action="editReservation.jsp" method="get" style="display:inline;">
        <input type="hidden" name="reservation_id" value="<%= reservationId %>">
        <button type="submit" class="btn edit-btn">Edit</button>
    </form>

    <!-- Delete -->
    <form action="DeleteReservationServlet" method="post" style="display:inline;"
          onsubmit="return confirm('Are you sure you want to delete this reservation?');">
        <input type="hidden" name="reservation_id" value="<%= reservationId %>">
        <button type="submit" class="btn delete-btn">Remove</button>
    </form>

    <!-- Pay button only if status is not Paid -->
    <%
    if (!status.equals("Paid")) {
    %>
    <form action="PaymentServlet" method="post" style="display:inline;">
        <input type="hidden" name="reservationId" value="<%= reservationId %>">
        <input type="hidden" name="guestName" value="<%= rs.getString("guest_name") %>">
        <input type="hidden" name="amount" value="1000"> <!-- replace with actual amount -->
        <input type="hidden" name="paymentMethod" value="Cash"> <!-- or select input -->
        <input type="hidden" name="paymentDate" value="<%= java.time.LocalDate.now() %>">
        <button type="submit" class="btn pay-btn">Pay</button>
    </form>
    <%
    }
    %>
</td>
</tr>

<%
    }
    rs.close();
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
}
%>
</table>
</body>
</html>