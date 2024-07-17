/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rspm.controller;

import dao.RecipeDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RecipeDAO recipeDAO = new RecipeDAO();
        int totalRecipes = recipeDAO.countTotalRecipes();
        int breakfastRecipes = recipeDAO.countRecipesByCategory("Breakfast");
        int lunchRecipes = recipeDAO.countRecipesByCategory("Lunch");
        int snackRecipes = recipeDAO.countRecipesByCategory("Snacks");
        int dinnerRecipes = recipeDAO.countRecipesByCategory("Dinner");

        request.setAttribute("totalRecipes", totalRecipes);
        request.setAttribute("breakfastRecipes", breakfastRecipes);
        request.setAttribute("lunchRecipes", lunchRecipes);
        request.setAttribute("snackRecipes", snackRecipes);
        request.setAttribute("dinnerRecipes", dinnerRecipes);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
