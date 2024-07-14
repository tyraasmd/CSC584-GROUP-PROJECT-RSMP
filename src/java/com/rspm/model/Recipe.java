package com.rspm.model;

public class Recipe {
    private int recipeId;
    private int userId;
    private String recipeName;
    private String recipeImage;
    private String category;
    private int servings;
    private String ingredients;
    private String instructions;
    private String description;
    private String createdAt;

    // Getters and Setters
    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getRecipeImage() {
        return recipeImage;
    }

    public void setRecipeImage(String recipeImage) {
        this.recipeImage = recipeImage;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getServings() {
        return servings;
    }

    public void setServings(int servings) {
        this.servings = servings;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getCreatedAt() {
        return createdAt;
    }
    
    public String getRecipeDescription() {
        return description;
    }

    public void setRecipeDescription(String description) {
        this.description = description;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}