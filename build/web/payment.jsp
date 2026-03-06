<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Check session
    if(session == null || session.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    // Get reservation_id from request
    String reservationIdStr = request.getParameter("reservation_id");
    String guestName = "";
    String roomType = null;
    double rate = 0;

    if(reservationIdStr != null){
        int reservationId = Integer.parseInt(reservationIdStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hotel_reservation",
                "root",
                ""
            );

            // Get reservation details
            PreparedStatement ps = con.prepareStatement(
                "SELECT guest_name, room_type FROM reservations WHERE reservation_id=?"
            );
            ps.setInt(1, reservationId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                guestName = rs.getString("guest_name");
                roomType = rs.getString("room_type");
            }
            rs.close();
            ps.close();
            con.close();

            // Calculate rate safely
            if(roomType != null){
                switch(roomType.toLowerCase()){
                    case "single": rate = 5000; break;
                    case "double": rate = 8000; break;
                    case "suite":  rate = 12000; break;
                    default: rate = 0;
                }
            } else {
                out.println("<p style='color:red;'>Error: Room type not found for this reservation.</p>");
            }

        } catch(Exception e){
            out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>Error: No reservation selected.</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment - Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            width: 400px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c5364;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        input:focus, select:focus {
            border-color: #2c5364;
            box-shadow: 0 0 5px #2c5364;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 25px;
            background-color: #2c5364;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background-color: #16325c;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Payment</h2>

    <%
        if(roomType != null){
    %>
    <form action="PaymentServlet" method="post">
        <input type="hidden" name="reservationId" value="<%= reservationIdStr %>">

        Guest Name<br>
        <input type="text" name="guestName" value="<%= guestName %>" readonly><br>

        Room Type<br>
        <input type="text" name="roomType" value="<%= roomType %>" readonly><br>

        Amount (LKR)<br>
        <input type="number" name="amount" value="<%= rate %>" readonly><br>

        Payment Method<br>
        <select name="paymentMethod">
            <option value="Cash">Cash</option>
            <option value="Card">Card</option>
            <option value="Online">Online</option>
        </select><br>

        Payment Date<br>
        <input type="date" name="paymentDate" required><br>

        <button type="submit">Pay Now</button>
    </form>
    <%
        } else {
            out.println("<p style='color:red; text-align:center;'>Cannot process payment. Reservation not found.</p>");
        }
    %>
</div>

</body>
</html>