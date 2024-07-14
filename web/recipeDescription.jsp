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
                padding: 0;
                font-family: sans-serif;
                background: linear-gradient(to right, #f7cac9, #dec2cb, #c5b9cd, #abb1cf, #92a8d1);
            }

            /* Header styling */
            .header {
                color: white;
                padding: 20px 0;
                text-align: center;
            }

            /* Navigation bar styling */
            .nav {
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
                color: #296AAE;
            }

            .recipe-container-ii {
                display: flex;
                flex-direction: column;
                width: 80%; /* Adjust width as needed */
                margin: 10px auto 50px;
                padding: 20px 50px 50px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #ddd;
                justify-content: center;
                align-items: center;
                position: relative;
            }
            .heading-class {
                text-align: center;
                font-size: 50px; /* Adjust font size as needed */
                margin-bottom: 20px; /* Add space below the heading */
            }
            .container-box {
                display: flex;
                width: 100%;
                justify-content: space-between;
            }
            .img-position {
                flex: 1;
                margin-right: 20px; /* Space between image and text */
            }
            .img-position img {
                width: 100%;
                height: auto; /* Maintain aspect ratio */
            }
            .text-container {
                flex: 2;
                text-align: justify;
            }
            .text-container h3, .text-container p {
                margin-bottom: 10px; /* Space between each content item */
            }

            /* Button styling */
            .meal-plan-button {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #296AAE;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            /* Popup styling */
            .popup {
                display: none;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 10;
            }

            .popup h3 {
                margin-top: 0;
            }

            .popup form {
                display: flex;
                flex-direction: column;
            }

            .popup label {
                margin-bottom: 5px;
            }

            .popup select,
            .popup input[type="date"],
            .popup button {
                margin-bottom: 10px;
                padding: 10px;
                font-size: 16px;
            }

            .popup button {
                background-color: #296AAE;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .popup-close {
                background-color: red;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                padding: 5px 10px;
                margin-top: 10px;
                align-self: flex-end;
            }
        </style>
        <script>
            function openPopup() {
                document.getElementById('mealPlanPopup').style.display = 'block';
            }

            function closePopup() {
                document.getElementById('mealPlanPopup').style.display = 'none';
            }
        </script>
    </head>
    <body>
        <header class="header">
            <nav class="nav">
                <ul>
                    <li><a href="index.jsp">Dashboard</a></li>
                    <li><a href="browseRecipe.jsp">Browse Recipe</a></li>
                    <li><a href="mealPlanner.jsp">Meal Planner</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                </ul>
            </nav>
        </header>
        <div class="recipe-container-ii">
            <%
                Recipe recipe = (Recipe) request.getAttribute("recipe");
                if (recipe != null) {
            %>
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
            <button class="meal-plan-button" onclick="openPopup()">Add to meal plan</button>
            <div id="mealPlanPopup" class="popup">
                <h3>Add to Meal Plan</h3>
                <form action="addToMealPlan" method="post">
                    <label for="mealCategory">Meal Category:</label>
                    <select id="mealCategory" name="mealCategory" required>
                        <option value="breakfast">Breakfast</option>
                        <option value="lunch">Lunch</option>
                        <option value="snacks">Snacks</option>
                        <option value="dinner">Dinner</option>
                    </select>
                    <label for="mealDate">Date:</label>
                    <input type="date" id="mealDate" name="mealDate" required>
                    <button type="submit">Submit</button>
                </form>
                <button class="popup-close" onclick="closePopup()">Close</button>
            </div>
            <%
            } else {
            %>
            <p>Recipe not found.</p>
            <%
                }
            %>
        </div>
    </body>
</html>
