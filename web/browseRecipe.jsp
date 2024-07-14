<%-- 
    Document   : browseRecipe
    Created on : Jun 28, 2024, 12:59:27 AM
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
          <li><a href="index.jsp">Dashboard</a></li>
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
        <button class="button button2" onclick="location.href='createNewRecipe.html'"> + Create new recipe</button>
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
      <div class="recipe-list">
        </div>
        <div class="recipe-grid">
            <div class="recipe-box">
                <a href="recipe-description/scrambled-egg-description.html">
                    <img src="images/b-r1.jpg" alt="Breakfast 1">
                    <h3 class="no-link-style">Scrambled Egg</h3>
                    <p>"Elevate scrambled eggs with smoked trout for a gourmet twist. Effortless and delicious!"</p>
                </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/nasi-lemak-description.html">
                  <img src="images/L-r2.jpg" alt="Lunch 1">
                  <h3 class="no-link-style">Nasi Lemak</h3>
                  <p>"Aromatic coconut rice, the star of Malaysia! Cooked with pandan leaves for a fragrant twist."</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/ondehOndeh-recipe-description.html">
                  <img src="images/s-r3.jpg" alt="snacking 1">
                  <h3 class="no-link-style">Ondeh-ondeh</h3>
                  <p>"Irresistible chewy rice balls filled with a gooey palm sugar surprise!"</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/meeGoreng-recipe-description.html">
                  <img src="images/d-r4.jpg" alt="Dinner 1">
                  <h3 class="no-link-style">Mee Goreng</h3>
                  <p>"Busy weeknight? This quick and easy mee goreng is your dinnertime savior!"</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/homemadeOatmeal-recipe-description.html">
                  <img src="images/b-r5.jpg" alt="Breakfast 2">
                  <h3 class="no-link-style">Homemade Oatmeal</h3>
                  <p>"Power up your mornings! Make delicious homemade oatmeal - it's easier than you think!"</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/asamPedas-recipe-description.html">
                  <img src="images/L-r6.jpg" alt="Lunch 2">
                  <h3 class="no-link-style">Asam Pedas</h3>
                  <p>"Tangy & spicy! Dive into a bowl of our fish-filled asam pedas for a flavorful lunch."</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/apamBalik-recipe-description.html">
                  <img src="images/s-r7.jpg" alt="Snacks 2">
                  <h3 class="no-link-style">Apam balik </h3>
                  <p>"Delicious Malaysian apam balik: crispy, fluffy pancakes filled with sweet peanut goodness."</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/charKwayTeow-recipe-description.html">
                  <img src="images/d-r8.jpg" alt="Dinner 2">
                  <h3 class="no-link-style">Char Kway Teow </h3>
                  <p>"Flat rice noodles, wok-fried delight! Try our Char Kway Teow."</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/crescentRoll-recipe-description.html">
                  <img src="images/b-r9.jpg" alt="Breakfast 3">
                  <h3 class="no-link-style">Sausage & Crescent Roll Breakfast Casserole</h3>
                  <p>"Hearty breakfast casserole: sausage and flaky crescent rolls combined perfectly"</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/curryTofu-recipe-description.html">
                  <img src="images/L-r10.jpg" alt="Lunch 3">
                  <h3 class="no-link-style">Malaysian Curry Tofu</h3>
                  <p>"Experience Malaysia's authentic curry tofu: rich spices complement creamy tofu perfectly."</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/kuihLapis-recipe-description.html">
                  <img src="images/s-r11.jpg" alt="Snacks 3">
                  <h3 class="no-link-style">Kuih lapis lemak manis </h3>
                  <p>"Experience the decadence of Malaysian kuih lapis lemak: a coconut delight!"</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/lohMee-recipe-description.html">
                  <img src="images/d-r12.jpg" alt="Dinner 3">
                  <h3 class="no-link-style">Loh Mee (Glass Noodle Soup)</h3>
                  <p>"Get ready for a flavor explosion with this tantalizing Loh Mee soup!"</p>
              </a>
            </div>
            <div class="recipe-box">
              <a href="recipe-description/sweetPotato-recipe-description.html">
                  <img src="images/b-r13.jpg" alt="breakfast 3">
                  <h3 class="no-link-style">Breakfast Sweet Potatoes</h3>
                  <p>"Power up your mornings with a healthy and satisfying sweet potato breakfast."</p>
              </a>
            </div>
        </div>
    </div>
    <script src="trialPage.js"></script>
</div>
</body>
</html>
