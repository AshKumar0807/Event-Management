<!DOCTYPE html>
<html>
<head>
    <title>Eventora - Campus Events Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        :root {
            --english-violet: #413c58;
            --raspberry: #d81e5b;
            --vermilion: #f0544f;
            --ash-gray: #c6d8d3;
            --papaya-whip: #fdf0d5;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--papaya-whip);
            color: var(--english-violet);
        }

        .navbar {
            background-color: var(--english-violet);
            padding: 1rem 2rem;
        }

        .navbar-brand, .nav-link {
            color: var(--papaya-whip) !important;
        }

        .hero-section {
            background: linear-gradient(135deg, var(--english-violet), var(--raspberry));
            padding: 4rem 0;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .main-title {
            font-size: 4rem;
            font-weight: bold;
            color: var(--papaya-whip);
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 2rem;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background-color: var(--english-violet);
            color: var(--papaya-whip);
            font-weight: bold;
            padding: 1.5rem;
            border-bottom: none;
        }

        .card-body {
            padding: 2rem;
            background-color: white;
        }

        .welcome-card {
            border-left: 5px solid var(--raspberry);
        }

        .events-card {
            border-left: 5px solid var(--vermilion);
        }

        .explore-card {
            border-left: 5px solid var(--english-violet);
        }

        .event-item {
            background-color: var(--ash-gray);
            padding: 1rem;
            margin: 0.5rem 0;
            border-radius: 10px;
            transition: transform 0.2s ease;
        }

        .event-item:hover {
            transform: scale(1.02);
        }

        .btn-primary {
            background-color: var(--raspberry);
            border: none;
            padding: 0.8rem 2rem;
            margin-right: 1rem;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: var(--vermilion);
            transform: scale(1.05);
        }

        .cta-section {
            margin-top: 2rem;
            text-align: center;
        }

        .icon-feature {
            font-size: 2rem;
            color: var(--raspberry);
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <%@ include file="normal_navbar.jsp"%>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1 class="main-title">Eventora</h1>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container py-5">
        <!-- Welcome Card -->
        <div class="card welcome-card">
            <div class="card-header">
                <i class="fa fa-star icon-feature"></i>
                Welcome to Eventora
            </div>
            <div class="card-body">
                <p class="lead">Your go-to platform for all things related to campus activities and events!</p>
                <p>At our college, we believe that student life extends beyond the classroom. Our events provide opportunities to connect, learn, and grow, fostering a vibrant community on campus. Whether you're looking for academic workshops, cultural festivals, or social gatherings, we've got you covered.</p>
            </div>
        </div>

        <!-- What We Offer Card -->
        <div class="card events-card">
            <div class="card-header">
                <i class="fa fa-calendar icon-feature"></i>
                What We Offer
            </div>
            <div class="card-body">
                <p>Our event management team organizes a wide range of activities designed to engage and inspire students. From guest lectures by industry professionals to fun-filled social events, there's something for everyone.</p>

                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="event-item">
                            <i class="fa fa-laptop me-2"></i>
                            <strong>Workshops and Seminars</strong>
                            <p class="mb-0">Enhance your skills and knowledge with sessions led by experts.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="event-item">
                            <i class="fa fa-music me-2"></i>
                            <strong>Cultural Celebrations</strong>
                            <p class="mb-0">Experience the richness of our diverse community through festivals and performances.</p>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <div class="event-item">
                            <i class="fa fa-handshake-o me-2"></i>
                            <strong>Networking Opportunities</strong>
                            <p class="mb-0">Connect with peers, alumni, and professionals at our events.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="event-item">
                            <i class="fa fa-users me-2"></i>
                            <strong>Social Gatherings</strong>
                            <p class="mb-0">Join us for fun events to make lasting memories with friends.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Explore Card -->
        <div class="card explore-card">
            <div class="card-header">
                <i class="fa fa-compass icon-feature"></i>
                Ready to Explore?
            </div>
            <div class="card-body text-center">
                <p class="lead">Get ready to dive into an exciting world of events and activities that will enrich your college experience!</p>
                <div class="cta-section">
                    <a href="register_page.jsp" class="btn btn-primary btn-lg">
                        <span class="fa fa-external-link"></span> Start! it's free
                    </a>
                    <a href="login_page.jsp" class="btn btn-outline-dark btn-lg">
                        <span class="fa fa-user-circle fa-spin"></span> Login
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>