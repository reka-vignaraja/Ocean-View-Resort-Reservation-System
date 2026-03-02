<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Rooms - Ocean View Resort</title>
    <style>
        body { font-family: Arial; background: #f0f2f5; padding: 20px; }
        h2 { text-align: center; margin-bottom: 20px; }
        .room-container { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; }
        .room-card {
            background: white; padding: 15px; border-radius: 10px; width: 220px; 
            box-shadow: 0 5px 10px rgba(0,0,0,0.1); text-align: center;
        }
        button { padding: 8px 12px; background-color: #1e3c72; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #16325c; }
    </style>
</head>
<body>

<h2>Available Rooms</h2>

<div class="room-container">
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_reservation",
                    "root",
                    ""
            );
                    

        String sql = "SELECT * FROM rooms r WHERE r.status='Available' " +
                     "AND r.room_id NOT IN (SELECT room_id FROM reservations " +
                     "WHERE (CURDATE() BETWEEN checkin_date AND checkout_date) AND status='Booked')";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while(rs.next()) {
%>
    <div class="room-card">
        <h3><%= rs.getString("room_type") %></h3>
        <p>Room No: <%= rs.getString("room_number") %></p>
        <p>Price: LKR <%= rs.getDouble("price") %></p>
        <form action="AddReservationServlet" method="post">
            <input type="hidden" name="roomId" value="<%= rs.getInt("room_id") %>">
            <button type="submit">Book Now</button>
        </form>
    </div>
<%
        }
    } catch(Exception e) {
        out.println(e);
    } finally {
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
%>
</div>

</body>
</html>