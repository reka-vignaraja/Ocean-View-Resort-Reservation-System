<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us - Ocean View Resort</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body{
    margin:0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background:#f4f9ff;
    padding-top: 90px; 
}

/* Navbar */
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
    box-sizing: border-box;
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
/* Push content */
.container{
    margin-top:120px;
    padding:40px 60px;
}

/* Hero Section */
.hero{
    text-align:center;
    margin-bottom:50px;
}

.hero h1{
    font-size:40px;
    color:#2c5364;
}

.hero p{
    color:#555;
}

/* Layout */
.contact-wrapper{
    display:flex;
    flex-wrap:wrap;
    gap:40px;
}

/* Contact Form */
.contact-form{
    flex:1;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
}

.contact-form h2{
    margin-bottom:20px;
    color:#2c5364;
}

.contact-form input,
.contact-form textarea{
    width:100%;
    padding:12px;
    margin-bottom:15px;
    border-radius:8px;
    border:1px solid #ccc;
    font-size:15px;
}

.contact-form input:focus,
.contact-form textarea:focus{
    outline:none;
    border-color:#00c6ff;
    box-shadow:0 0 5px rgba(0,198,255,0.5);
}

.contact-form button{
    background:linear-gradient(135deg,#00c6ff,#0072ff);
    border:none;
    padding:12px 25px;
    color:white;
    border-radius:30px;
    cursor:pointer;
    font-size:16px;
    transition:0.3s;
}

.contact-form button:hover{
    transform:scale(1.05);
}

/* Contact Info */
.contact-info{
    flex:1;
}

.info-card{
    background:white;
    padding:20px;
    margin-bottom:20px;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
    transition:0.3s;
}

.info-card:hover{
    transform:translateY(-5px);
}

.info-card h3{
    margin:0 0 10px 0;
    color:#0072ff;
}

/* Map */
.map{
    margin-top:40px;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
}

/* Responsive */
@media(max-width:768px){
    .contact-wrapper{
        flex-direction:column;
    }
}
</style>
</head>

<body>

<div class="navbar">
    <h2>🌊 Ocean View Resort</h2>
    <div>
        <a href="index.html">Home</a>
        <a href="about.jsp">About</a>
        <a href="availableRooms.jsp">Rooms</a>
        <a href="contact.jsp">Contact Us</a>
    </div>
</div>

<div class="container">

    <div class="hero">
        <h1>Contact Us</h1>
        <p>We would love to hear from you. Reach out for reservations, inquiries, or support.</p>
    </div>

    <div class="contact-wrapper">

        <!-- Contact Form -->
        <div class="contact-form">
            <h2>Send a Message</h2>
            <form action="ContactServlet" method="post">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <input type="text" name="subject" placeholder="Subject">
                <textarea rows="5" name="message" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>

        <!-- Contact Info -->
        <div class="contact-info">
            <div class="info-card">
                <h3>📍 Address</h3>
                <p>123 Beach Road, Colombo, Sri Lanka</p>
            </div>

            <div class="info-card">
                <h3>📞 Phone</h3>
                <p>+94 77 123 4567</p>
            </div>

            <div class="info-card">
                <h3>📧 Email</h3>
                <p>info@oceanviewresort.com</p>
            </div>
        </div>

    </div>

    <!-- Google Map -->
    <div class="map">
        <iframe 
            src="https://maps.google.com/maps?q=colombo&t=&z=13&ie=UTF8&iwloc=&output=embed"
            width="100%" height="300" frameborder="0" style="border:0;" allowfullscreen="">
        </iframe>
    </div>

</div>

</body>
</html>