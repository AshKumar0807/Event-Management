<%@ page import="java.sql.Connection" %>
<%@ page import="com.techblog.helper.connectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <%--css--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        h1 {
            font-size: 3rem; /* Adjust font size as needed */
            color: #FFD700; /* Gold color */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Adds depth with a shadow */
            font-family: 'Cursive', 'Comic Sans MS', sans-serif; /* Stylish font */
            margin: 0; /* Remove default margin */
        }

        h2 {
            font-size: 2rem;
            margin-top: 20px;
        }
        p {
            font-size: 1.1rem;
            color: #333;
            line-height: 1.6;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
    </style>
</head>
<body>

<%--navbar--%>
<%@ include file="normal_navbar.jsp"%>

<%--banner--%>
<div class="container-fluid p-0 m-0">
    <div class="jumbotron banner-background">

        <div class="container">
            <h1>Welcome, Friends</h1>
            <h2>College Events Hub</h2>
            <p>Welcome to the College Events Hub, your go-to platform for all things related to campus activities and events!</p>

            <p>At our college, we believe that student life extends beyond the classroom. Our events provide opportunities to connect, learn, and grow, fostering a vibrant community on campus. Whether you’re looking for academic workshops, cultural festivals, or social gatherings, we’ve got you covered.</p>

            <h2>What We Offer</h2>
            <p>Our event management team organizes a wide range of activities designed to engage and inspire students. From guest lectures by industry professionals to fun-filled social events, there’s something for everyone.</p>

            <h3>Explore our diverse events:</h3>
            <ul style="background: #e7f3fe; margin: 10px 0;
            padding: 10px;
            border-left: 5px solid #4A90E2;">
                <li><strong>Workshops and Seminars</strong>: Enhance your skills and knowledge with sessions led by experts.</li>
                <li><strong>Cultural Celebrations</strong>: Experience the richness of our diverse community through festivals and performances.</li>
                <li><strong>Networking Opportunities</strong>: Connect with peers, alumni, and professionals at our events.</li>
                <li><strong>Social Gatherings</strong>: Join us for fun events to make lasting memories with friends.</li>
            </ul>

            <p>Get ready to dive into an exciting world of events and activities that will enrich your college experience!</p>

            <a href="register_page.jsp" class="btn btn-dark btn-lg" style="margin-bottom: 50px; color: white;"><span class="fa fa-external-link"></span> Start! it's free</a>
            <a href="login_page.jsp" class="btn btn-dark btn-lg" style="margin-bottom: 50px; color: white;"><span class="fa fa-user-circle fa-spin"></span> Login</a>
        </div>
    </div>
</div>

<%--javascript--%>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>

</html>