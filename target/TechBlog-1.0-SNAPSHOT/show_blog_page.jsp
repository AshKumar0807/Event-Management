<%@ page import="com.techblog.entities.User" %>
<%@ page import="com.techblog.entities.post" %>
<%@ page import="com.techblog.dao.postDao" %>
<%@ page import="com.techblog.helper.connectionProvider" %>
<%@ page import="com.techblog.entities.category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="Error_page.jsp" %>
<%--css--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .main-body{
        background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(251,251,251,1) 100%);
    }
</style>

<%--
  Created by IntelliJ IDEA.
  User: ash
  Date: 09/02/23
  Time: 6:30 pm
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user==null)
    {
        response.sendRedirect("login_page.jsp");
    }

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%

    int postId = Integer.parseInt(request.getParameter("post_id"));
    postDao d = new postDao(connectionProvider.connectionProvider());
    post p = d.fetchPost(postId);

%>

<html>
<head>
    <title><%=p.getPtitle()%>></title>
</head>
<body class="main-body">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><img src="blog_pics/log.png" alt="Eventora Logo" style="height: 24px; width: auto; margin-right: 5px;">Eventora</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp"><span class="fa fa-user-plus"></span></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="#" data-toggle="modal" data-target="#do-post-modal"><span class="fa fa-pencil-square-o"></span></span> New Event</a>
                </li>
            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logoutServlet"><span class="fa fa-sign-out"></span>Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2 mt-4">
                <div class="card">
                    <div class="card-header bg-dark text-white text-center">
                        <h2><%=p.getPtitle()%></h2>
                    </div>
                    <div class="card-body">
                        <div class="text-center">
                            <img class="card-img-top" src="blog_pics/<%=p.getPpic()%>" alt="Card image cap" style="margin-bottom: 50px; width: 400px;">
                        </div>
                        <div class="text-right">
                            <%
                                String user_name  = d.getUserName(p.getUserid());
                            %>
                            <p>Posted by <u><b><%=user_name%></b></u>&nbsp &nbsp &nbsp|&nbsp &nbsp &nbsp<i><%=p.getPdate().toLocaleString()%></i></p>
                        </div>
                        <div style="background: #E3F6FF; padding: 20px;">
                            <p><%= p.getPcontent()%></p><br>
                        </div>

                    </div>
                    <div class="bg-dark text-center" style="padding: 20px;">
                        <button class="mt-2 btn btn-outline-success btn-lg" onclick="registerPost(<%= p.getPid() %>, '<%= user.getEmail() %>', '<%= user.getName() %>')">Register</button>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <%--Profile Modal--%>


    <!-- Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-white bg-dark">
                    <h5 class="modal-title" id="profileModalLabel">TechBlog</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">


                        <img class="img-fluid" src="pics/<%= user.getProfile()%>" style="height:200px; border-radius:50%;"><br>
                        <h5><%= user.getName()%></h5>

                        <%--                    Details--%>
                        <div id="profile-detail">
                            <table class="table table-striped">

                                <tbody>
                                <tr>
                                    <th scope="row">ID</th>
                                    <td><%= user.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%= user.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td><%= user.getGender()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">About</th>
                                    <td><%= user.getAbout()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Registered on</th>
                                    <td><%= user.getDateTime()%></td>

                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <%--                    Profile edit--%>
                        <div id="profile-edit" style="display: none">
                            <h3 class="mt-2">Please edit carefully....</h3>
                            <form action="editServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td><input class="form-control" type="password" name="user_password" value="<%= user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td><input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <td>About</td>
                                        <td>
                                            <textarea class="form-control" name="user_about" rows="2"><%= user.getAbout()%></textarea>
                                        </td>
                                    </tr>
                                    <%--                                <tr>--%>
                                    <%--                                    <td>Profile pic</td>--%>
                                    <%--                                    <td>--%>
                                    <%--                                        <input type="file" name="image" class="form-control">--%>
                                    <%--                                    </td>--%>
                                    <%--                                </tr>--%>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>


    <%--End of Profile modal--%>

    <%--post modal--%>


    <!-- Modal -->
    <div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="postModalLabel">New Event</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" action="addPostServlet" method="POST" enctype="multipart/form-data">

                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled>Select category....</option>
                                <%
                                    postDao postd = new postDao(connectionProvider.connectionProvider());
                                    ArrayList<category> list=postd.getAllCategories();
                                    for(category c:list)
                                    {
                                %>
                                <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>

                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" placeholder="Enter Post Title...." name="ptitle">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" placeholder="Enter description...." name="pcontent" style="height: 200px;"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Upload image</label><br>
                            <input class="form-control" type="file" name="pic">
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">Create Event</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%--End of post modal--%>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        $(document).ready(function(){

            let editStatus = false;


            $('#edit-profile-btn').click(function (){

                if(editStatus==false)
                {
                    $("#profile-detail").hide();
                    $("#profile-edit").show();
                    editStatus = true;
                    $(this).text("Back");
                }
                else
                {
                    $("#profile-detail").show();
                    $("#profile-edit").hide();
                    editStatus = false;
                    $(this).text("Edit");
                }
            })
        });
    </script>

    <%--Now add post js--%>
    <script>
        $(document).ready(function (e) {
            //
            $("#add-post-form").on("submit", function (event) {
                //this code gets called when form is submitted....
                event.preventDefault();
                console.log("you have clicked on submit..")
                let form = new FormData(this);
                //now requesting to server
                $.ajax({
                    url: "addPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success ..
                        console.log(data);
                        if (data.trim() == 'done')
                        {
                            swal("Good job!", "saved successfully", "success");
                        } else
                        {
                            swal("Error!!", "Something went wrong try again...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error..
                        swal("Error!!", "Something went wrong try again...", "error");
                    },
                    processData: false,
                    contentType: false
                })
            })
        });

    </script>

    <script>
        function registerPost(postId, userEmail, userName) {
            $.ajax({
                url: "registerUserForEvent",  // Updated servlet URL
                type: "POST",
                data: {
                    postId: postId,
                    email: userEmail,
                    name: userName
                },
                success: function(response) {
                    if (response.trim() === 'success') {
                        alert('Registration successful!');
                    } else {
                        alert('Registration failed!');
                    }
                },
                error: function() {
                    alert('Error during registration!');
                }
            });
            console.log("Post ID:", postId);
            console.log("Email:", userEmail);
            console.log("Name:", userName);

        }
    </script>


</body>
</html>
