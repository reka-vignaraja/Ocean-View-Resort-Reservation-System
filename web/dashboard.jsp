<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Session check
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get username and role from session
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role"); // <-- MUST be here
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | Ocean View Resort</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="dashboard-container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Ocean View</h2>
        <ul>

    <!-- Both Admin & Staff -->
    <li><a href="reservation.jsp">Add Reservation</a></li>
    <li><a href="viewReservations.jsp">View Reservation</a></li>
    <li><a href="calculateBill.jsp">Calculate Bill</a></li>

    <!-- Admin Only -->
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
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        <p>Ocean View Resort Reservation Management System</p>

        <div class="card-container">
            <div class="card">
                <h3>Add New Reservation</h3>
                <p>Create a new guest booking</p>
            </div>

            <div class="card">
                <h3>View Reservations</h3>
                <p>Check existing bookings</p>
            </div>

            <div class="card">
                <h3>Generate Bill</h3>
                <p>Calculate stay charges</p>
                
                
            </div>
        </div>
    </div>

</div>

</body>
</html>

