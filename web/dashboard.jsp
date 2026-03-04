<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Session check (same as dashboard)
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation | Ocean View Resort</title>
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
.form-container {
    width: 450px;
    margin: 40px auto;
    padding: 30px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

input, select {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 10px;
    margin-top: 15px;
    background: #2a5298;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

button:hover {
    background: #1e3c72;
}

.back-btn {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #2a5298;
    font-weight: bold;
}
</style>
</head>

<body>

<div class="dashboard-container">

    <!-- Sidebar (Same as dashboard.jsp) -->
    <div class="sidebar">
        <h2>Ocean View</h2>
        <ul>

            <li><a href="reservation.jsp">Add Reservation</a></li>
            <li><a href="viewReservations.jsp">View Reservation</a></li>
            <li><a href="calculateBill.jsp">Calculate Bill</a></li>

            <% if ("admin".equals(role)) { %>
                <li><a href="manageUsers.jsp">Manage Users</a></li>
                <li><a href="changeRoomRates.jsp">Change Room Rates</a></li>
                <li><a href="reports.jsp">View Reports</a></li>
            <% } %>

            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">

        <h1>Add Reservation</h1>
        <p>Welcome, <%= username %></p>

        <div class="form-container">
            <h2>New Reservation</h2>

            <form action="AddReservationServlet." method="post">

                <label>Guest Name</label>
                <input type="text" name="guestName" required>

                <label>Phone</label>
                <input type="text" name="phone" required>

                <label>Room Type</label>
                <select name="roomType">
                    <option value="Single">Single Room</option>
                    <option value="Double">Double Room</option>
                    <option value="Suite">Suite</option>
                </select>

                <label>Check-in Date</label>
                <input type="date" name="checkin" required>

                <label>Check-out Date</label>
                <input type="date" name="checkout" required>

                <button type="submit">Add Reservation</button>
            </form>

            
        </div>

        <%
            String msg = request.getParameter("msg");
            if ("success".equals(msg)) {
        %>
        <script>
            alert("Reservation Successfully Added!");
        </script>
        <%
            }
        %>

    </div>

</div>

</body>
</html>