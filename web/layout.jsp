<%-- 
    Document   : layout
    Created on : Jul 14, 2024, 3:39:47 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Healthy Meal Plans</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            /* Basic reset styles */
            body {
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                background: linear-gradient(to right, #f7cac9, #dec2cb, #c5b9cd, #abb1cf, #92a8d1);
            }

            /* Header styling */
            .header { /* A light blue color */
                color: white;
                padding: 20px 0;
                text-align: center;
            }

            /* Navigation bar styling */
            .nav { /* Same light blue as header */
                color: white;
                padding: 10px 0;
                text-align: right;
            }

            .nav ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .nav li {
                display: inline-block;
                padding: 10px 20px;
            }

            .nav a {
                color: white;
                text-decoration: none;
                text-align: left;
            }

            .nav a:hover {
                color: #296AAE; /* A darker blue color */
            }

            /* Form container styling */
            .container {
                max-width: 800px;
                margin: 50px auto;
                padding: 40px;
                padding-right: 60px;
                background: rgba(255, 255, 255, 0.8);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .container h2 {
                text-align: center;
                color: #333;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .form-group input, .form-group textarea, .form-group select {
                width: 100%;
                padding: 8px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .form-group textarea {
                resize: vertical;
            }

            .form-group button {
                display: block;
                width: 100%;
                padding: 10px;
                background: #296AAE;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .form-group button:hover {
                background: #224f88;
            }

            /* Image preview styling */
            .image-preview {
                margin-top: 15px;
                margin-bottom: 20px; /* Added gap between the image preview and next input */
                text-align: center;
            }

            .image-preview img {
                max-width: 300px; /* Smaller preview size */
                border: 1px solid #ccc;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <nav class="nav">
                <ul>
                    <li><a href="index.html">Dashboard</a></li>
                    <li><a href="browseRecipe.html">Browse Recipe</a></li>
                    <li><a href="mealPlanner.html">Meal Planner</a></li>
                    <li><a href="profile.html">Profile</a></li>
                </ul>
            </nav>
        </header>

        <div class="container">
            <h2>Create New Recipe</h2>
            <form action="submitRecipe.jsp" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="recipeName">Recipe Name:</label>
                    <input type="text" id="recipeName" name="recipe_name" placeholder="Enter your recipe name"required>
                </div>
                <div class="form-group">
                    <label for="recipeImage">Recipe Image:</label>
                    <input type="file" id="recipeImage" name="recipe_image" accept="image/*" onchange="previewImage(event)">
                </div>
                <div class="image-preview" id="imagePreview">
                    <img id="imagePreviewImg" src="#" alt="Image Preview" style="display: none;">
                </div>
                <div class="form-group">
                    <label for="recipeDescription">Recipe Description:</label>
                    <textarea id="recipeDescription" name="recipe_description" placeholder="Describe your recipe!"rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select id="category" name="category">
                        <option value="Breakfast">Breakfast</option>
                        <option value="Lunch">Lunch</option>
                        <option value="Snacks">Snacks</option>
                        <option value="Dinner">Dinner</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="servings">Servings:</label>
                    <input type="number" id="servings" name="servings" placeholder="Enter your recipe servings"required>
                </div>
                <div class="form-group">
                    <label for="ingredients">Ingredients:</label>
                    <textarea id="ingredients" name="ingredients" placeholder="Enter ingredients list..."rows="5" required></textarea>
                </div>
                <div class="form-group">
                    <label for="instructions">Instructions:</label>
                    <textarea id="instructions" name="instructions" placeholder="Enter instructions list..."rows="5" required></textarea>
                </div>
                <div class="form-group">
                    <button type="submit">Submit Recipe</button>
                </div>
            </form>
        </div>

        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('imagePreviewImg');
                    output.src = reader.result;
                    output.style.display = 'block';
                }
                reader.readAsDataURL(event.target.files[0]);
            }
        </script>
    </body>
</html>
