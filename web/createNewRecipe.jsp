<%-- 
    Document   : createNewRecipe
    Created on : Jun 28, 2024, 12:58:32 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Healthy Meal Plans</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
        width: 1150px; /* Adjust width as needed */
        height: fit-content;
        display: flex;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #ddd;
    }
    .left-side {
        flex: 1; /* Take up remaining space */
        margin-top: 12%;
    }

.recipe-container h2 {
    position: absolute; /* Position relative to the container */
    top: 0; /* Position at the top */
    left: 50%; /* Move to the center horizontally */
    transform: translateX(-50%); /* Center horizontally */
    margin-top: 5%;
}

    .drop-zone__input {
        display: none;
    }

    .drop-zone__prompt {
        margin-top: 20px; /* Adjust as needed */
        color: #39393a93;
        font-family: inherit;
    }
    .drop-zone__thumb {
        width: 400px; /* Fixed width */
        height: 300px; /* Fixed height */
        border-radius: 10px;
        overflow: hidden;
        background-color: #cccccc;
        background-size: contain; /* Use 'contain' to ensure the entire image fits within the box */
        background-position: center; /* Center the background image */
        position: relative;
    }

    .drop-zone__thumb::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        border-radius: 10px; /* Same border radius as the container */
        box-sizing: border-box; /* Include border in dimensions */
    }
    .drop-zone {
    width: 400px;
    height: 300px;
    padding: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    font-family: source sans pro;
    font-weight: 400;
    font-size: 20px;
    cursor: pointer;
    color: #cccccc;
    border: 2px dashed black;
    border-radius: 7px;
    margin-left: 50px;
}
.text-container {
    flex: 1; /* Take up remaining space */
    margin-top: 12%;
    padding-left: 12%;
    width: 600px;
}

.form-grid {
    display: grid;
    grid-gap: 10px; /* Gap between cells */
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
textarea {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

button {
    padding: 10px;
    border-radius: 5px;
    border: none;
    background-color: #75aff1;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}
.button-container {
    margin-top: 20px; /* Adjust margin as needed */
    margin-left: 87%;
}
.adjustable-text-box {
    resize: both; /* Allow both horizontal and vertical resizing */
    font-family: inherit;
    min-height: 30px; /* Set minimum height */
    min-width: 100px; /* Set minimum width */
    max-width: 500px; /* Set maximum width */
    width: auto; /* Allow automatic width adjustment */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.ingredient-class {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    resize: both; /* Allow both horizontal and vertical resizing */
    font-family: inherit;
    min-width: 100px; /* Set minimum width */
    min-height: 30px; /* Set minimum height */
    max-width: 500px; /* Set maximum width */
    width: auto; /* Allow automatic width adjustment */
    }
    h1 {
      text-align: center;
    }
    .form-group {
      margin-bottom: 20px;
    }
    label {
      display: block;
      margin-bottom: 5px;
    }
    
    input[type="number"] {
      width: calc(100% - 120px);
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    input[type="submit"] {
      background-color: #4caf50;
      color: #fff;
      padding: 12px 24px; /* Larger padding for bigger button */
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease; /* Add transition for smoother hover effect */
    }
    input[type="submit"]:hover {
      background-color: #333; /* Dark grey color on hover */
    }
    .ingredient-group {
      display: flex;
      align-items: center;
      margin-bottom: 10px; /* Add margin between ingredient fields */
    }
    .ingredient-group input {
      margin-right: 10px;
    }
    .remove-btn {
      background-color: #ff6347;
      color: #fff;
      border: none;
      border-radius: 4px;
      padding: 6px 10px;
      cursor: pointer;
    }
    .remove-btn:hover {
      background-color: #ff4837;
    }
    .instructions-container {
        max-width: 500px; /* Adjust the width to be smaller */
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

h2 {
  text-align: center;
}

form {
  display: flex;
}

#stepsContainer {
  margin-bottom: 20px;
  max-width: 600px;
}

.step {
  display: flex;
  align-items: center; /* Center align items vertically */
  margin-bottom: 10px;
}

.step input[type="number"] {
  flex: 1; /* Adjust width to be smaller */
  margin-right: 10px;
}

.step textarea {
  flex: 8;
  margin-left: 10px;
  resize: vertical; /* Allow vertical resizing */
  min-height: 50px; /* Set a minimum height */
}

.remove-step-btn {
  background-color: #f44336; /* Red color for remove button */
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  padding: 6px 12px; /* Adjust padding */
  margin-left: 10px; /* Add margin */
}

.remove-step-btn:hover {
  background-color: #d32f2f; /* Darker red color on hover */
}

/* Styles for step description input */
.step input[type="text"] {
  flex: 9; /* Increase the width of the description input */
  margin-left: 7px; /* Add margin to separate number and description */
}

/* Styles for specific button */
.special-button {
  padding: 10px 20px;
  cursor: pointer;
  background-color: #2196f3;
  color: white;
  border: none;
  border-radius: 4px;
}

/* Styles for submit button */
button[type="submit"] {
  background-color: #4caf50;
}

/* Styles for regular button */
button[type="button"] {
  background-color: #2196f3;
}

.adjustable-dropdown {
    font-family: inherit;
    min-height: 30px; /* Set minimum height */
    min-width: 100px; /* Set minimum width */
    max-width: 590px; /* Set maximum width */
    width: auto; /* Allow automatic width adjustment */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        <div class='icon-box' >
            <a style="text-decoration: none" href="browseRecipe.html" class="material-symbols-outlined">arrow_back_ios</a>
        </div>
        <h2>Insert your recipe description</h2>
        <form method="POST" action="browseRecipe.html" enctype="multipart/form-data">
            <div class="left-side">
                <div class="drop-zone">
                    <span class="drop-zone__prompt">Drop your recipe image here or click to upload</span>
                    <input type="file" name="myFile" class="drop-zone__input">
                </div>
            </div>

            <div class="text-container">
                <div class="form-grid">
                    <b><label for="recipe-name">Recipe Title:</label></b>
                    <input type="text" name="recipeName" placeholder="Enter recipe name" rows="1" class="adjustable-text-box" required>
                    <b><label for="servings">Servings:</label></b>
                    <input type="text" name="servings" placeholder="Enter servings" rows="1" class="adjustable-text-box" required>
                    <b><label for="recipe-desc">Recipe Description:</label></b>
                    <input type="text" name="recipeDescription" placeholder="Enter a short description of your recipe (10 to 12 words)" rows="1" class="adjustable-text-box" required>

                    <b><label for="categories">Categories:</label></b>
                    <select name="categories" class="adjustable-dropdown" required>
                        <option value="" disabled selected>Select category</option>
                        <option value="Breakfast">Breakfast</option>
                        <option value="Lunch">Lunch</option>
                        <option value="Snacks">Snacks</option>
                        <option value="Dinner">Dinner</option>
                    </select>

                    <b><label for="ingredients">Ingredients:</label></b>
                    <div class="ingredient-class">
                        <div class="form-group" id="ingredients-container">
                            <div class="ingredient-group">
                                <input type="text" name="ingredientName[]" placeholder="Enter ingredient name...">
                                <input type="text" name="ingredientQuantity[]" placeholder="Enter ingredient quantity...">
                                <button type="button" class="remove-btn" onclick="removeIngredientField(this)">Remove</button>
                            </div>
                        </div>
                        <input type="button" value="Add Ingredient" onclick="addIngredientField()" style="background-color: #5e5c5c;"> <!-- Dark grey color -->
                    </div>

                    <b><label for="instructions">Instructions:</label></b>
                    <div class="instructions-container">
                            <div id="stepsContainer">
                            </div>
                            <input type="button" value="Add Instructions" style="background-color: #5e5c5c;" onclick="addStep()">
                    </div>
                </div></br>
                <button type="submit" name="Submit_Button" class="button-container">Submit</button>
            </div>
        </form>
    </div>    
    <script>
        document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
        const dropZoneElement = inputElement.closest(".drop-zone");

        dropZoneElement.addEventListener("click", (e) => {
          inputElement.click();
        });

        inputElement.addEventListener("change", (e) => {
          if (inputElement.files.length) {
            updateThumbnail(dropZoneElement, inputElement.files[0]);
          }
        });

        dropZoneElement.addEventListener("dragover", (e) => {
          e.preventDefault();
          dropZoneElement.classList.add("drop-zone--over");
        });

        ["dragleave", "dragend"].forEach((type) => {
          dropZoneElement.addEventListener(type, (e) => {
            dropZoneElement.classList.remove("drop-zone--over");
          });
        });

        dropZoneElement.addEventListener("drop", (e) => {
          e.preventDefault();

          if (e.dataTransfer.files.length) {
            inputElement.files = e.dataTransfer.files;
            updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
          }

          dropZoneElement.classList.remove("drop-zone--over");
        });
      });

      /**
       * Updates the thumbnail on a drop zone element.
       *
       * @param {HTMLElement} dropZoneElement
       * @param {File} file
       */
      function updateThumbnail(dropZoneElement, file) {
        let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");

        // First time - remove the prompt
        if (dropZoneElement.querySelector(".drop-zone__prompt")) {
          dropZoneElement.querySelector(".drop-zone__prompt").remove();
        }


        // First time - there is no thumbnail element, so lets create it
        if (!thumbnailElement) {
          thumbnailElement = document.createElement("div");
          thumbnailElement.classList.add("drop-zone__thumb");
          dropZoneElement.appendChild(thumbnailElement);
        }

        thumbnailElement.dataset.label = file.name;

        // Show thumbnail for image files
        if (file.type.startsWith("image/")) {
          const reader = new FileReader();

          reader.readAsDataURL(file);
          reader.onload = () => {
            thumbnailElement.style.backgroundImage = `url('${reader.result}')`;
          };
        } else {
          thumbnailElement.style.backgroundImage = null;
        }
      }

      $__default["default"](document).on('click', SELECTOR_DATA_REFRESH, function (event) {
        if (event) {
          event.preventDefault();
        }

        CardRefresh._jQueryInterface.call($__default["default"](this), 'load');
      });
      $__default["default"](function () {
        $__default["default"](SELECTOR_DATA_REFRESH).each(function () {
          CardRefresh._jQueryInterface.call($__default["default"](this));
        });
      });
      /**
       * jQuery API
       * ====================================================
       */

      $__default["default"].fn[NAME$e] = CardRefresh._jQueryInterface;
      $__default["default"].fn[NAME$e].Constructor = CardRefresh;

      $__default["default"].fn[NAME$e].noConflict = function () {
        $__default["default"].fn[NAME$e] = JQUERY_NO_CONFLICT$e;
        return CardRefresh._jQueryInterface;
      };

      function updateThumbnail(dropZoneElement, file) {
        let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");

        // First time - remove the prompt
        if (dropZoneElement.querySelector(".drop-zone__prompt")) {
          dropZoneElement.querySelector(".drop-zone__prompt").remove();
        }


        // First time - there is no thumbnail element, so lets create it
        if (!thumbnailElement) {
          thumbnailElement = document.createElement("div");
          thumbnailElement.classList.add("drop-zone__thumb");
          dropZoneElement.appendChild(thumbnailElement);
        }

        thumbnailElement.dataset.label = file.name;

        // Show thumbnail for image files
        if (file.type.startsWith("image/")) {
          const reader = new FileReader();

          reader.readAsDataURL(file);
          reader.onload = () => {
            thumbnailElement.style.backgroundImage = `url('${reader.result}')`;
          };
        } else {
          thumbnailElement.style.backgroundImage = null;
        }
      }

      function addIngredientField() {
        const container = document.getElementById("ingredients-container");
        const newInputGroup = document.createElement("div");
        newInputGroup.classList.add("ingredient-group");
        newInputGroup.innerHTML = `
          <input type="text" name="ingredientName[]" placeholder="Enter ingredient name...">
          <input type="text" name="ingredientQuantity[]" placeholder="Enter ingredient quantity...">
        `;
        container.appendChild(newInputGroup);
      }
    </script>

    <script>
        function addIngredientField() {
          const container = document.getElementById("ingredients-container");
          const newInputGroup = document.createElement("div");
          newInputGroup.classList.add("ingredient-group");
          newInputGroup.innerHTML = `
            <input type="text" name="ingredientName[]" placeholder="Enter ingredient name...">
            <input type="text" name="ingredientQuantity[]" placeholder="Enter ingredient quantity...">
            <button type="button" class="remove-btn" onclick="removeIngredientField(this)">Remove</button>
          `;
          container.appendChild(newInputGroup);
        }
    
        function removeIngredientField(btn) {
          const container = document.getElementById("ingredients-container");
          const ingredientGroup = btn.parentElement;
          container.removeChild(ingredientGroup);
        }

        // Initialize stepNumber to 1
  let stepNumber = 1;

window.onload = function() {
  if (localStorage.getItem('hasStep') === null) {
    addStep(); // Add a default step if none exist
    localStorage.setItem('hasStep', true); // Store a flag in Local Storage
  }
}

// Function to add a new step
function addStep() {
        const stepsContainer = document.getElementById('stepsContainer');
        const stepDiv = document.createElement('div');
        stepDiv.classList.add('step');

        const stepNumberInput = document.createElement('input');
        stepNumberInput.type = 'number';
        stepNumberInput.value = stepNumber;
        stepNumberInput.disabled = true;
        stepDiv.appendChild(stepNumberInput);

        const stepDescriptionTextarea = document.createElement('textarea');
        stepDescriptionTextarea.name = 'instructionStep[]'; // Set the name attribute
        stepDescriptionTextarea.placeholder = 'Enter step description';
        stepDescriptionTextarea.addEventListener('input', function() {
            autoAdjustRows(this);
        });
        stepDiv.appendChild(stepDescriptionTextarea);

        const removeStepBtn = document.createElement('button');
        removeStepBtn.type = 'button';
        removeStepBtn.classList.add('remove-btn');
        removeStepBtn.textContent = 'Remove';
        removeStepBtn.addEventListener('click', function() {
            stepDiv.remove();
            renumberSteps();
        });
        stepDiv.appendChild(removeStepBtn);

        stepsContainer.appendChild(stepDiv);

        stepNumber++;
    }

    // Function to renumber steps when a step is removed
    function renumberSteps() {
        const steps = document.querySelectorAll('.step input[type="number"]');
        steps.forEach((step, index) => {
            step.value = index + 1;
        });
    }

    // Function to automatically adjust textarea height based on content
    function autoAdjustRows(textarea) {
        textarea.style.height = 'auto';
        textarea.style.height = textarea.scrollHeight + 'px';
    }

    // Function to remove an ingredient field
    function removeIngredientField(btn) {
        const container = document.getElementById("ingredients-container");
        const ingredientGroup = btn.parentElement;
        container.removeChild(ingredientGroup);
    }

    // Function to add an ingredient field
    function addIngredientField() {
        const container = document.getElementById("ingredients-container");
        const newInputGroup = document.createElement("div");
        newInputGroup.classList.add("ingredient-group");
        newInputGroup.innerHTML = `
            <input type="text" name="ingredientName[]" placeholder="Enter ingredient name...">
            <input type="text" name="ingredientQuantity[]" placeholder="Enter ingredient quantity...">
            <button type="button" class="remove-btn" onclick="removeIngredientField(this)">Remove</button>
        `;
        container.appendChild(newInputGroup);
    }

    // Ensure that at least one step is added on page load
    window.onload = function() {
        if (localStorage.getItem('hasStep') === null) {
            addStep(); // Add a default step if none exist
            localStorage.setItem('hasStep', true); // Store a flag in Local Storage
        }
    }
</script>
    
</body>
</html>