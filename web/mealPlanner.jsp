<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.rspm.model.MealPlan"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Healthy Meal Plans</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/> 
        <link rel="stylesheet" href="css/calendar.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                box-sizing: border-box;
                background: linear-gradient(to right, #f7cac9, #dec2cb, #c5b9cd, #abb1cf, #92a8d1);
            }
            .header {
                color: white;
                padding: 20px 0;
                text-align: center;
            }
            .nav {
                color: white;
                padding: 8px 0;
                text-align: right;
                font-size: 16px;
                margin-left: 307px;
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
            .main {
                position: absolute;
                top: 60px;
                width: 94%;
                left: 50px;
                min-height: calc(100vh - 60px);
            }
            .bb {
                width: 1100px;
                margin: 10px auto 50px;
                padding: 20px;
                border: 1px solid white;
                border-radius: 10px;
                background-color: white;
                height: auto;
                justify-content: center;
            }
            .container2 {
                width: 1000px;
            }
            .legend {
                width: 1100px;
                margin: 10px auto 10px;
                padding: 20px;
                border: 1px solid white;
                border-radius: 10px;
                background-color: white;
                height: auto;
                justify-content: center;
                display: grid;
                grid-template-columns: repeat(5, 1fr);
                grid-gap: 30px;
            }
            .data{
                margin-left: 60px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .legend-item {
                display: inline-block;
                width: 40px;
                height: 10px;
                margin-right: 10px;
            }
            .breakfast {
                background-color: #D5A6BD;
            }
            .lunch {
                background-color: #D3B9A3;
            }
            .snack {
                background-color: #8E9CB5;
            }
            .dinner {
                background-color: #8FB98B;
            }
            .legend-label {
                margin-right: 80px;
            }
            .fc-today {
                background-color: #DDE7F2 !important; /* Change this color to your desired color */
            }
        </style>
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
        <div class="legend">
            <div class="data">
                <span class="legend-item breakfast"></span>
                <span class="legend-label">Breakfast</span>
            </div>
            <div class="data">
                <span class="legend-item lunch"></span>
                <span class="legend-label">Lunch</span>
            </div>
            <div class="data">
                <span class="legend-item snack"></span>
                <span class="legend-label">Snack</span>
            </div>
            <div class="data">
                <span class="legend-item dinner"></span>
                <span class="legend-label">Dinner</span>
            </div>
        </div>
        <div class="bb">
            <div class="container2">
                <div id="calendar"></div>
            </div><br>
        </div>

        <!-- Recipe Details Modal -->
        <div id="recipeModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="modalTitle"></h4>
                    </div>
                    <div class="modal-body" id="modalBody">
                        <!-- Recipe details will be loaded here dynamically -->
                        <div class="text-container">
                            <h3>Category: <span id="recipeCategory"></span></h3>
                            <h3>Servings: <span id="recipeServings"></span></h3>
                            <h3>Ingredients:</h3>
                            <p id="recipeIngredients"></p>
                            <h3>Instructions:</h3>
                            <p id="recipeInstructions"></p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="deleteButton" onclick="deleteMealPlanRecipe()">Delete</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
    var currentMealPlanId;
    var currentRecipeId;

    $(document).ready(function () {
        $('#calendar').fullCalendar({
            header: {
                left: '',
                center: 'title',
                right: 'prev, today, next'
            },
            buttonText: {
                today: 'Today'
            },
            events: function (start, end, timezone, callback) {
                $.ajax({
                    url: 'MealPlanServlet',
                    dataType: 'json',
                    success: function (data) {
                        var events = [];
                        $(data).each(function () {
                            events.push({
                                title: this.recipeName,
                                start: this.mealDate,
                                color: getCategoryColor(this.category),
                                id: this.mealPlanId,
                                recipeId: this.recipeId
                            });
                        });
                        callback(events);
                    }
                });
            },
            eventRender: function (event, element) {
                element.find('.fc-content').css('cursor', 'pointer');
            },
            eventClick: function (event) {
                currentMealPlanId = event.id;
                currentRecipeId = event.recipeId;
                $.ajax({
                    url: 'GetRecipeDetailsServlet',
                    data: { id: event.recipeId },
                    dataType: 'json',
                    success: function (data) {
                        $('#modalTitle').text(data.recipeName);
                        $('#recipeCategory').text(data.category);
                        $('#recipeServings').text(data.servings);
                        $('#recipeIngredients').html(data.ingredients.replace(/\n/g, '<br>'));
                        $('#recipeInstructions').html(data.instructions.replace(/\n/g, '<br>'));
                        $('#recipeModal').modal('show');
                    }
                });
            }
        });
    });

    function getCategoryColor(category) {
        switch (category) {
            case 'breakfast':
                return '#D5A6BD';
            case 'lunch':
                return '#D3B9A3';
            case 'snacks':
                return '#8E9CB5';
            case 'dinner':
                return '#8FB98B';
            default:
                return '#B8CAE8';
        }
    }

    function deleteMealPlanRecipe() {
        if (confirm('Are you sure you want to delete this recipe from the meal plan?')) {
            $.ajax({
                url: 'DeleteMealPlanRecipeServlet',
                type: 'POST',
                data: {
                    mealPlanId: currentMealPlanId,
                    recipeId: currentRecipeId
                },
                success: function (response) {
                    if (response.success) {
                        $('#recipeModal').modal('hide');
                        $('#calendar').fullCalendar('refetchEvents');
                    } else {
                        alert('Failed to delete the recipe. Please try again.');
                    }
                }
            });
        }
    }
        </script>
    </body>
</html>
