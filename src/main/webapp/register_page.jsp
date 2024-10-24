<%--
  Created by IntelliJ IDEA.
  User: ash
  Date: 05/02/23
  Time: 10:29 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eventora - Register</title>
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
            margin-bottom: 2rem;
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

        .form-check-input:checked {
            background-color: var(--raspberry);
            border-color: var(--raspberry);
        }

        #loader {
            color: var(--raspberry);
        }

        .gender-group {
            margin: 1rem 0;
        }

        .gender-group label {
            margin-right: 2rem;
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
                        <span class="fa fa-user-plus fa-3x mb-3"></span>
                        <h2>Create Account</h2>
                        <p class="mb-0">Join our community today</p>
                    </div>

                    <div class="card-body">
                        <form action="registerServlet" method="post" id="reg-form">
                            <div class="form-group">
                                <label for="user_name">Full Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter your name" required>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter your email" required>
                                <small class="text-muted">We'll never share your email with anyone else.</small>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Choose a password" required>
                            </div>

                            <div class="gender-group">
                                <label>Gender</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="male" required>
                                    <label class="form-check-label" for="male">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="female" value="female" required>
                                    <label class="form-check-label" for="female">Female</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="about">About You</label>
                                <textarea name="about" class="form-control" id="about" rows="3" placeholder="Tell us a bit about yourself..."></textarea>
                            </div>

                            <div class="form-check mb-3">
                                <input name="check" type="checkbox" class="form-check-input" id="terms" required>
                                <label class="form-check-label" for="terms">I agree to the terms and conditions</label>
                            </div>

                            <div class="text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-2x"></span>
                                <p>Please wait...</p>
                            </div>

                            <div id="submitbtn">
                                <button type="submit" class="btn btn-primary">Create Account</button>
                            </div>

                            <div class="text-center mt-3">
                                <p class="mb-0">Already have an account? <a href="login_page.jsp" style="color: var(--raspberry);">Login here</a></p>
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
    <script src="js/myjs.js"></script>
    <script>
        $(document).ready(function() {
            $('#reg-form').on('submit', function(event) {
                event.preventDefault();
                let form = new FormData(this);

                $("#submitbtn").hide();
                $("#loader").show();

                $.ajax({
                    url: "registerServlet",
                    type: 'POST',
                    data: form,
                    success: function(data, textStatus, jqXHR) {
                        $("#submitbtn").show();
                        $("#loader").hide();

                        if(data.trim() === "done") {
                            swal("Success!", "Registration completed successfully!", "success")
                            .then((value) => {
                                window.location = "login_page.jsp"
                            });
                        } else {
                            swal("Error!", "Something went wrong. Please try again.", "error");
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        $("#submitbtn").show();
                        $("#loader").hide();
                        swal("Error!", "Something went wrong. Please try again.", "error");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</body>
</html>
