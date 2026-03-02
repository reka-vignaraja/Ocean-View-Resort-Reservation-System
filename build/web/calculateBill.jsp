<%@ page import="java.sql.*, java.time.*, java.time.temporal.ChronoUnit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // ✅ Session & Role check
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role) && !"staff".equals(role)) {
        response.sendRedirect("index.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Calculate Bill | Ocean View Resort</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #003366, #0066cc);
        }
        .container {
            width: 500px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            text-align: center;
        }
        h2 {
            color: #003366;
            margin-bottom: 20px;
        }
        input, button {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        button {
            background: #ff6600;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover { background: #cc5200; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background: #003366;
            color: white;
        }
        .total {
            font-weight: bold;
            font-size: 18px;
            color: #003366;
        }
        .back-btn, .print-btn {
            display: inline-block;
            margin: 12px 5px 0;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 6px;
            color: white;
            background: #003366;
        }
        .back-btn:hover, .print-btn:hover { background: #001f4d; }
    </style>
</head>
<body>
<div class="container">
    <h2>💰 Calculate Guest Bill</h2>

    <form method="post">
        <input type="number" name="reservation_id" placeholder="Enter Reservation ID" required>
        <button type="submit">Calculate Bill</button>
    </form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {

    try {
        int reservationId = Integer.parseInt(request.getParameter("reservation_id"));

        // ✅ Use your DBConnection class
        Connection con = com.oceanview.util.DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM reservations WHERE reservation_id = ?"
        );
        ps.setInt(1, reservationId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            String guestName = rs.getString("guest_name");
            String roomType = rs.getString("room_type");
            LocalDate checkin = LocalDate.parse(rs.getString("checkin_date"));
            LocalDate checkout = LocalDate.parse(rs.getString("checkout_date"));

            long days = ChronoUnit.DAYS.between(checkin, checkout);
            double roomRate = 0;

            switch(roomType.toLowerCase()) {
                case "single": roomRate = 5000; break;
                case "double": roomRate = 8000; break;
                case "suite":  roomRate = 12000; break;
            }

            double roomTotal = days * roomRate;

            // Optional extra charges (if you have columns in DB)
            double foodCharges = rs.getDouble("food_charges");       // set 0 if null
            double laundryCharges = rs.getDouble("laundry_charges"); // set 0 if null

            // Optional discount: 10% if stay >=5 nights
            double discount = (days >=5) ? 0.1 * roomTotal : 0;

            double subtotal = roomTotal + foodCharges + laundryCharges;
            double tax = 0.1 * subtotal; // 10% tax
            double grandTotal = subtotal + tax - discount;
%>

<table>
    <tr><th colspan="2">Bill Summary</th></tr>
    <tr><td>Guest Name</td><td><%= guestName %></td></tr>
    <tr><td>Reservation ID</td><td><%= reservationId %></td></tr>
    <tr><td>Room Type</td><td><%= roomType %></td></tr>
    <tr><td>Check-in</td><td><%= checkin %></td></tr>
    <tr><td>Check-out</td><td><%= checkout %></td></tr>
    <tr><td>Total Days</td><td><%= days %></td></tr>
    <tr><td>Rate per Day</td><td>Rs. <%= roomRate %></td></tr>
    <tr><td>Room Total</td><td>Rs. <%= roomTotal %></td></tr>
    <tr><td>Food Charges</td><td>Rs. <%= foodCharges %></td></tr>
    <tr><td>Laundry Charges</td><td>Rs. <%= laundryCharges %></td></tr>
    <tr><td>Discount</td><td>Rs. <%= discount %></td></tr>
    <tr><td>Tax (10%)</td><td>Rs. <%= tax %></td></tr>
    <tr class="total"><td>Grand Total</td><td>Rs. <%= grandTotal %></td></tr>
</table>

<a class="print-btn" onclick="window.print()">🖨 Print Bill</a>

<%
        } else {
            out.println("<p style='color:red; margin-top:15px;'>❌ Reservation not found!</p>");
        }

        rs.close();
        ps.close();
        con.close();

    } catch(NumberFormatException e) {
        out.println("<p style='color:red; margin-top:15px;'>❌ Invalid Reservation ID!</p>");
    } catch(Exception e) {
        out.println("<p style='color:red; margin-top:15px;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

<a href="dashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
</div>
</body>
</html>