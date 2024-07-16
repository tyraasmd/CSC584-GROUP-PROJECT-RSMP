package com.rspm.controller;

import dao.RecipeDAO;
import com.rspm.model.Recipe;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Ensure the user ID is stored in the session

        if (userId != null) {
            RecipeDAO recipeDAO = new RecipeDAO();
            List<Recipe> recipes = recipeDAO.getRecipesByUserId(userId);

            request.setAttribute("recipes", recipes);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    }
}
