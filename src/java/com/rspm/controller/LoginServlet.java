package com.rspm.controller;

import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (userDAO.validateUser(username, password)) {
            int userId = userDAO.getUserIdByUsername(username);

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("userId", userId); // Set userId in session
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("loginV3.jsp?error=1");
        }
    }
}
