<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Customer Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
        min-height: 100vh;
        background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
        display: flex;
        justify-content: center;
        align-items: center;
        }

        .login-container {
            background: white;
            padding: 40px;
            width: 350px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
        }

        h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .subtitle {
            margin-bottom: 25px;
            color: #777;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #2193b0;
            color: white;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #176d85;
        }

        .error {
            color: red;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .success {
            color: green;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .link {
            margin-top: 15px;
            font-size: 14px;
        }

        .link a {
            color: #2193b0;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="login-container">

    <h2>Ocean View Resort</h2>
    <p class="subtitle">Customer Login</p>

    <!-- Success Message After Registration -->
    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
        <div class="success">Registration successful! Please login.</div>
    <%
        }
    %>

    <!-- Error Message -->
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>

    <form action="LoginServlet" method="post">

        <!-- Hidden Role Field -->
        <input type="hidden" name="role" value="customer">

        <input type="text" name="username" placeholder="Enter Username" required>

        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>

    </form>

    <div class="link">
        New Customer? <a href="customerSignup.jsp">Create Account</a>
    </div>

</div>

</body>
</html>