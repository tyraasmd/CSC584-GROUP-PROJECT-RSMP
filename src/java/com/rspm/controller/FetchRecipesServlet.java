package com.rspm.controller;

import dao.RecipeDAO;
import com.rspm.model.Recipe;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FetchRecipesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId"); // Assumes userId is stored in session

        RecipeDAO recipeDAO = new RecipeDAO();
        List<Recipe> recipes = recipeDAO.getRecipesByUserId(userId);

        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
