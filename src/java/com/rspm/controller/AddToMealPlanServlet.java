package com.rspm.controller;

import dao.MealPlanDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddToMealPlanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int userId = (Integer) request.getSession().getAttribute("userId");  // Assuming user is logged in and userId is in session
            String recipeIdStr = request.getParameter("recipeId");
            String mealCategory = request.getParameter("mealCategory");
            String mealDate = request.getParameter("mealDate");

            // If recipeIdStr is null or empty, log and proceed with a default or no action
            if (recipeIdStr == null || recipeIdStr.isEmpty()) {
                System.out.println("Recipe ID is empty or missing. No action will be taken.");
                response.sendRedirect("mealPlanner.jsp"); // Redirect or handle accordingly
                return;
            }

            int recipeId = Integer.parseInt(recipeIdStr); // May still throw NumberFormatException if not a number

            MealPlanDAO mealPlanDAO = new MealPlanDAO();
            boolean isAdded = mealPlanDAO.addRecipeToMealPlan(userId, recipeId, mealCategory, mealDate);

            if (isAdded) {
                response.sendRedirect("mealPlanner.jsp");
            } else {
                System.out.println("Failed to add recipe to meal plan");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("Invalid format for Recipe ID");
        }
    }
}
