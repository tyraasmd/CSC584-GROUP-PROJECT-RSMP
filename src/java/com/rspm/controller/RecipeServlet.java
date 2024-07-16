package com.rspm.controller;

import dao.RecipeDAO;
import com.rspm.model.Recipe;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class RecipeServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "upload";
    private static final Logger LOGGER = Logger.getLogger(RecipeServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String recipeName = request.getParameter("recipe_name");
        Part recipeImagePart = request.getPart("recipe_image");
        String recipeDescription = request.getParameter("recipe_description");
        String category = request.getParameter("category");
        int servings = Integer.parseInt(request.getParameter("servings"));
        String ingredients = request.getParameter("ingredients");
        String instructions = request.getParameter("instructions");

        // Retrieve user ID from session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            LOGGER.log(Level.SEVERE, "User ID not found in session. Redirecting to login.");
            response.sendRedirect("login.jsp");
            return;
        }

        LOGGER.log(Level.INFO, "User ID: " + userId);
        LOGGER.log(Level.INFO, "Recipe Name: " + recipeName);
        LOGGER.log(Level.INFO, "Recipe Image Part: " + recipeImagePart);
        LOGGER.log(Level.INFO, "Recipe Description: " + recipeDescription);
        LOGGER.log(Level.INFO, "Category: " + category);
        LOGGER.log(Level.INFO, "Servings: " + servings);
        LOGGER.log(Level.INFO, "Ingredients: " + ingredients);
        LOGGER.log(Level.INFO, "Instructions: " + instructions);

        if (recipeImagePart != null && recipeImagePart.getSize() > 0) {
            // Handle image upload
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String fileName = extractFileName(recipeImagePart);
            Path filePath = Paths.get(uploadPath, fileName);
            LOGGER.log(Level.INFO, "File Path: " + filePath);

            try {
                Files.copy(recipeImagePart.getInputStream(), filePath);
            } catch (IOException e) {
                LOGGER.log(Level.SEVERE, "File upload failed", e);
                response.sendRedirect("error.jsp");
                return;
            }

            // Create a Recipe object
            Recipe recipe = new Recipe();
            recipe.setUserId(userId);
            recipe.setRecipeName(recipeName);
            recipe.setRecipeImage(fileName);
            recipe.setRecipeDescription(recipeDescription);
            recipe.setCategory(category);
            recipe.setServings(servings);
            recipe.setIngredients(ingredients);
            recipe.setInstructions(instructions);

            // Save recipe to database using RecipeDAO
            RecipeDAO recipeDAO = new RecipeDAO();
            if (recipeDAO.saveRecipe(recipe)) {
                // Redirect to success page
                response.sendRedirect("success.jsp");
            } else {
                LOGGER.log(Level.SEVERE, "Failed to save recipe to database");
                response.sendRedirect("error.jsp");
            }
        } else {
            LOGGER.log(Level.WARNING, "File part is null or empty");
            response.sendRedirect("error.jsp"); // Create an error.jsp page to handle errors gracefully
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Content Disposition: " + contentDisp);
        if (contentDisp == null) {
            return null;
        }
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }
}
