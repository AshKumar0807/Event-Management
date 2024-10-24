<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eventora - Contact Us</title>
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

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            background-color: var(--english-violet);
            color: var(--papaya-whip);
            border-radius: 15px 15px 0 0 !important;
            padding: 2rem;
            text-align: center;
        }

        .card-body {
            padding: 2rem;
            background-color: white;
            border-radius: 0 0 15px 15px;
        }

        .btn-primary {
            background-color: var(--raspberry);
            border: none;
            padding: 0.8rem 2rem;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 1rem;
        }

        .btn-primary:hover {
            background-color: var(--vermilion);
            transform: scale(1.02);
        }

        .form-control {
            padding: 0.8rem;
            border-radius: 8px;
            border: 1px solid var(--ash-gray);
            margin-bottom: 1rem;
        }

        .form-control:focus {
            border-color: var(--raspberry);
            box-shadow: 0 0 0 0.2rem rgba(216, 30, 91, 0.25);
        }

        #loader {
            color: var(--raspberry);
        }

        .alert {
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        textarea.form-control {
            min-height: 120px;
        }
    </style>
</head>
<body>
    <%@include file="normal_navbar.jsp"%>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <span class="fa fa-envelope fa-3x mb-3"></span>
                        <h2>Contact Us</h2>
                        <p class="mb-0">We'd love to hear from you!</p>
                    </div>

                    <div class="card-body">
                        <form action="contactServlet" method="post" id="contact-form">
                            <div class="form-group">
                                <label for="user_name">Your Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter your name" required>
                            </div>

                            <div class="form-group">
                                <label for="user_email">Email address</label>
                                <input name="user_email" type="email" class="form-control" id="user_email" placeholder="Enter your email" required>
                                <small class="text-muted">We'll never share your email with anyone else.</small>
                            </div>

                            <div class="form-group">
                                <label for="subject">Subject</label>
                                <input name="subject" type="text" class="form-control" id="subject" placeholder="Enter subject" required>
                            </div>

                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea name="message" class="form-control" id="message" placeholder="Enter your message..." required></textarea>
                            </div>

                            <div class="text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-2x"></span>
                                <p class="mt-2">Please wait...</p>
                            </div>

                            <div id="submitbtn">
                                <button type="submit" class="btn btn-primary">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <script>
        $(document).ready(function () {
            console.log("contact form loaded..........");
            $('#contact-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);

                $("#submitbtn").hide();
                $("#loader").show();

                $.ajax({
                    url: "contactServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data)
                        $("#submitbtn").show();
                        $("#loader").hide();
                        if (data.trim() === "done") {
                            swal("Message sent successfully!", "We'll get back to you soon.", "success")
                                .then((value) => {
                                    $('#contact-form')[0].reset();
                                });
                        } else {
                            $("#submitbtn").show();
                            $("#loader").hide();
                            swal("Something went wrong!", "Please try again...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $("#submitbtn").show();
                        $("#loader").hide();
                        swal("Something went wrong!", "Please try again...", "error");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</body>
</html>