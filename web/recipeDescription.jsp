<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.rspm.model.Recipe"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recipe Description</title>
        <style>
            body {
                margin: 0;
                padding: 60px 0 0;
                font-family: sans-serif;
                background: linear-gradient(to right, #f7cac9, #dec2cb, #c5b9cd, #abb1cf, #92a8d1);
            }

            .header, .nav {
                color: white;
                padding: 20px 0;
                text-align: center;
            }

            .nav {
                position: fixed;
                top: 0;
                width: 100%;
                padding: 30px 0;
                text-align: right;
                z-index: 1000;
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
            }

            .nav a:hover {
                color: #296AAE;
            }

            .recipe-container-ii {
                display: flex;
                flex-direction: column;
                width: 80%;
                margin: 10px auto 50px;
                padding: 20px 50px 50px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #ddd;
                justify-content: center;
                align-items: center;
            }

            .heading-class {
                text-align: center;
                font-size: 50px;
                margin-bottom: 20px;
            }

            .container-box {
                display: flex;
                width: 100%;
                justify-content: space-between;
            }

            .img-position {
                flex: 1;
                margin-right: 40px;
            }

            .img-position img {
                width: 100%;
                height: auto;
            }

            .text-container {
                flex: 2;
                text-align: justify;
            }

            .text-container h3, .text-container p {
                margin-bottom: 30px;
            }

            .button {
                background-color: #58a2bb;
                border: none;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                font-family: inherit;
                margin: 4px 2px;
                cursor: pointer;
            }

            .button:hover, .button2:hover {
                background-color: #4a90a1;
                color: black;
            }

            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-top: 100px;
            }

            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);

                position: absolute;
                top: 40%;
                left: 50%;
                transform: translate(-50%, -50%);
            }


            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .submit-btn {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            .submit-btn:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <nav class="nav">
                <ul>
                    <li><a href="index">Dashboard</a></li>
                    <li><a href="browseRecipe.jsp">Browse Recipe</a></li>
                    <li><a href="mealPlanner.jsp">Meal Planner</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                </ul>
            </nav>
        </header>
        <div class="recipe-container-ii">
            <% Recipe recipe = (Recipe) request.getAttribute("recipe");
        if (recipe != null) {%>
            <h2 class="heading-class"><%= recipe.getRecipeName()%></h2>
            <div class="container-box">
                <div class="img-position">
                    <img src="upload/<%= recipe.getRecipeImage()%>" alt="<%= recipe.getRecipeName()%>">
                </div>
                <div class="text-container">
                    <h3>Category: <%= recipe.getCategory()%></h3>
                    <h3>Servings: <%= recipe.getServings()%></h3>
                    <h3>Ingredients:</h3>
                    <p><%= recipe.getIngredients().replace("\n", "<br><br>")%></p>
                    <h3>Instructions:</h3>
                    <p><%= recipe.getInstructions().replace("\n", "<br><br>")%></p>
                </div>
            </div>
            <button class="button" onclick="document.getElementById('mealModal').style.display = 'block'">Add to meal plan</button>
            <!-- The Modal -->
            <div id="mealModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="document.getElementById('mealModal').style.display = 'none'">&times;</span>
                    <form action="AddMealPlanServlet" method="post">
                        <input type="hidden" name="recipeId" value="<%= recipe.getRecipeId()%>">
                        <label for="mealCategory">Meal Category:</label>
                        <select id="mealCategory" name="mealCategory">
                            <option value="breakfast">Breakfast</option>
                            <option value="lunch">Lunch</option>
                            <option value="snacks">Snacks</option>
                            <option value="dinner">Dinner</option>
                        </select><br><br>
                        <label for="date">Date:</label>
                        <input type="date" id="date" name="date"><br><br>
                        <input type="submit" class="submit-btn" value="Submit">
                    </form>
                </div>
            </div>
            <% } else { %>
            <p>Recipe not found.</p>
            <% }%>
        </div>
    </body>
</html>

