<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rooms Management - Ocean View Resort</title>
    <style>
        body { font-family: Arial; background: #f0f2f5; padding: 20px; }
        h2, h3 { text-align: center; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; margin-bottom: 30px; }
        th, td { padding: 12px; border: 1px solid #ccc; text-align: center; }
        th { background-color: #1e3c72; color: white; }
        button { padding: 6px 12px; border: none; border-radius: 5px; cursor: pointer; }
        .edit { background-color: #2c5364; color: white; }
        .delete { background-color: #d9534f; color: white; }
        form.add-room { background: white; padding: 20px; border-radius: 10px; width: 400px; margin: auto; box-shadow: 0 5px 10px rgba(0,0,0,0.1); }
        form.add-room input, form.add-room select { width: 100%; padding: 8px; margin-bottom: 10px; border-radius: 5px; border: 1px solid #ccc; }
        form.add-room button { width: 100%; background-color: #1e3c72; color: white; }
    </style>
</head>
<body>

<h2>All Rooms</h2>

<table>
    <tr>
        <th>Room No</th>
        <th>Room Type</th>
        <th>Price</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_reservation",
                    "root",
                    "" );

        String sql = "SELECT * FROM rooms";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("room_number") %></td>
        <td><%= rs.getString("room_type") %></td>
        <td>LKR <%= rs.getDouble("price") %></td>
        <td><%= rs.getString("status") %></td>
        <td>
            <form action="EditRoomServlet" method="post" style="display:inline;">
                <input type="hidden" name="roomId" value="<%= rs.getInt("room_id") %>">
                <button class="edit">Edit</button>
            </form>
            <form action="DeleteRoomServlet" method="post" style="display:inline;">
                <input type="hidden" name="roomId" value="<%= rs.getInt("room_id") %>">
                <button class="delete">Delete</button>
            </form>
        </td>
    </tr>
<%
        }
    } catch(Exception e) {
        out.println("<tr><td colspan='5' style='color:red;'>Error: "+e.getMessage()+"</td></tr>");
    } finally {
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
%>
</table>

<h3>Add New Room</h3>
<form class="add-room" action="AddRoomServlet" method="post">
    <label>Room Number:</label>
    <input type="text" name="roomNumber" required>
    
    <label>Room Type:</label>
    <input type="text" name="roomType" required>
    
    <label>Price:</label>
    <input type="number" name="price" step="0.01" required>
    
    <label>Status:</label>
    <select name="status">
        <option value="Available">Available</option>
        <option value="Maintenance">Maintenance</option>
    </select>
    
    <button type="submit">Add Room</button>
</form>

</body>
</html>