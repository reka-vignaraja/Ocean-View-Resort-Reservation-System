<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <title>About Us - Ocean View Resort</title>
         
         <style>
    /* ===== Inline CSS Styling ===== */

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        color: #333;
        line-height: 1.6;
        margin: 0;
        padding: 0;
    }

    .about-container {
    max-width: 1200px;
    margin: 100px auto 0 auto;   /* Push content below navbar */
    padding: 40px 20px;
}

    /* Sections */
    .about-section, .mission-section, .team-section, .gallery-section {
        background: #fff;
        margin-bottom: 40px;
        padding: 30px 20px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        text-align: center;
    }

    .about-section h1 {
        color: #0072ff;
        font-size: 36px;
        margin-bottom: 15px;
    }

    .mission-section h2, .team-section h2, .gallery-section h2 {
        color: #ff7f50;
        font-size: 28px;
        margin-bottom: 15px;
    }

    /* Team Section */
    .team-members {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
        margin-top: 20px;
    }

    .member {
        background: #f0f8ff;
        border-radius: 12px;
        padding: 20px;
        width: 220px;
        transition: transform 0.3s;
    }

    .member:hover {
        transform: translateY(-10px);
    }

    .member img {
        width: 100%;
        border-radius: 50%;
        margin-bottom: 10px;
    }

    .member h3 {
        color: #0072ff;
        margin: 5px 0;
    }

    .member p {
        color: #555;
    }
/* ===== Fixed Navbar ===== */

.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 70px;
    background: rgba(0,0,0,0.4);
    backdrop-filter: blur(10px);  
    display: flex;
    align-items: center;      /* Vertical center */
    justify-content: space-between; /* Space between logo & links */
    padding: 0 50px;
    box-sizing: border-box;
    z-index: 1000;
}

/* Navbar Title */
.navbar h2 {
    color: white;
    margin: 0;
    font-size: 22px;
}

/* Nav Links Container */
.nav-links {
    display: flex;
    align-items: center;
    gap: 30px;   /* Space between links */
}

/* Individual Links */
.nav-links a {
    text-decoration: none;
    color: white;
    font-size: 16px;
    font-weight: 500;
    transition: 0.3s;
}

/* Hover Effect */
.nav-links a:hover {
    color: #ffd700;
}
/* Gallery Section */
    .gallery {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 15px;
        margin-top: 20px;
    }

    .gallery img {
    width: 100%;
    height: 250px;          /* Fixed same height */
    object-fit: cover;      /* Prevent stretching */
    border-radius: 12px;
    transition: transform 0.3s, box-shadow 0.3s;
}

    .gallery img:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    /* Call to Action */
    .cta-section {
        text-align: center;
        margin: 30px 0;
    }

    .btn-book {
        display: inline-block;
        background: linear-gradient(135deg, #0072ff, #00c6ff);
        color: #fff;
        padding: 15px 40px;
        font-size: 18px;
        border-radius: 50px;
        text-decoration: none;
        transition: background 0.3s, transform 0.3s;
    }

    .btn-book:hover {
        background: linear-gradient(135deg, #00c6ff, #0072ff);
        transform: scale(1.05);
    }

    /* Responsive */
    @media (max-width: 768px) {
        .team-members {
            flex-direction: column;
            align-items: center;
        }
    }
    </style>
    </head>
    <body>
        <div class="navbar">
        <h2>🌊 Ocean View Resort</h2>

        <div class="nav-links">
            <a href="index.html">Home</a>
            <a href="about.jsp">About</a>
            <a href="availableRooms.jsp">Rooms</a>
            <a href="contact.jsp">Contact Us</a>

        </div>
    </div>
        <div class="about-container">

        <!-- About Section -->
        <section class="about-section">
            <h1>Welcome to Ocean View Resort</h1>
            <p>Experience the perfect blend of comfort, luxury, and nature at Ocean View Resort. Our goal is to make every stay memorable with our exquisite rooms and world-class amenities.</p>
        </section>

        <!-- Mission Section -->
        <section class="mission-section">
            <h2>Our Mission</h2>
            <p>To provide exceptional hospitality and unforgettable experiences for every guest, combining luxury, comfort, and personalized service.</p>
        </section>

        <!-- Team Section -->
        <section class="team-section">
            <h2>Meet Our Team</h2>
            <div class="team-members">
                <div class="member">
                    <img src="images/manager.jpg" alt="Manager">
                    <h3>John Doe</h3>
                    <p>General Manager</p>
                </div>
                <div class="member">
                    <img src="images/chef.jpg" alt="Chef">
                    <h3>Jane Smith</h3>
                    <p>Head Chef</p>
                </div>
                <div class="member">
                    <img src="images/Staff1.jpg" alt="Staff">
                    <h3>Mark Lee</h3>
                    <p>Front Desk</p>
                </div>
            </div>
        </section>

        <!-- Gallery Section -->
        <section class="gallery-section">
            <h2>Gallery</h2>
            <div class="gallery">
                <img src="images/room1.jpg" alt="Room 1">
                <img src="images/room2.jpg" alt="Room 2">
                <img src="images/room3.jpg" alt="Pool">
                <img src="images/room4.jpg" alt="Restaurant">
            </div>
        </section>

        <!-- Call to Action -->
        <div class="cta-section">
            <a href="customerLogin.jsp" class="btn-book">Book Your Stay</a>
        </div>
    </div>


</body>
    </body>
</html>
