<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.UserDAO" %>
<%@ page import="com.oceanview.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Admin session check
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String search = request.getParameter("search");
    UserDAO dao = new UserDAO();
    List<User> users = dao.getUsers(search);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users | Ocean View Resort</title>
    <style>
        body { font-family: Arial; background:#f4f6f9; margin:0; }
        h2 { text-align:center; margin-top:20px; }
        .top-bar { text-align:center; margin:20px; }
        input[type=text]{padding:5px;width:200px;}
        .btn{padding:5px 10px;border:none;border-radius:4px;cursor:pointer;}
        .add-btn{background:green;color:white;}
        .edit-btn{background:#0072b1;color:white;}
        .delete-btn{background:red;color:white;}
        table{width:95%;margin:20px auto;border-collapse:collapse;background:white;}
        th,td{padding:10px;border:1px solid #ddd;text-align:center;}
        th{background:#003366;color:white;}
        tr:hover{background:#f1f1f1;}
        #userFormContainer{display:none;position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.5);}
        #userFormBox{background:white;width:400px;margin:100px auto;padding:20px;border-radius:8px;position:relative;}
        #userFormBox h3{margin-bottom:10px;}
        #userFormBox input, #userFormBox select{width:100%;padding:8px;margin:5px 0;}
        #closeForm{position:absolute;top:10px;right:10px;cursor:pointer;color:red;font-weight:bold;}
    </style>

    <script>
        function showAddForm() {
            document.getElementById('userFormContainer').style.display='block';
            document.getElementById('formTitle').innerText = "Add User";
            document.getElementById('userId').value = "";
            document.getElementById('fullname').value = "";
            document.getElementById('username').value = "";
            document.getElementById('email').value = "";
            document.getElementById('role').value = "customer";
        }

        function showEditForm(id, fullname, username, email, role){
            document.getElementById('userFormContainer').style.display='block';
            document.getElementById('formTitle').innerText = "Edit User";
            document.getElementById('userId').value = id;
            document.getElementById('fullname').value = fullname;
            document.getElementById('username').value = username;
            document.getElementById('email').value = email;
            document.getElementById('role').value = role;
        }

        function hideForm() {
            document.getElementById('userFormContainer').style.display='none';
        }
    </script>
</head>

<body>

<h2>Manage Users</h2>

<div class="top-bar">
    <form method="get" style="display:inline;">
        <input type="text" name="search" placeholder="Search by name or username" value="<%= search != null ? search : "" %>">
        <button type="submit" class="btn">Search</button>
    </form>
    <button onclick="showAddForm()" class="btn add-btn">Add User</button>
</div>

<table>
<tr>
<th>ID</th>
<th>Full Name</th>
<th>Username</th>
<th>Email</th>
<th>Role</th>
<th>Created At</th>
<th>Action</th>
</tr>

<% for(User user : users){ %>
<tr>
<td><%= user.getId() %></td>
<td><%= user.getFullname() %></td>
<td><%= user.getUsername() %></td>
<td><%= user.getEmail() %></td>
<td>
<%
    String role = user.getRole();
    if("admin".equalsIgnoreCase(role)){%>
        <span style="color:green;font-weight:bold;">Admin</span>
<% } else if("staff".equalsIgnoreCase(role)){ %>
        <span style="color:orange;font-weight:bold;">Staff</span>
<% } else { %>
        <span style="color:#0072b1;font-weight:bold;">Customer</span>
<% } %>
</td>
<td><%= user.getCreatedAt() %></td>
<td>
<button class="btn edit-btn" onclick="showEditForm('<%=user.getId()%>','<%=user.getFullname()%>','<%=user.getUsername()%>','<%=user.getEmail()%>','<%=role%>')">Edit</button>
<form action="DeleteUserServlet" method="post" style="display:inline;" onsubmit="return confirm('Delete this user?');">
<input type="hidden" name="id" value="<%= user.getId() %>">
<button type="submit" class="btn delete-btn">Delete</button>
</form>
</td>
</tr>
<% } %>
</table>

<!-- Add/Edit Form Popup -->
<div id="userFormContainer">
<div id="userFormBox">
    <span id="closeForm" onclick="hideForm()">X</span>
    <h3 id="formTitle">Add/Edit User</h3>
    <form action="AddUsersServlet" method="post">
        <input type="hidden" name="id" id="userId">
        <input type="text" name="fullname" id="fullname" placeholder="Full Name" required>
        <input type="text" name="username" id="username" placeholder="Username" required>
        <input type="email" name="email" id="email" placeholder="Email" required>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <select name="role" id="role">
            <option value="admin">Admin</option>
            <option value="staff">Staff</option>
            <option value="customer">Customer</option>
        </select>
        <br><br>
        <button type="submit" class="btn add-btn">Save</button>
        <button type="button" class="btn" onclick="hideForm()">Cancel</button>
    </form>
</div>
</div>

</body>
</html>