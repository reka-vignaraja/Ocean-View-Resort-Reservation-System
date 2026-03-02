<%@ page import="java.sql.*" %>
<%@ page import="com.oceanview.util.DBConnection" %>
<%@ page session="true" %>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if(username == null || !"customer".equals(role)){
        response.sendRedirect("customerLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Customer Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #f1f8ff);
        }

        /* NAVBAR */
        .navbar {
            background: #2c5364;
            color: white;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
        }

        .nav-links a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
        }

        .nav-links a:hover {
            color: #ffd369;
        }

        /* WELCOME */
        .welcome {
            padding: 40px;
            text-align: center;
        }

        .welcome h2 {
            color: #2c5364;
        }

        /* CARD SECTIONS */
        .new-reservation,
        .reservations,
        .profile {
            background: white;
            margin: 30px auto;
            padding: 30px;
            width: 85%;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h3 {
            color: #203a43;
            border-left: 5px solid #2c5364;
            padding-left: 10px;
        }

        /* FORMS */
        form label {
            display: block;
            margin-top: 10px;
            font-weight: 500;
        }

        form input,
        form select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        form input:focus,
        form select:focus {
            border-color: #2c5364;
            outline: none;
        }

        button {
            background: #2c5364;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #203a43;
        }

        /* TABLE */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table th {
            background: #2c5364;
            color: white;
            padding: 12px;
        }

        table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        table tr:hover {
            background-color: #f5f9fc;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .new-reservation,
            .reservations,
            .profile {
                width: 95%;
                padding: 20px;
            }

            table th,
            table td {
                font-size: 13px;
            }
        }
    </style>

</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <span class="logo">Ocean View Resort</span>
        <div class="nav-links">
            <a href="customerDashboard.jsp">Home</a>
            <a href="#reservations">My Reservations</a>
            <a href="#profile">My Profile</a>
            <a href="LogoutServlet">Logout</a>
        </div>
    </div>

    <!-- Welcome Section -->
    <div class="welcome">
        <h2>Welcome, <%=username%>! ?</h2>
    </div>

    <!-- Make New Reservation -->
    <div class="new-reservation">
        <h3>Make a New Reservation</h3>
        <form action="MakeReservationServlet" method="post">
            <label>Check-in:</label>
            <input type="date" name="checkin" required>

            <label>Check-out:</label>
            <input type="date" name="checkout" required>

            <label>Guests:</label>
            <input type="number" name="guests" min="1" max="10" required>

            <label>Room Type:</label>
            <select name="room_type" required>
                <option value="Single">Single</option>
                <option value="Double">Double</option>
                <option value="Suite">Suite</option>
            </select>

            <button type="submit">Reserve</button>
        </form>
    </div>

    <!-- My Reservations -->
    <div class="reservations" id="reservations">
        <h3>My Reservations</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Check-in</th>
                <th>Check-out</th>
                <th>Guests</th>
                <th>Room Type</th>
                <th>Status</th>
            </tr>

            <%
                try (Connection con = DBConnection.getConnection()){
                    String sql = "SELECT * FROM reservations WHERE username=?";
                    PreparedStatement pst = con.prepareStatement(sql);
                    pst.setString(1, username);
                    ResultSet rs = pst.executeQuery();

                    while(rs.next()){
            %>
            <tr>
                <td><%=rs.getInt("id")%></td>
                <td><%=rs.getDate("checkin")%></td>
                <td><%=rs.getDate("checkout")%></td>
                <td><%=rs.getInt("guests")%></td>
                <td><%=rs.getString("room_type")%></td>
                <td><%=rs.getString("status")%></td>
            </tr>
            <%
                    }
                } catch(Exception e){
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
    </div>

    <!-- Profile Section -->
    <div class="profile" id="profile">
        <h3>My Profile</h3>
        <form action="UpdateProfileServlet" method="post">
            <label>Full Name:</label>
            <input type="text" name="fullname" value="<%=username%>" required>

            <label>Password:</label>
            <input type="password" name="password" placeholder="New Password">

            <button type="submit">Update Profile</button>
        </form>
    </div>

</body>
</html>