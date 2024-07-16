package com.rspm.controller;

import com.rspm.model.MealPlan;
import dao.MealPlanDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MealPlanServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(MealPlanServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        MealPlanDAO mealPlanDAO = new MealPlanDAO();
        List<MealPlan> mealPlans = mealPlanDAO.getMealPlansWithRecipesByUserId(userId);

        // Manually create the JSON string
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < mealPlans.size(); i++) {
            MealPlan mealPlan = mealPlans.get(i);
            json.append("{")
                    .append("\"mealPlanId\":").append(mealPlan.getMealPlanId()).append(",")
                    .append("\"userId\":").append(mealPlan.getUserId()).append(",")
                    .append("\"mealDate\":\"").append(mealPlan.getMealDate()).append("\",")
                    .append("\"category\":\"").append(mealPlan.getCategory()).append("\",")
                    .append("\"recipeId\":").append(mealPlan.getRecipeId()).append(",")
                    .append("\"recipeName\":\"").append(mealPlan.getRecipeName()).append("\"")
                    .append("}");
            if (i < mealPlans.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
}
