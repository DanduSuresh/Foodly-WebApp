package com.tap.servlet;

import java.io.IOException;

import com.tap.daoImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("userName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        String role = req.getParameter("role");

        User user = new User(username, email, phone, password, address, role);

        UserDaoImpl dao = new UserDaoImpl();
        dao.addUser(user);

        resp.sendRedirect("login.jsp");
    }
}
