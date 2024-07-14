package com.rspm.controller;

import com.rspm.model.Recipe;
import dao.RecipeDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RecipeDescriptionServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(RecipeDescriptionServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recipeIdStr = request.getParameter("recipeId");
        if (recipeIdStr == null || recipeIdStr.isEmpty()) {
            logger.log(Level.SEVERE, "Recipe ID is missing");
            response.sendRedirect("error.jsp"); // Handle error gracefully
            return;
        }

        try {
            int recipeId = Integer.parseInt(recipeIdStr);
            RecipeDAO recipeDAO = new RecipeDAO();
            Recipe recipe = recipeDAO.getRecipeById(recipeId);
            if (recipe != null) {
                request.setAttribute("recipe", recipe);
                request.getRequestDispatcher("recipeDescription.jsp").forward(request, response);
            } else {
                logger.log(Level.SEVERE, "Recipe not found for ID: " + recipeId);
                response.sendRedirect("error.jsp"); // Handle error gracefully
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid Recipe ID format: " + recipeIdStr, e);
            response.sendRedirect("error.jsp"); // Handle error gracefully
        }
    }
}
