package com.rspm.controller;

import dao.RecipeDAO;
import com.rspm.model.Recipe;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GetRecipeDetailsServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(GetRecipeDetailsServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            logger.log(Level.WARNING, "Missing or invalid id parameter");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid id parameter");
            return;
        }

        int recipeId;
        try {
            recipeId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            logger.log(Level.WARNING, "Invalid id parameter: {0}", idParam);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid id parameter");
            return;
        }

        logger.log(Level.INFO, "Fetching recipe with ID: {0}", recipeId);

        RecipeDAO recipeDAO = new RecipeDAO();
        Recipe recipe = recipeDAO.getRecipeById(recipeId);

        if (recipe != null) {
            StringBuilder json = new StringBuilder();
            json.append("{");
            json.append("\"recipeId\":").append(recipe.getRecipeId()).append(",");
            json.append("\"recipeName\":\"").append(escapeJson(recipe.getRecipeName())).append("\",");
            json.append("\"recipeDescription\":\"").append(escapeJson(recipe.getRecipeDescription())).append("\",");
            json.append("\"category\":\"").append(escapeJson(recipe.getCategory())).append("\",");
            json.append("\"servings\":").append(recipe.getServings()).append(",");
            json.append("\"ingredients\":\"").append(escapeJson(recipe.getIngredients()).replace("\n", "\\n")).append("\",");
            json.append("\"instructions\":\"").append(escapeJson(recipe.getInstructions()).replace("\n", "\\n")).append("\"");
            json.append("}");

            response.setContentType("application/json");
            response.getWriter().write(json.toString());
        } else {
            logger.log(Level.WARNING, "Recipe not found with ID: {0}", recipeId);
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Recipe not found");
        }
    }

    private String escapeJson(String value) {
        if (value == null) {
            return "";
        }
        StringBuilder escaped = new StringBuilder();
        for (char c : value.toCharArray()) {
            switch (c) {
                case '"':
                    escaped.append("\\\"");
                    break;
                case '\\':
                    escaped.append("\\\\");
                    break;
                case '\b':
                    escaped.append("\\b");
                    break;
                case '\f':
                    escaped.append("\\f");
                    break;
                case '\n':
                    escaped.append("\\n");
                    break;
                case '\r':
                    escaped.append("\\r");
                    break;
                case '\t':
                    escaped.append("\\t");
                    break;
                default:
                    if (c < 32 || c > 126) {
                        escaped.append(String.format("\\u%04x", (int) c));
                    } else {
                        escaped.append(c);
                    }
            }
        }
        return escaped.toString();
    }
}
