<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <div class="login-box">
        <h2>Ocean View Resort</h2>
        <p class="subtitle">Staff & Admin Login</p>

        <form action="LoginServlet" method="post">
            <select name="role" required>
                <option value="">-- Select Role --</option>
                <option value="admin">Admin</option>
                <option value="staff">Staff</option>
            </select>

            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>

            <button type="submit">Login</button>
        </form>
        
        <!-- Removed the signup link completely -->
    </div>
</div>

</body>
</html>