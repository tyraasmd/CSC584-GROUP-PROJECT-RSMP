<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.rspm.model.Recipe"%>
<%@page import="dao.RecipeDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Healthy Meal Plans</title>
        <style>
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
            .recipe-container {
                position: relative;
                width: 1100px; /* Adjust width as needed */
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f5f5f5;
            }

            .search-filter {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
                /* Add margin to the right of search-bar */
                margin-right: 10px;  /* Adjust margin value for desired gap */
                gap: 10px;  /* Adjust gap value for desired spacing */
            }

            #search-bar {
                flex: 2;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 9px 9px 9px 9px; /* Achieve rounded corners at the end */
            }

            #filter-category {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            /* Add styles for individual recipe items */
            .recipe-item {
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #eee;
                border-radius: 3px;
            }

            .recipe-item h3 {
                margin-bottom: 5px;
            }

            .recipe-item p {
                margin-bottom: 0;
            }
            .plan{
                background-color: #92a8d1;
                height: 200px;
                padding: 50px;
            }

            .recipe-container-ii {
                text-align: center;
            }

            .recipe-grid {
                display: grid;
                grid-template-columns: repeat(5, 1fr);
                grid-gap: 20px;
            }

            .recipe-box {
                background-color: #f5f5f5;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
            }

            .recipe-box img {
                width: 100%;
                height: 150px; /* Adjust height as needed */
                object-fit: cover; /* Scale image to fill container */
            }

            .recipe-box h3 {
                margin: 10px 0;
                font-weight: bold;
            }

            .recipe-box p {
                line-height: 1.5;
            }
            .recipe-box a {
                text-decoration: none; /* Remove underline */
                color: inherit; /* Inherit text color */
            }
            .no-link-style {
                pointer-events: none; /* Disable pointer events (limited support) */
                cursor: default; /* Set default cursor style */
            }
            .button {
                background-color: #04AA6D; /* Green */
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                font-family: inherit;
                margin: 4px 2px;
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button2 {
                background-color: #8a8a8a; 
                color: black; 
                text-decoration: none;
            }

            .button2:hover {
                background-color: #696969;
                color: white;
            }
            .button button2 a {
                padding: 0;
                margin: 0;
                border: none;
                background-color: transparent;
                color: transparent;
                font-size: inherit;  /* Inherit font size from button */
            }
            .button-position {
                position: absolute;
                top: 0;
                right: 0;
                padding-top: 3%;
                padding-right: 2%;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <nav class="nav">
                <div class="container">
                    <ul>
                        <li><a href="index">Dashboard</a></li>
                        <li><a href="browseRecipe.jsp">Browse Recipe</a></li>
                        <li><a href="mealPlanner.jsp">Meal Planner</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="recipe-container">
            <h1>Explore Our Delicious Recipes</h1>
            <div class="button-position">
                <button class="button button2" onclick="location.href = 'createNewRecipe.jsp'"> + Create new recipe</button>
            </div>
            <div class="search-filter">
                <input type="text" id="search-bar" placeholder="Search Recipes">
                <select id="filter-category">
                    <option value="all">All Categories</option>
                    <option value="breakfast">Breakfast</option>
                    <option value="lunch">Lunch</option>
                    <option value="dinner">Dinner</option>
                </select>
            </div>
            <div class="recipe-list"></div>
            <div class="recipe-grid">
                <%
                    RecipeDAO recipeDAO = new RecipeDAO();
                    List<Recipe> recipes = recipeDAO.getAllRecipes();
                    if (recipes != null) {
                        for (Recipe recipe : recipes) {
                %>
                <div class="recipe-box">
                    <a href="recipeDescription?recipeId=<%= recipe.getRecipeId()%>">
                        <img src="upload/<%= recipe.getRecipeImage()%>" alt="<%= recipe.getRecipeName()%>">
                        <h3 class="no-link-style"><%= recipe.getRecipeName()%></h3>
                        <p><%= recipe.getRecipeDescription()%></p>
                    </a>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <script src="trialPage.js"></script>
    </body>
</html>
