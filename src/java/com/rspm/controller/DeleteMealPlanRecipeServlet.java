package com.rspm.controller;

import dao.MealPlanDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DeleteMealPlanRecipeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mealPlanId = Integer.parseInt(request.getParameter("mealPlanId"));
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));

        MealPlanDAO mealPlanDAO = new MealPlanDAO();
        boolean success = mealPlanDAO.deleteMealPlanRecipe(mealPlanId, recipeId);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"success\":" + success + "}");
        out.flush();
    }
}
