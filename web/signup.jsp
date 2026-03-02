<!--  <!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Staff Registration</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <div class="login-box">
        <h2>Ocean View Resort</h2>
        <p class="subtitle">Staff Registration</p>

        <form action="SignupServlet" method="post">
            <input type="text" name="fullname" placeholder="Full Name" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" required>

            <button type="submit">Register</button>
        </form>

        <p class="link">
            Already registered? <a href="login.jsp">Login here</a>
        </p>
    </div>
</div>

<!-- Popup messages based on URL parameter -->
<script>
    // Get URL parameters
    const params = new URLSearchParams(window.location.search);
    const msg = params.get('msg');

    if(msg === 'success') {
        alert('Registration Successful! You can now login.');
    } else if(msg === 'password_mismatch') {
        alert('Passwords do not match. Please try again.');
    } else if(msg === 'failed') {
        alert('Registration failed. Please try again.');
    } else if(msg === 'error') {
        alert('An error occurred. Please contact admin.');
    }
</script>

</body>
</html>  -->
