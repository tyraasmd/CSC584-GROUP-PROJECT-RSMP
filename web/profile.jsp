<%-- 
    Document   : profile
    Created on : Jun 28, 2024, 12:56:14 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        margin-left: 962px;
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

        .ui-w-80 {
            width : 80px !important;
            height: auto;
        }

        .btn-default {
            border-color: rgba(24, 28, 33, 0.1);
            background  : rgba(0, 0, 0, 0);
            color       : #4E5155;
        }

        label.btn {
            margin-bottom: 0;
        }

        .btn-outline-primary {
            border-color: #26B4FF;
            background  : transparent;
            color       : #26B4FF;
        }

        .btn {
            cursor: pointer;
        }

        .text-light {
            color: #babbbc !important;
        }

        .card {
            background-clip: padding-box;
            box-shadow     : 0 1px 4px rgba(24, 28, 33, 0.012);
        }

        .row-bordered {
            overflow: hidden;
        }

        .account-settings-fileinput {
            position  : absolute;
            visibility: hidden;
            width     : 1px;
            height    : 1px;
            opacity   : 0;
        }

        .account-settings-links .list-group-item.active {
            font-weight: bold !important;
        }

        html:not(.dark-style) .account-settings-links .list-group-item.active {
            background: #92a8d1 !important;
            color: white !important;
        }

        .account-settings-multiselect~.select2-container {
            width: 100% !important;
        }

        .light-style .account-settings-links .list-group-item {
            padding     : 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }

        .light-style .account-settings-links .list-group-item.active {
            color: #4e5155 !important;
        }

        .material-style .account-settings-links .list-group-item {
            padding     : 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }

        .material-style .account-settings-links .list-group-item.active {
            color: #4e5155 !important;
        }

        .dark-style .account-settings-links .list-group-item {
            padding     : 0.85rem 1.5rem;
            border-color: rgba(255, 255, 255, 0.03) !important;
        }

        .dark-style .account-settings-links .list-group-item.active {
            color: #fff !important;
        }

        .light-style .account-settings-links .list-group-item.active {
            color: #4E5155 !important;
        }

        .light-style .account-settings-links .list-group-item {
            padding     : 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }

        .history {
            padding: 20px;
        }

        .history button {
            background-color: #84b2c2;
            border: none;
            color: black;
            padding: 5px;
            cursor: pointer;
            border-radius: 5px;
        }

        .history button:hover {
            background-color: #58a2bb;
            color: black;
        }

        .history h1 {
        text-align: center;
    }
    .history ul {
        list-style-type: none;
        padding: 0;
    }
    .history li {
        border-bottom: 1px solid #ccc;
        padding: 10px 0;
    }
    .pagination {
        text-align: center;
        margin-top: 20px;
    }
    .pagination a {
        text-decoration: none;
        color: #333;
        padding: 5px 10px;
        border: 1px solid #ccc;
        margin: 0 5px;
    }
    .pagination a.active {
        background-color: #333;
        color: #fff;
    }

    .recipe-container {
      display: flex;
      flex-direction: column; /* Stack elements vertically */
      width: 800px; /* Adjust width as needed */
      margin: 50px auto;
      padding: 20px;
      padding-top: 10px;
    }

    table {
      width: 80%;
      border-collapse: collapse; /* Removes borders between cells */
    }

    th, td {
      padding: 10px;
      border: 1px solid #ddd; /* Adds a light gray border */
      text-align: left; /* Left-align content */
    }

    th {
      background-color: #f2f2f2; /* Light gray background for headers */
    }

    .btn {
      padding: 10px 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      position: relative;
    }
    .btn-view {
        background-color: forestgreen;
        color: white;
    }

    .btn-update {
      background-color: #296AAE; /* Light blue */
      color: white;
    }

    .btn-delete {
      background-color: #FF0000; /* Red */
      color: white;
    }

    </style>
</head>

<body>
    <header class="header">
        <nav class="nav">
            <div class="container2">
            <ul>
              <li><a href="index.jsp">Dashboard</a></li>
              <li><a href="browseRecipe.jsp">Browse Recipe</a></li>
              <li><a href="mealPlanner.jsp">Meal Planner</a></li>
              <li><a href="profile.jsp">Profile</a></li>
            </ul>
          </div>
        </nav>
      </header>
    <div class="container light-style flex-grow-1 container-p-y">
        <h4 class="font-weight-bold mb-4">
            User Profile
        </h4>
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general">General</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-change-password">Change password</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-my-recipe">My Recipe</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-history">History</a>
                        <a class="list-group-item list-group-item-action" style="background:red; color: white" data-toggle="list"
                            href="#account-connections">Log Out</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">
                            <hr class="border-light m-0">
                            <div class="card-body">
                                <div class="form-group">
                                    <label class="form-label">Username</label>
                                    <input type="text" class="form-control mb-1" value="tyraaaa">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">E-mail</label>
                                    <input type="text" class="form-control mb-1" value="tyraaaa@mail.com">
                                    <div class="alert alert-warning mt-3">
                                        Your email is not confirmed. Please check your inbox.<br>
                                        <a href="javascript:void(0)">Resend confirmation</a>
                                    </div>
                                </div>
                                <div class="text-right mt-3">
                                    <button type="button" class="btn btn-primary">Save changes</button>&nbsp;
                                    <button type="button" class="btn btn-default">Cancel</button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-change-password">
                            <div class="card-body pb-2">
                                <div class="form-group">
                                    <label class="form-label">Current password</label>
                                    <input type="password" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">New password</label>
                                    <input type="password" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Repeat new password</label>
                                    <input type="password" class="form-control">
                                </div>
                                <div class="text-right mt-3">
                                    <button type="button" class="btn btn-primary">Save changes</button>&nbsp;
                                    <button type="button" class="btn btn-default">Cancel</button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-my-recipe">
                            <section class="recipe-container">
                                <h2>My Recipes</h2>
                                <table>
                                  <thead>
                                    <tr>
                                      <th>Date Created</th>
                                      <th>Recipe Name</th>
                                      <th>Categories</th>
                                      <th></th>
                                      <th></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>2024-05-08</td>
                                      <td>Scrambled Eggs with Toast</td>
                                      <td>Breakfast</td>
                                      <td><button class="btn btn-update">Update</button></td>
                                      <td><button class="btn btn-delete">Delete</button></td>
                                    </tr>
                                    <tr>
                                      <td>2024-05-07</td>
                                      <td>Mee goreng</td>
                                      <td>Dinner</td>
                                      <td><button class="btn btn-update">Update</button></td>
                                      <td><button class="btn btn-delete">Delete</button></td>
                                    </tr>
                                    <tr>
                                        <td>2024-04-29</td>
                                        <td>Ondeh-ondeh</td>
                                        <td>Snacks</td>
                                        <td><button class="btn btn-update">Update</button></td>
                                        <td><button class="btn btn-delete">Delete</button></td>
                                      </tr>
                                      <tr>
                                        <td>2024-04-15</td>
                                        <td>Nasi Lemak</td>
                                        <td>Breakfast</td>
                                        <td><button class="btn btn-update">Update</button></td>
                                        <td><button class="btn btn-delete">Delete</button></td>
                                      </tr>
                                  </tbody>
                                </table>
                              </section>
                        </div>
                        <div class="tab-pane fade" id="account-history">
                            <section class="recipe-container">
                                <h2>History</h2>
                                <div class="date">
                                <label for="date">Select Date:</label>
                                <input type="date" id="date" name="date"><br><br>
                              </div>
                                <table>
                                  <thead>
                                    <tr>
                                      <th>Date Created</th>
                                      <th>Recipe Name</th>
                                      <th>Categories</th>
                                      <th></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>2024-04-18</td>
                                      <td>Scrambled Eggs with Toast</td>
                                      <td>Breakfast</td>
                                      <td><button class="btn btn-delete">Delete</button></td>
                                    </tr>
                                    <tr>
                                      <td>2024-04-18</td>
                                      <td>Mee goreng</td>
                                      <td>Dinner</td>
                                      <td><button class="btn btn-delete">Delete</button></td>
                                    </tr>
                                    <tr>
                                        <td>2024-04-20</td>
                                        <td>Ondeh-ondeh</td>
                                        <td>Snacks</td>
                                        <td><button class="btn btn-delete">Delete</button></td>
                                      </tr>
                                      <tr>
                                        <td>2024-04-25</td>
                                        <td>Nasi Lemak</td>
                                        <td>Breakfast</td>
                                        <td><button class="btn btn-delete">Delete</button></td>
                                      </tr>
                                  </tbody>
                                </table>
                              </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
