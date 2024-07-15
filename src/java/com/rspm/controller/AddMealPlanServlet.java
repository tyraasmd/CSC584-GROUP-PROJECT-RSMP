package com.rspm.controller;

import dao.MealPlanDAO;
import com.rspm.model.MealPlan;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddMealPlanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        String mealCategory = request.getParameter("mealCategory");
        String mealDate = request.getParameter("date");
        Integer userId = (Integer) request.getSession().getAttribute("userId"); // Get userId from session

        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        MealPlanDAO mealPlanDAO = new MealPlanDAO();

        // Check if a meal plan already exists for the user, date, and category
        MealPlan existingMealPlan = mealPlanDAO.getMealPlanByUserDateAndCategory(userId, mealDate, mealCategory);
        int mealPlanId;
        if (existingMealPlan != null) {
            mealPlanId = existingMealPlan.getMealPlanId();
        } else {
            // Create a new meal plan
            MealPlan mealPlan = new MealPlan();
            mealPlan.setUserId(userId);
            mealPlan.setMealDate(mealDate);
            mealPlan.setCategory(mealCategory);
            mealPlanId = mealPlanDAO.saveMealPlan(mealPlan);
        }

        // Add the recipe to the meal plan
        if (mealPlanId > 0) {
            mealPlanDAO.addRecipeToMealPlan(mealPlanId, recipeId);
            response.sendRedirect("mealPlanner.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
