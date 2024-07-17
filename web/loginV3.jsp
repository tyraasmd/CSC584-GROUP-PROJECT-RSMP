<%-- 
    Document   : loginV3
    Created on : Jun 28, 2024, 12:57:35 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('image/background-image1.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(189, 228, 241, 0.8);
            padding: 40px;
            border-radius: 10px;
            text-align: center;
        }

        .container h1 {
            margin-bottom: 30px;
            font-size: 24px;
        }

        .input-container {
            margin-bottom: 20px;
            margin-right: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .links {
            margin-top: 20px;
        }

        .links a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
        }

        .links a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Recipe Sharing and Meal Planning Management</h1>
        <form action="login" method="post">
            <div class="input-container">
                <input type="text" placeholder="Username" name="username" required>
            </div>
            <div class="input-container">
                <input type="password" placeholder="Password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <div class="links">
            <a href="registerAccount.jsp">Register Account</a>
        </div>
    </div>
</body>
</html>
