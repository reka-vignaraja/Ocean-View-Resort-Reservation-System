<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Features</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f4f7fa;
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

        /* Header */
        .header {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(to right, #203a43, #2c5364);
            color: white;
        }

        .header h1 {
            font-size: 42px;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 18px;
            opacity: 0.9;
        }

        /* Features Section */
        .features-section, .amenities-section {
            padding: 70px 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .feature-card, .amenity-card {
            background: white;
            width: 280px;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            transition: 0.3s ease;
            text-align: center;
        }

        .feature-card:hover, .amenity-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .feature-card h3, .amenity-card h3 {
            color: #0072ff;
            margin-bottom: 10px;
        }

        .feature-card p, .amenity-card p {
            font-size: 14px;
            color: #555;
        }

        .amenity-card span {
            font-size: 40px;
            display: block;
            margin-bottom: 15px;
        }

        /* Back Button */
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

        /* Responsive */
        @media(max-width: 768px){
            .header h1 {
                font-size: 28px;
            }

            .features-section, .amenities-section {
                flex-direction: column;
                align-items: center;
            }
        }

    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h2>🌊 Ocean View Resort</h2>
    <div>
        <a href="index.html">Home</a>
        <a href="about.jsp">About</a>
        <a href="rooms.jsp">Rooms</a>
        <a href="contact.jsp">Contact Us</a>
    </div>
</div>

<!-- Header -->
<div class="header">
    <h1>Resort Amenities</h1>
    <p>Enjoy our world-class facilities during your stay</p>
</div>

<!-- Amenities Cards -->
<section class="amenities-section">

    <div class="amenity-card">
        <span>🏊</span>
        <h3>Swimming Pool</h3>
        <p>Relax and enjoy our outdoor swimming pool with ocean view.</p>
    </div>

    <div class="amenity-card">
        <span>🍽</span>
        <h3>Restaurant</h3>
        <p>Savor delicious meals at our in-house restaurant.</p>
    </div>

    <div class="amenity-card">
        <span>🚗</span>
        <h3>Free Parking</h3>
        <p>Ample parking space available for all guests.</p>
    </div>

    <div class="amenity-card">
        <span>📶</span>
        <h3>Free WiFi</h3>
        <p>Stay connected with high-speed wireless internet throughout the resort.</p>
    </div>

    <div class="amenity-card">
        <span>🏖</span>
        <h3>Beach Access</h3>
        <p>Enjoy direct access to our private beach area.</p>
    </div>

    <div class="amenity-card">
        <span>🧺</span>
        <h3>Laundry Service</h3>
        <p>Convenient and fast laundry service available for all guests.</p>
    </div>

</section>

<div class="center">
    <a href="index.html" class="back-btn">← Back to Home</a>
</div>

</body>
</html>