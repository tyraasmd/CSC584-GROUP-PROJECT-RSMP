<%-- 
    Document   : success
    Created on : Jul 14, 2024, 7:54:30 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Success</title>
        <script type="text/javascript">
            window.onload = function() {
                alert("Recipe successfully created!");
                window.location.href = "browseRecipe.jsp"; // Redirect to the main page after the alert
            }
        </script>
    </head>
    <body>
    </body>
</html>
