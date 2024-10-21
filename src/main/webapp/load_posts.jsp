<%@ page import="com.techblog.dao.postDao" %>
<%@ page import="com.techblog.helper.connectionProvider" %>
<%@ page import="com.techblog.entities.post" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.techblog.entities.User" %>

<div class="row">


<%

    Thread.sleep(1000); // for showing the spin loader

    postDao d = new postDao(connectionProvider.connectionProvider());
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<post> posts = null;
    if(cid==0)
    {
        posts=d.getAllPosts();
    }
    else
    {
        posts=d.getPostByCatId(cid);
    }
    if (posts.size()==0)
    {
        PrintWriter outp = response.getWriter();
        outp.println("<h5 class='display-3 text-center' style='margin-top:200px;'>No Upcoming Events!</h5>");
        return;
    }
    for(post p: posts)
    {
%>
<div class="col-md-6 mt-2">

    <div class="card" >
        <img class="card-img-top" src="blog_pics/<%=p.getPpic()%>" alt="<%=p.getPpic()%>">
        <div class="card-body">
            <b><%=p.getPtitle()%></b>
            <p><%= p.getPcontent()%></p>
        </div>
        <div class="card-footer text-center bg-dark">
            <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="mt-2 btn btn-outline-light btn-sm">Read More..</a>
        </div>
    </div>
</div>
<%
    }
%>

</div>