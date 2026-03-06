<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Reports | Ocean View Resort</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        h2 { text-align: center; }
        form { text-align: center; margin-bottom: 20px; }
        input[type="text"] { padding: 5px; width: 200px; }
        input[type="submit"] { padding: 5px 10px; }
        table { width: 90%; margin: auto; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #333; padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .action-btn { padding: 5px 10px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px; }
        .print-btn { display: block; margin: 20px auto; padding: 8px 12px; background-color: #007BFF; color: white; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>
<h2>Ocean View Resort Reports</h2>

<!-- Search Form -->
<form method="get" action="reports.jsp">
    <input type="text" name="id" placeholder="Enter Reservation ID">
    <input type="submit" value="Search">
</form>

<%
    // Database connection
    String url = "jdbc:mysql://localhost:3306/hotel_reservation";
    String user = "root";
    String password = "";

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);

        String idParam = request.getParameter("id");
        String sql;

        if(idParam != null && !idParam.trim().isEmpty()) {
            // Single reservation report
            sql = "SELECT reservation_id, guest_name, contact_number, room_type, checkin_date, checkout_date, food_charges, laundry_charges " +
                  "FROM reservations WHERE reservation_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(idParam));
        } else {
            // All reservations
            sql = "SELECT reservation_id, guest_name, contact_number, room_type, checkin_date, checkout_date, food_charges, laundry_charges " +
                  "FROM reservations ORDER BY reservation_id DESC";
            pst = con.prepareStatement(sql);
        }

        rs = pst.executeQuery();

%>

<!-- Print Button -->
<button class="print-btn" onclick="window.print()">Generate / Print Report</button>

<table>
    <tr>
        <th>Reservation ID</th>
        <th>Guest Name</th>
        <th>Contact Number</th>
        <th>Room Type</th>
        <th>Check-in Date</th>
        <th>Check-out Date</th>
        <th>Food Charges</th>
        <th>Laundry Charges</th>
        <th>Total Amount</th>
        <th>Actions</th>
    </tr>

<%
        boolean hasData = false;

        while(rs.next()) {
            hasData = true;
            double food = rs.getDouble("food_charges");
            double laundry = rs.getDouble("laundry_charges");
            double total = food + laundry;
%>
    <tr>
        <td><%= rs.getInt("reservation_id") %></td>
        <td><%= rs.getString("guest_name") %></td>
        <td><%= rs.getString("contact_number") %></td>
        <td><%= rs.getString("room_type") %></td>
        <td><%= rs.getString("checkin_date") %></td>
        <td><%= rs.getString("checkout_date") %></td>
        <td><%= food %></td>
        <td><%= laundry %></td>
        <td><%= total %></td>
        <td>
            <a href="EditReservationServlet?id=<%= rs.getInt("reservation_id") %>" class="action-btn">Edit</a>
            <a href="DeleteReservationServlet?id=<%= rs.getInt("reservation_id") %>" class="action-btn" style="background-color:red;">Delete</a>
        </td>
    </tr>
<%
        }

        if(!hasData) {
            out.println("<tr><td colspan='10' style='color:red;'>No reservation found.</td></tr>");
        }

    } catch(Exception e) {
        out.println("<tr><td colspan='10' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(pst != null) pst.close(); } catch(Exception e) {}
        try { if(con != null) con.close(); } catch(Exception e) {}
    }
%>
</table>

</body>
</html>