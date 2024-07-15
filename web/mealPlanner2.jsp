<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.rspm.model.MealPlan"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- (existing head content) -->
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
            /* Basic reset styles */
            body {
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                box-sizing: border-box;
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
                color: #296AAE; /* A darker blue color */
            }

            .main {
                position: absolute;
                top: 60px;
                width: 94%;
                left: 50px;
                min-height: calc(100vh - 60px);
            }

            .bb {
                width: 1100px; /* Adjust width as needed */
                margin: 10px auto 50px;
                padding: 20px;
                border: 1px solid white;
                border-radius: 10px;
                background-color: white;
                height: auto; /* Adjust height as needed */
                justify-content: center;
            }

            .container2 {
                width: 1000px;
            }

            .legend {
                width: 1100px; /* Adjust width as needed */
                margin: 10px auto 10px;
                padding: 20px;
                border: 1px solid white;
                border-radius: 10px;
                background-color: white;
                height: auto; /* Adjust height as needed */
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
                background-color: #f7cac9;
            }

            .lunch {
                background-color: #dec2cb;
            }

            .snack {
                background-color: #c5b9cd;
            }

            .dinner {
                background-color: #c5b9cd;
            }

            .legend-label {
                margin-right: 80px;
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
        <script>
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
                                        title: this.category,
                                        start: this.mealDate,
                                        color: getCategoryColor(this.category),
                                        id: this.mealPlanId
                                    });
                                });
                                callback(events);
                            }
                        });
                    },
                    eventClick: function (event) {
                        // Display modal or redirect to detailed view
                        alert('Meal Plan: ' + event.title + '\nDate: ' + event.start.format('YYYY-MM-DD'));
                    }
                });

                function getCategoryColor(category) {
                    switch (category) {
                        case 'breakfast':
                            return '#f7cac9';
                        case 'lunch':
                            return '#dec2cb';
                        case 'snacks':
                            return '#c5b9cd';
                        case 'dinner':
                            return '#abb1cf';
                        default:
                            return '#92a8d1';
                    }
                }
            });
        </script>
    </body>
</html>
