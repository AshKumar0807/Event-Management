<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>

    <%--css--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@include file="normal_navbar.jsp"%>
<main class="d-flex align-items-center banner-background" style="height: 90vh; padding-bottom: 60px;">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header text-center bg-dark text-white">
                        <span class="fa fa-envelope fa-2x"></span>
                        <h3 class="fw-bold mb-2 text-uppercase">Contact Us</h3>
                    </div>

                    <div class="card-body" style="margin-top: 10px;">
                        <form action="contactServlet" method="post" id="contact-form">
                            <div class="form-group">
                                <label for="user_name">Your Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter your name" required>
                            </div>

                            <div class="form-group">
                                <label for="user_email">Email address</label>
                                <input name="user_email" type="email" class="form-control" id="user_email" placeholder="Enter your email" required>
                                <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>

                            <div class="form-group">
                                <label for="subject">Subject</label>
                                <input name="subject" type="text" class="form-control" id="subject" placeholder="Enter subject" required>
                            </div>

                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea name="message" class="form-control" id="message" rows="4" placeholder="Enter your message..." required></textarea>
                            </div>

                            <div class="text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-2x"></span><br>
                                <h4>Please wait...</h4>
                            </div>

                            <div id="submitbtn" class="text-center" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-dark">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%--javascript--%>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>
    $(document).ready(function () {
        console.log("contact form loaded..........");
        $('#contact-form').on('submit', function (event) {
            event.preventDefault();
            let form = new FormData(this);

            $("#submitbtn").hide();
            $("#loader").show();

            // send to contact servlet:
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
                                // Clear the form
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