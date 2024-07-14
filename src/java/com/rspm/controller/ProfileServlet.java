package com.rspm.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.rspm.model.User;
import com.rspm.model.Recipe;
import dao.UserDAO;
import dao.RecipeDAO;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private RecipeDAO recipeDAO;

    public void init() {
        userDAO = new UserDAO();
        recipeDAO = new RecipeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            request.setAttribute("username", user.getUsername());

            //List<Recipe> myRecipes = recipeDAO.getRecipeById(user.getId());
            //request.setAttribute("myRecipes", myRecipes);

            List<Recipe> history = recipeDAO.getMealPlanHistory(user.getUserId());
            request.setAttribute("history", history);

            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginV3.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int recipeId = Integer.parseInt(request.getParameter("recipeId"));
            String recipeName = request.getParameter("recipeName");
            String recipeImage = request.getParameter("recipeImage");
            String category = request.getParameter("category");
            int servings = Integer.parseInt(request.getParameter("servings"));
            String ingredients = request.getParameter("ingredients");
            String instructions = request.getParameter("instructions");
            String createdAt = request.getParameter("createdAt");

            Recipe recipe = new Recipe();
            recipe.setRecipeId(recipeId);
            recipe.setRecipeName(recipeName);
            recipe.setRecipeImage(recipeImage);
            recipe.setCategory(category);
            recipe.setServings(servings);
            recipe.setIngredients(ingredients);
            recipe.setInstructions(instructions);
            recipe.setCreatedAt(createdAt);

            boolean isUpdated = recipeDAO.updateRecipe(recipe);
            if (isUpdated) {
                request.setAttribute("message", "Recipe updated successfully.");
            } else {
                request.setAttribute("message", "Failed to update recipe.");
            }
        } else if ("delete".equals(action)) {
            int recipeID = Integer.parseInt(request.getParameter("recipeId"));

            boolean isDeleted = recipeDAO.deleteRecipe(recipeID);
            if (isDeleted) {
                request.setAttribute("message", "Recipe deleted successfully.");
            } else {
                request.setAttribute("message", "Failed to delete recipe.");
            }
        }

        doGet(request, response);
    }
}