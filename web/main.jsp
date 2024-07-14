<%-- 
    Document   : main
    Created on : Jun 28, 2024, 12:57:18 AM
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
      position: relative;
      width: 100%;
      height: 450px;
      text-align: center;
      background: url('image/rsmp.jpg') no-repeat center center/cover;
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
    
    .head-content {
    position: absolute;
    top: 50%;
    left: 20%;
    transform: translate(-50%, -50%);
    text-align: center;
    font-family: BankGothic Lt BT;
    }

    .head-content h1 {
        font-size: 40px;
        margin-left: 10px;
    }

    .head-content h2 {
        font-size: 80px;
        font-weight: bold;
    }
        
        .main-content {
            background-color: #d3d3d3;
            padding: 50px 20px;
            text-align: center;
            font-family: BankGothic Lt BT;
        }

        .main-content h3 {
            font-size: 40px;
            margin-bottom: 20px;
        }

        .main-content p {
            font-size: 1.2em;
            line-height: 1.6;
            max-width: 800px;
            margin: auto;
        }
        
        .about-content {
            color: white;
            padding: 20px 0;
            position: relative;
            width: 100%;
            height: 100vh;
            text-align: right;
            background-image: url('image/meal.jpg');
            background-size: cover;
            background-position: center;
            font-family: BankGothic Lt BT;
        }
        
        .about-content h3 {
            font-size: 70px;
            margin-bottom: 20px;
            padding-right: 170px;
            padding-top: 60px;
        }

        .about-content p {
            font-size: 20px;
            text-align: justify;
            padding-left: 720px;
            line-height: 1.6;
            max-width: 600px;
            margin: auto;
        }

  </style>
</head>
<body>
  <header class="header">
    <nav class="nav">
      <div class="container">
        <ul>
          <li><a href="#about">About Us</a></li>
          <li><a href="browseRecipe.jsp">Mission</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li><a href="loginV3.jsp">Log In</a></li>
          <li><a href="registerAccount.jsp">Sign Up</a></li>
        </ul>
      </div>
    </nav>
      <div class="head-content">
          <h1>TIME TO</h1>
            <h2>KNOW US</h2>
        </div>
  </header>
    <section class="main-content">
        <h3>RECIPE SHARING AND MEAL PLANNING</h3>
        <p>We believe food brings people together. It's more than just sustenance; it's about creating memories, celebrating cultures, and nurturing well-being.</p>
    </section>
    <section class="about-content" id="about">
        <h3>ABOUT US</h3>
        <p>We understand the struggle of weeknight meals and the challenge of finding healthy, 
            delicious recipes that fit your lifestyle. We also know the frustration of losing 
            track of favorite recipes or having them scattered across different websites.</p><br><br>
        
        <p>That's why we created this website, a one-stop platform for recipe sharing, meal 
            planning, and inspiration. We connect home cooks of all levels to share their 
            passions and discover new favorites.</p><br><br>
        
        <p>We're committed to fostering a supportive community where everyone feels welcome 
            to contribute and learn. We value diversity, creativity, and healthy eating habits.</p>
    </section>
</body>
</html>
