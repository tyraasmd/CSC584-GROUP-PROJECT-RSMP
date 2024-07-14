<%-- 
    Document   : mealPlanner
    Created on : Jun 28, 2024, 12:56:36 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    $(document).ready(function() {
    $('#calendar').fullCalendar({
        header:
           {
           left: '',
           center: 'title',
           right: 'prev, today, next'
           },
           buttonText:
           {
           today: 'Today'
           },
           today:[{
            color: 'green'
           }],
           events: [{
            title: 'Ondeh-Ondeh',
            start: '2024-05-10',
            end: '2024-05-10',
            color: '#f7cac9',
            url: '#myModel'
            }
            // other events here
        ],
        eventClick: function(event) {
                var modal = $("#recipe");
        modal.modal();
            }
    });
 });
 </script>
<div class="modal fade" id="recipe">
    <div class="modal-dialog" >
        <div class="modal-content" style="padding: 0 30px">
            <!-- Modal Header -->
            <h2 class="heading-class" style="text-align: center;">Ondeh-ondeh</h2>
            <div class="container-box">
                <div class="text-container">
                    <h3>Ingredient - for 1 servings:</h3>
                    1. 250 g (8oz) glutinous rice flour</br>
                    2. 200 ml Pandan juice</br>
                    3. 100 g (3½ oz) grated coconut</br>
                    4. 1 pinch sea salt</br>
                    5. 150 g (5½ oz) Gula Melaka or palm sugar, finely chopped</br>
                    <h3>Instructions:</h3>
                    <br><b>Step 1 :  </b> In a large bowl, combine the glutinous rice flour with Pandan juice and knead lightly.
                        Pinch a small piece of the dough (about 40 g/ 1½ oz.) and drop it into boiling water</br>
                    <br><b>Step 2 :  </b> When the dough rises up the surface, remove it with a slotted spoon and shake off 
                    the excess water. Mix it back into the main dough and knead well to form a smooth dough. Cover the dough 
                    and set aside for about 15 minutes.</br>
                    <br><b>Step 3 :  </b> Mix the grated coconut with a pinch of salt and steam for about 2 - 3 minutes and 
                    let it cool completely.</br>
                    <br><b>Step 4 :  </b> Bring a pot of water to boil. Pinch a small piece of dough (about 15 g/ ½oz 
                    each) and flatten lightly. Fill the center of the dough with Gula Melaka or palm sugar. Roll it in your 
                    palms to form a smooth ball. Repeat the same until all ingredients are used up</br>
                    <br><b>Step 5 :  </b> Cook the onde-onde balls in boiling water. When they float to the surface, remove 
                    them with a slotted spoon and shake off the excess water. Coat the onde-onde with grated coconut and 
                    ready to go!
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-close" style="background-color: #84b2c2; border-color: #84b2c2; color: white" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-delete" style="background-color: rgb(160, 24, 24); border-color: rgb(160, 24, 24); color: white">Delete</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
