package com.rspm.controller;

import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LOGGER.log(Level.INFO, "Attempting to login with username: {0}", username);

        if (userDAO.validateUser(username, password)) {
            int userId = userDAO.getUserIdByUsername(username);

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("userId", userId); // Set userId in session

            LOGGER.log(Level.INFO, "Login successful for username: {0}, userId: {1}", new Object[]{username, userId});
            response.sendRedirect("index.jsp"); // Redirect to index.jsp
        } else {
            LOGGER.log(Level.WARNING, "Login failed for username: {0}", username);
            response.sendRedirect("loginV3.jsp?error=1");
        }
    }
}
