package com.rspm.controller;

import java.io.IOException;
import java.util.List;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.rspm.model.User;
import com.rspm.model.Recipe;
import dao.UserDAO;
import dao.RecipeDAO;

public class ProfileServlet extends HttpServlet {

    private UserDAO userDAO;
    private RecipeDAO recipeDAO;
    private static final int RECORDS_PER_PAGE = 10;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        recipeDAO = new RecipeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            String username = (String) session.getAttribute("username");
            User user = userDAO.getUserByUsername(username);
            request.setAttribute("user", user);

            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            int userId = user.getUserId(); // Assuming User class has getUserId() method
            List<Recipe> recipes = recipeDAO.getRecipesByUserId(userId);

            request.setAttribute("recipes", recipes);
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            String username = (String) session.getAttribute("username");
            String action = request.getParameter("action");

            if ("updateEmail".equals(action)) {
                try {
                    String newEmail = request.getParameter("newEmail");
                    User user = userDAO.getUserByUsername(username);
                    user.setEmail(newEmail);
                    boolean updated = userDAO.updateUserEmail(user);
                    if (updated) {
                        session.setAttribute("successMessage", "Email updated successfully.");
                    } else {
                        session.setAttribute("errorMessage", "Failed to update email.");
                    }
                    response.sendRedirect("profile.jsp");
                } catch (SQLException ex) {
                    Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if ("changePassword".equals(action)) {
                try {
                    String oldPassword = request.getParameter("oldPassword");
                    String newPassword = request.getParameter("newPassword");
                    String confirmPassword = request.getParameter("confirmPassword");

                    User user = userDAO.getUserByUsername(username);

                    if (!newPassword.equals(confirmPassword)) {
                        session.setAttribute("errorMessage", "New password and confirmed password do not match.");
                        response.sendRedirect("profile.jsp");
                        return;
                    }

                    boolean passwordChanged = userDAO.changeUserPassword(username, oldPassword, newPassword);
                    if (passwordChanged) {
                        session.setAttribute("successMessage", "Password updated successfully.");
                    } else {
                        session.setAttribute("errorMessage", "Failed to update password. Please check your old password.");
                    }
                    response.sendRedirect("profile.jsp");
                } catch (SQLException ex) {
                    Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                response.sendRedirect("profile.jsp");
            }
        } else {
            response.sendRedirect("index");
        }
    }
}
