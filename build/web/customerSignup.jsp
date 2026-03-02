<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Customer Registration</title>

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

        .signup-box {
            background: #ffffff;
            padding: 40px;
            width: 380px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
        }

        .signup-box h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .subtitle {
            margin-bottom: 20px;
            color: #666;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            background: #ff5e62;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #e14b4f;
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
            color: #ff5e62;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="signup-box">

    <h2>Ocean View Resort</h2>
    <p class="subtitle">Customer Registration</p>

    <!-- Error Message -->
    <%
        String msg = request.getParameter("msg");

        if ("password_mismatch".equals(msg)) {
    %>
        <div class="error">Passwords do not match!</div>
    <%
        } else if ("failed".equals(msg)) {
    %>
        <div class="error">Registration failed. Try again!</div>
    <%
        } else if ("error".equals(msg)) {
    %>
        <div class="error">Server error occurred!</div>
    <%
        }
    %>

    <form action="CustomerSignupServlet" method="post">

        <input type="text" name="fullname" placeholder="Full Name" required>

        <input type="text" name="username" placeholder="Username" required>

        <input type="password" name="password" placeholder="Password" required>

        <input type="password" name="confirmPassword" placeholder="Confirm Password" required>

        <button type="submit">Register</button>

    </form>

    <div class="link">
        Already have account? <a href="customerLogin.jsp">Login Here</a>
    </div>

</div>

</body>
</html>