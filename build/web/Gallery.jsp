<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort | Gallery</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            background:#f4f7fa;
        }

        /* Navbar */
       /* Navbar */
.navbar {
    position: fixed;      /* ADD THIS */
    top: 0;               /* ADD THIS */
    left: 0;              /* ADD THIS */
    width: 100%;          /* ADD THIS */
    z-index: 1000;        /* ADD THIS */

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
        .header{
            text-align:center;
            padding:60px 20px;
            background:linear-gradient(to right,#203a43,#2c5364);
            color:white;
        }

        .header h1{
            font-size:40px;
        }

        .header p{
            margin-top:10px;
            opacity:0.9;
        }

        /* Gallery Section */
        .gallery{
            padding:60px 40px;
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
            gap:25px;
        }

        .gallery img{
            width:100%;
            height:250px;
            object-fit:cover;
            border-radius:15px;
            transition:0.4s ease;
            cursor:pointer;
            box-shadow:0 10px 25px rgba(0,0,0,0.1);
        }

        .gallery img:hover{
            transform:scale(1.08);
            box-shadow:0 15px 30px rgba(0,0,0,0.2);
        }

        /* Back Button */
        .center{
            text-align:center;
            margin-bottom:40px;
        }

        .back-btn{
            padding:12px 30px;
            background:#2c5364;
            color:white;
            text-decoration:none;
            border-radius:30px;
            transition:0.3s;
        }

        .back-btn:hover{
            background:#203a43;
        }

        /* Mobile */
        @media(max-width:768px){
            .navbar{
                flex-direction:column;
                align-items:flex-start;
            }

            .navbar div{
                flex-direction:column;
                margin-top:10px;
            }
        }

    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h2>🌊 Ocean View Resort</h2>
    <div>
        <a href="index.html">Home</a> <!-- Updated here -->       
        <a href="about.jsp">About</a>
        <a href="rooms.jsp">Rooms</a>
        <a href="contact.jsp">Contact Us</a>
    </div>
</div>

<!-- Header -->
<div class="header">
    <h1>Our Resort Gallery</h1>
    <p>Experience luxury, comfort and breathtaking ocean views</p>
</div>

<!-- Gallery Images -->
<section class="gallery">
    <img src="images/1.jpg" alt="Resort View">
    <img src="images/2.jpg" alt="Swimming Pool">
    <img src="images/3.jpg" alt="Luxury Room">
    <img src="images/4.jpg" alt="Restaurant Area">
    <img src="images/5.jpg" alt="Beach View">
    <img src="images/6.jpg" alt="Night View">
     <img src="images/7.jpg" alt="Night View">
     <img src="images/8.jpg" alt="Night View">
</section>

<div class="center">
    <a href="index.html" class="back-btn">← Back to Home</a>
</div>

</body>
</html>