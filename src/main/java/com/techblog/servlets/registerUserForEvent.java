package com.techblog.servlets;

import com.techblog.dao.RegistrationDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/registerUserForEvent")
public class registerUserForEvent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        String email = request.getParameter("email");
        String name = request.getParameter("name");

        RegistrationDao registrationDao = new RegistrationDao();
        boolean isRegistered = registrationDao.registerUser(postId, email, name);

        if (isRegistered) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}
