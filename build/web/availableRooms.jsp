<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Rooms - Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial;
            background: #f0f2f5;
            margin: 0;
            padding: 0;
        }

   .navbar {
    position: fixed;     
    top: 0;              
    left: 0;              
    width: 100%;         
    z-index: 1000;        
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 60px;
    background: #2c5364;
    box-sizing: border-box;
}

.navbar h2 {
    color: white;
    margin: 0;          /* small alignment fix */
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    transition: 0.3s;
}

.navbar a:hover {
    color: #00c6ff;
}
   

        /* ===== PAGE CONTENT ===== */
        .content {
            margin-top: 100px;   /* IMPORTANT: prevents navbar overlap */
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .room-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .room-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            width: 250px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
            transition: 0.3s;
        }

        .room-card:hover {
            transform: translateY(-5px);
        }

        button {
            padding: 10px 15px;
            background-color: #1e3c72;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #16325c;
        }

        .no-rooms {
            text-align: center;
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>? Ocean View Resort</h2>
    <div class="nav-links">
        <a href="index.html">Home</a>
        <a href="about.jsp">About</a>
        <a href="availableRooms.jsp">Rooms</a>
        <a href="contact.jsp">Contact Us</a>
    </div>
</div>

<div class="content">

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
                 "AND r.room_id NOT IN (" +
                 "SELECT room_id FROM reservations " +
                 "WHERE CURDATE() BETWEEN checkin_date AND checkout_date " +
                 "AND status='Booked')";

    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();

    boolean hasRooms = false;

    while(rs.next()) {
        hasRooms = true;
%>

    <div class="room-card">
        <h3><%= rs.getString("room_type") %></h3>
        <p><strong>Room No:</strong> <%= rs.getString("room_number") %></p>
        <p><strong>Price:</strong> LKR <%= rs.getDouble("price") %></p>

        <form action="AddReservationServlet" method="post">
            <input type="hidden" name="roomId" value="<%= rs.getInt("room_id") %>">
            <button type="submit">Book Now</button>
        </form>
    </div>

<%
    }

    if(!hasRooms){
%>
        <p class="no-rooms">No Rooms Available Right Now</p>
<%
    }

} catch(Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}
%>

</div>
</div>

</body>
</html>