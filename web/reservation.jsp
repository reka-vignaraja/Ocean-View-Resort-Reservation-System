<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Reservation - Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 420px;
    padding: 35px;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(12px);
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.3);
    color: white;
}

.container h2 {
    text-align: center;
    margin-bottom: 25px;
    font-weight: 600;
}

input, select {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 8px;
    border: none;
    outline: none;
    font-size: 14px;
}

input:focus, select:focus {
    box-shadow: 0 0 8px #00c6ff;
}

button {
    width: 100%;
    padding: 12px;
    margin-top: 15px;
    border: none;
    border-radius: 30px;
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s ease;
}

button:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 20px rgba(0,0,0,0.3);
}

label {
    font-size: 14px;
}
.back-btn {
            display: inline-block;
            margin: 40px auto;
            padding: 12px 30px;
            background: #2c5364;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            transition: 0.3s;
        }

        .back-btn:hover {
            background: #203a43;
        }

        .center {
            text-align: center;
        }

</style>
</head>

<body>

<div class="container">
    <h2>🌊 Add New Reservation</h2>

    <form action="AddReservationServlet" method="post">

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
         <a href="index.html" class="back-btn">← Back to Home</a>
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

</body>
</html>