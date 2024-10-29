<%@ page import="com.techblog.entities.Message" %><%--
  Created by IntelliJ IDEA.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eventora - Login</title>
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
    </style>
</head>
<body>
    <%@ include file="normal_navbar.jsp"%>
    <%@ page import="com.techblog.entities.Message" %>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <span class="fa fa-user-circle fa-3x mb-3"></span>
                        <h2>Welcome Back!</h2>
                        <p class="mb-0">Please login to continue</p>
                    </div>

                    <%
                        Message m = (Message)session.getAttribute("msg");
                        if(m!=null) {
                    %>
                        <div class="alert <%=m.getCssClass()%> alert-dismissible fade show" role="alert">
                            <%= m.getContent()%>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <%
                            session.removeAttribute("msg");
                        }
                    %>

                    <div class="card-body">
                        <form action="loginServlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="email" required type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter your email">
                                <small class="text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your password">
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>
                        <div class="text-center mt-3">
                            <p class="mb-0">Don't have an account? <a href="register_page.jsp" style="color: var(--raspberry);">Register here</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/myjs.js"></script>
</body>
</html>