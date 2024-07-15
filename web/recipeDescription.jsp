<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.rspm.model.Recipe"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recipe Description</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            .button {
                background-color: #04AA6D;
                border: none;
                color: white;
                padding: 16px 32px;
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
                background-color: #84b2c2;
                color: black;
                text-decoration: none;
            }

            .button2:hover {
                background-color: #58a2bb;
                color: black;
            }
            .button button2 a {
                padding: 0;
                margin: 0;
                border: none;
                background-color: transparent;
                color: transparent;
                font-size: inherit;
            }
            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.9);
                z-index: 9999;
            }

            .popup-content {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 30%;
                height: 50%;
                transform: translate(-50%, -50%);
                background-color: #ddd;
                padding: 20px;
                border-radius: 20px;
            }

            .close {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 5px;
            }

            select, input {
                margin-bottom: 10px;
                height: 30px;
            }

            .popup button {
                background-color: #84b2c2;
                border: none;
                color: black;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
            }

            .popup button:hover {
                background-color: #58a2bb;
                color: black;
            }
        </style>
        <script>
            function openPopup() {
                document.getElementById("mealPlanPopup").style.display = "block";
            }

            function closePopup() {
                document.getElementById("mealPlanPopup").style.display = "none";
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
            <button class="button" onclick="openPopup()">Add to meal plan</button>
            <div id="mealPlanPopup" class="popup">
                <div class="popup-content">
                    <span class="close" onclick="closePopup()">&times;</span>
                    <form action="addMealPlan.jsp" method="post">
                        <label for="mealCategory">Meal Category:</label>
                        <select id="mealCategory" name="mealCategory">
                            <option value="breakfast">Breakfast</option>
                            <option value="lunch">Lunch</option>
                            <option value="snacks">Snacks</option>
                            <option value="dinner">Dinner</option>
                        </select>
                        <label for="mealDate">Select Date:</label>
                        <input type="date" id="mealDate" name="mealDate" required>
                        <button type="submit">Submit</button>
                    </form>
                </div>
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
