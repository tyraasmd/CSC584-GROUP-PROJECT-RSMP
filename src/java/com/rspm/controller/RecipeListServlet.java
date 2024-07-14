package com.rspm.controller;

import dao.RecipeDAO;
import com.rspm.model.Recipe;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class RecipeListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RecipeDAO recipeDAO = new RecipeDAO();
        List<Recipe> recipes = recipeDAO.getAllRecipes();
        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("browseRecipe.jsp").forward(request, response);
    }
}
