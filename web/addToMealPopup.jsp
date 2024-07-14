<%-- 
    Document   : addToMealPopup
    Created on : Jun 28, 2024, 12:59:54 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Healthy Meal Plans</title>
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

    .main {
      display: flex;
    }
    .recipe-container-ii {
        width: 1100px; /* Adjust width as needed */
        margin: 10px auto 50px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #ddd;
        height: 960px; /* Adjust height as needed */
        justify-content: center;
    }
    .recipe-container-ii img {
        width: 400px; /* Adjust width as needed */
        height: 300px; /* Adjust height as needed */
    }
    .description-container {
        display: flex;
        width: 900px; /* Adjust width as needed */
        justify-content: center;
        margin: 0 auto 50px;
        padding: 10px;
        border-radius: 5px;
        height: 70px; /* Adjust height as needed */
        text-align: center;
    }
    .heading-class {
        text-align: center;
        font-size: 50px; /* Adjust font size as needed */
        justify-content: center;
    }
    .img-position {
        padding-left: 5px;
        justify-content: flex-start;
        float: left;
    }
    .container-box {
        position: absolute;
        width: 78%;
        top: 45%;
        padding: 20px;
    }
    .text-container {
        /*margin-left: 20px;  Add margin to the left side of the text container */
        padding-left: 42%;
        text-align: justify;
    }
    .button {
        background-color: #04AA6D; /* Green */
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
        font-size: inherit;  /* Inherit font size from button */
    }
    .button-position {
        justify-content: center;  /* Center elements horizontally*/
        align-items: center;  
        padding-left: 40%;
        padding-top: 7%;
    }

    .popup {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
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
</head>

<body>
  <header class="header">
    <nav class="nav">
      <div class="container">
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="browseRecipe.jsp">Browse Recipe</a></li>
          <li><a href="mealPlanner.jsp">Meal Planner</a></li>
          <li><a href="profile.jsp">Profile</a></li>
        </ul>
      </div>
    </nav>
  </header>
    <div class="recipe-container-ii">
      <h2 class="heading-class">Ondeh-ondeh</h2>
        <div class="container-box">
            <img class="img-position" src="../images/s-r3.jpg" alt="Snacks 1">
            <div class="text-container">
                <h3>Category: Snacks</h3>
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
            <div class="button-position">
              <button class="button button2" onclick="openPopup()">Add recipe to meal plan</button>
              <div class="popup">
                <div class="popup-content">
                  <span class="close" onclick="closePopup()">&times;</span>
                  <h2>Add to Meal Plan</h2><br>
                  <form action="mealPlanner.html">
                    <label for="category">Select Category:</label>
                    <select id="category" name="category">
                      <option value="breakfast">Breakfast</option>
                      <option value="lunch">Lunch</option>
                      <option value="snack">Snack</option>
                      <option value="dinner">Dinner</option>
                    </select><br>
                    <label for="date">Select Date:</label>
                    <input type="date" id="date" name="date"><br>
                        <button type="submit" class="button">ADD</button>
                    </form>
                </div>
              </div>
            </div>
        </div>
    </div>
<script>
  function openPopup() {
  document.querySelector('.popup').style.display = 'block';
}

// Function to close the popup
function closePopup() {
  document.querySelector('.popup').style.display = 'none';
}
</script>
</body>
</html>
