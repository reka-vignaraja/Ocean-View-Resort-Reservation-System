<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Help</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        * {margin:0; padding:0; box-sizing:border-box; font-family:'Poppins', sans-serif;}
        body {
            min-height:100vh;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color:white;
        }

      .navbar {
    position: fixed;      
    top: 0;             
    left: 0;              
    width: 100%;          
    z-index: 1000;        

    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 60px;
    background: #2c5364;
}

/* Prevent content going under navbar */
body {
    margin: 0;
    padding-top: 90px;   /* IMPORTANT - Adjust based on navbar height */
}

.navbar h2 {
    color: white;
    margin: 0;          /* small alignment fix */
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    transition: 0.3s;
}

.navbar a:hover {
    color: #00c6ff;
}


        .help-container {
            max-width:900px;
            margin:50px auto;
            padding:20px;
        }

        h1 {text-align:center; margin-bottom:30px; font-size:36px; color:#00c6ff;}
        h2 {margin-bottom:15px; color:#00c6ff;}
        p {margin-bottom:15px; line-height:1.5;}

        /* Collapsible FAQ */
        .faq {
            background: rgba(255,255,255,0.1);
            border-radius:10px;
            margin-bottom:10px;
            cursor:pointer;
            padding:15px 20px;
            transition:0.3s;
        }
        .faq:hover {background: rgba(0,198,255,0.2);}
        .faq.active {background: rgba(0,198,255,0.3);}
        .faq-content {
            display:none;
            padding: 0 20px 15px 20px;
            font-size: 15px;
            color: #fff;
        }

        /* Responsive */
        @media(max-width:768px){
            .navbar {flex-direction:column; align-items:flex-start;}
            .navbar a {margin:10px 0 0 0;}
            .help-container {padding:10px;}
        }
    </style>
</head>
<body>

<div class="navbar">
    <h2>🌊 Ocean View Resort</h2>
    <div>
        <a href="index.html">Home</a>
        <a href="about.jsp">About</a>
        <a href="rooms.jsp">Rooms</a>
        <a href="contact.jsp">Contact Us</a>
    </div>
</div>

<div class="help-container">
    <h1>Help & Support</h1>

    <div class="faq">1. Logging In</div>
    <div class="faq-content">
        <p>Select your role (Admin or Staff), enter your username and password, then click Login. Admins access admin dashboard, staff access staff dashboard.</p>
        <p>Common issue: Login failed? Check username, password, and role.</p>
    </div>

    <div class="faq">2. Adding a New Reservation</div>
    <div class="faq-content">
        <p>Go to "Add New Reservation" page, fill guest details (name, address, contact number, room type, check-in/out dates), and click Save. Reservation number is generated automatically.</p>
    </div>

    <div class="faq">3. Viewing Reservations</div>
    <div class="faq-content">
        <p>You can search by reservation number, guest name, or room type. Click the reservation to view full details.</p>
    </div>

    <div class="faq">4. Calculating & Printing Bills</div>
    <div class="faq-content">
        <p>Select the reservation, click "Calculate Bill" to see total cost. You can print or save the bill.</p>
    </div>

    <div class="faq">5. Editing / Cancelling Reservations</div>
    <div class="faq-content">
        <p>Admins or staff can edit guest info or cancel reservations. Deleted reservations cannot be recovered.</p>
    </div>

    <div class="faq">6. User Management (Admins Only)</div>
    <div class="faq-content">
        <p>Admins can add new staff accounts, view staff details, and assign roles.</p>
    </div>

    <div class="faq">7. FAQ & Troubleshooting</div>
    <div class="faq-content">
        <p>Login failed → check username, password, role.<br>
        Reservation conflict → verify room availability.<br>
        Contact tech support if system errors occur.</p>
    </div>
</div>

<script>
    const faqs = document.querySelectorAll(".faq");
    faqs.forEach(faq => {
        faq.addEventListener("click", () => {
            faq.classList.toggle("active");
            const content = faq.nextElementSibling;
            content.style.display = content.style.display === "block" ? "none" : "block";
        });
    });
</script>

</body>
</html>