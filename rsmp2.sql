-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2024 at 09:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsmp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `meal_plans`
--

CREATE TABLE `meal_plans` (
  `meal_plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `meal_date` date NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_plans`
--

INSERT INTO `meal_plans` (`meal_plan_id`, `user_id`, `meal_date`, `category`) VALUES
(3, 1, '2024-07-17', 'breakfast'),
(4, 1, '2024-07-17', 'breakfast'),
(5, 1, '2024-07-18', 'breakfast'),
(6, 1, '2024-07-20', 'dinner'),
(7, 2, '2024-07-21', 'snacks'),
(8, 2, '2024-07-18', 'breakfast'),
(9, 2, '2024-07-18', 'lunch'),
(10, 3, '2024-07-17', 'lunch'),
(11, 3, '2024-07-17', 'breakfast'),
(12, 3, '2024-07-17', 'dinner'),
(13, 4, '2024-07-19', 'dinner'),
(14, 4, '2024-07-19', 'snacks'),
(15, 4, '2024-07-19', 'breakfast'),
(17, 1, '2024-07-18', 'snacks'),
(19, 5, '2024-07-20', 'lunch'),
(20, 5, '2024-07-20', 'snacks');

-- --------------------------------------------------------

--
-- Table structure for table `meal_plan_recipes`
--

CREATE TABLE `meal_plan_recipes` (
  `meal_plan_recipe_id` int(11) NOT NULL,
  `meal_plan_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_plan_recipes`
--

INSERT INTO `meal_plan_recipes` (`meal_plan_recipe_id`, `meal_plan_id`, `recipe_id`) VALUES
(3, 3, 2),
(4, 4, 3),
(5, 5, 2),
(7, 6, 3),
(8, 7, 4),
(9, 8, 2),
(10, 9, 1),
(11, 10, 1),
(12, 11, 4),
(13, 12, 5),
(15, 13, 1),
(16, 14, 4),
(17, 15, 2),
(19, 17, 7),
(21, 19, 9),
(22, 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_name` varchar(100) NOT NULL,
  `recipe_image` varchar(255) DEFAULT NULL,
  `recipe_description` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `servings` int(11) DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `user_id`, `recipe_name`, `recipe_image`, `recipe_description`, `category`, `servings`, `ingredients`, `instructions`) VALUES
(1, 1, 'Ayam gepuk', 'ayamgepuk.jpg', 'Savor tender chicken paired with fiery sambal in this quick and flavorful Indonesian favorite. Perfect for spice lovers!', 'Lunch', 4, '1. 4 chicken pieces (thighs or breasts)\r\n2. 2 cups water\r\n3. 1 stalk lemongrass (bruised)\r\n4. 4 kaffir lime leaves\r\n5. 1 tsp salt\r\n6. 1 tsp sugar\r\n7. 1 tbsp tamarind paste (dissolved in 1/4 cup water)\r\nSpice Paste:\r\n8. 5 garlic cloves\r\n9. 8 shallots\r\n10. 5 red chili peppers\r\n11. 1 tsp turmeric powder\r\n12. 1 tsp coriander powder\r\n13. 1 tsp salt\r\n14. 1 tbsp oil\r\nSambal:\r\n15. 10 red chili peppers\r\n16. 5 garlic cloves\r\n17. 5 shallots\r\n18. 1 tsp salt\r\n19. 1 tsp sugar\r\n20. 1/4 cup vegetable oil\r\n21. 1 tbsp lime juice', '1. Boil chicken with water, lemongrass, lime leaves, salt, and sugar until tender (20-30 mins). Remove and cool.\r\n2. Blend spice paste ingredients and sauté until fragrant. Coat chicken with paste and marinate for 30 mins.\r\n3. Fry marinated chicken until golden brown. Set aside.\r\n4. Blend sambal ingredients and sauté until fragrant. Add salt, sugar, and lime juice. Cook for a few more mins.\r\n5. Top fried chicken with sambal. Serve with cucumber, lettuce, and steamed rice.\r\n6. Ready to serve!\r\n'),
(2, 1, 'Scrambled Egg', 'scrambled-eggs.jpg', 'Elevate scrambled eggs with smoked trout for a gourmet twist. Effortless and delicious!', 'Breakfast', 2, '1. Eggs\r\n2. Butter - for flavour and greasing the skillet\r\n3. Milk(optional) - makes the eggs extra moist and creamy\r\n4. Salt and pepper', 'Step 1: Whisk the eggs, milk, salt and pepper\r\nStep 2: Melt butter in a non-stick pan or well-seasoned skillet over medium heat (or medium low if your stove is strong)\r\nStep 3: Add egg mixture, wait 5 seconds (for the base to just start setting) then start leisurely (not frantically!) running a rubber spatula or flat edge wooden spoon in long strokes back and forth across the pan, and around the edges.\r\nStep 4: After 30 seconds, also start gently folding the eggs over (scoop and gently flip). Keep pushing/folding for 60 seconds total cook time or until raw runny egg no longer spreads out onto the pan and you have a pile of soft, custardy egg, ever so slightly underdone\r\nStep 5: Remove from the stove, stir / fold for another 10 seconds or until cooked to your taste. If you want it cooked more, return it to the stove briefly. Ready to go!'),
(3, 1, 'Ondeh - ondeh', 'ondeh-ondeh.jpg', '\"Irresistible chewy rice balls filled with a gooey palm sugar surprise!\"', 'Snacks', 1, '1. 250 g (8oz) glutinous rice flour\r\n2. 200 ml Pandan juice\r\n3. 100 g (3Â½ oz) grated coconut\r\n4. 1 pinch sea salt\r\n5. 150 g (5Â½ oz) Gula Melaka or palm sugar, finely chopped', 'Step 1: In a large bowl, combine the glutinous rice flour with Pandan juice and knead lightly. Pinch a small piece of the dough (about 40 g/ 1Â½ oz.) and drop it into boiling water\r\nStep 2: When the dough rises up the surface, remove it with a slotted spoon and shake off the excess water. Mix it back into the main dough and knead well to form a smooth dough. Cover the dough and set aside for about 15 minutes.\r\nStep 3: Mix the grated coconut with a pinch of salt and steam for about 2 - 3 minutes and let it cool completely.\r\nStep 4: Bring a pot of water to boil. Pinch a small piece of dough (about 15 g/ Â½oz each) and flatten lightly. Fill the center of the dough with Gula Melaka or palm sugar. Roll it in your palms to form a smooth ball. Repeat the same until all ingredients are used up\r\nStep 5: Cook the onde-onde balls in boiling water. When they float to the surface, remove them with a slotted spoon and shake off the excess water. Coat the onde-onde with grated coconut and ready to go!'),
(4, 2, 'Apam Balik', 'apam balik.png', '\"Delicious Malaysian apam balik: crispy, fluffy pancakes filled with sweet peanut goodness.\"', 'Snacks', 12, '1. 200 ml milk\r\n2. 60 ml oil\r\n3. 2 egg(s)\r\n4. 160 g wheat flour\r\n5. 3 tsp baking powder\r\n6. 1/2 tsp salt\r\n7. 25 g unsalted butter \r\n8. 3 tbsp creamed corn\r\n9. 45 g sugar\r\n10. 3 tbsp peanuts', '1. Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n2. Spread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n3. Add butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n4. Cut into wedges and best eaten when it is warm.\r\n'),
(5, 3, 'Nasi Lemak', 'nasi-lemak.jpg', '\"Aromatic coconut rice, the star of Malaysia! Cooked with pandan leaves for a fragrant twist.\"', 'Breakfast', 4, 'Coconut milk rice:\r\n1. 3 cups jasmine rice or any white long-grain rice\r\n2. 1/2 cup coconut cream (thick coconut milk)\r\n3. 3 cups water add another 1/2 cup if cooking on the stove\r\n4. 2 pandan leaves (screw pine leaves-knotted)\r\n5. 1 stalk lemongrass (bruised)\r\nFried anchovies and peanuts:\r\n6. 2 tsp cooking oil divided\r\n7. 1 cup dried anchovies\r\n8. 1 cup dry roasted peanuts\r\n9. Pinch of sugar\r\nGarnish:\r\n10. 1 small cucumber (washed and thinly sliced)\r\nServing suggestion:\r\n11. Sambal nasi lemak', 'Cooking the rice:\r\n1. If you have a rice cooker, life couldn\'t be any easier, just put everything in the rice cooker and press the cook button. Wait 10 minutes before opening the lid to fluff the rice\r\n2. If you don\'t own one, use a heavy-bottom pot. Bring the water, coconut milk, pandan leaves, and lemongrass to a boil and then add the rice. Bring it back to a gentle simmer and then close the lid. Cook for 5 minutes and then give it a stir to prevent coconut milk from catching. Close the lid back and cook for another 5 minutes. Turn off the heat. Wait 10 minutes before opening the lid to fluff the rice\r\nFried anchovies:\r\n3. Preheat a medium-size pan with 1 tsp cooking oil. Add anchovies and pan fry until crispy. Add a small pinch of salt and sugar and dish out. In the same pan, add another 1 tsp of oil. Add the peanuts and cook until the peanuts are lightly brown. Add a pinch of sugar and salt. Turn off the heat and give it a good stir to mix everything. Remove from the heat\r\nWhen ready to serve:\r\n4. Portion the rice on the plate. Place the sambal, dried anchovies and peanuts, and few slices of cucumber on the side of the plate. Ready to go.'),
(6, 4, 'Mee Goreng', 'mee goreng.png', '\"Busy weeknight? This quick and easy mee goreng is your dinnertime savior!\"', 'Dinner', 3, '1. 150 grams yellow noodles (fresh or dried)\r\n2. 1 tablespoon vegetable oil\r\n3. 1 onion (diced)\r\n4. 2 cloves garlic(minced)\r\n5. 1-2 birds eye chilies, sliced (adjust for spice preference)\r\n6. 100 grams chicken breast, sliced (or other protein like tofu)\r\n9. 100 grams bean sprouts\r\n10. 2 eggs, beaten\r\n11. 2 tablespoons kecap manis (sweet soy sauce)\r\n12. 1 tablespoon oyster sauce\r\n13. 1 tablespoon soy sauce, 1/2 teaspoon ground turmeric, Salt and pepper to taste', '1. Cook Noodles: If using dried noodles, cook them according to package instructions. Drain and set aside.\r\n2. Heat Oil: Heat oil in a wok or large pan over medium heat.\r\n3. SautÃ© Aromatics: Add onion and cook until softened. Then, add garlic and chilies, stir-frying for another minute until fragrant.\r\n4. Cook Protein: Add chicken (or other protein) and cook until browned.\r\n5. Scramble Eggs: Push ingredients to the side and add eggs. Scramble the eggs until cooked through.\r\n6. Incorporate Noodles: Add cooked noodles and bean sprouts to the pan. Toss to combine.\r\n7. Seasoning: Pour in kecap manis, oyster sauce, soy sauce, and turmeric. Toss everything together to coat the noodles evenly.\r\n8. Adjust Seasoning: Season with salt and pepper to taste.\r\n9. Serve: Serve hot and enjoy!\r\n'),
(7, 1, 'Crispy Pisang Goreng', 'goreng pisang.png', 'Indulge in the ultimate snack: perfectly crispy Goreng Pisang with a sweet, caramelized banana center!', 'Snacks', 3, '1. 1 cup all-purpose flour\r\n2. 1/2 cup rice flour (optional)\r\n3. 1 tsp baking powder\r\n4. 1/4 tsp salt\r\n5. 3/4 cup water (adjust for consistency)', '1. Prepare Batter: Whisk together dry ingredients for the base batter. Gradually add water until you reach a pourable consistency (adjust for chosen variation).\r\n2. Prepare Bananas: Peel and slice bananas into desired shapes (whole, halved, or diagonally sliced).\r\n3. Heat Oil: Heat enough oil in a deep pan or wok for frying.\r\n4. Dip and Fry: Dip banana slices in batter, coating them completely. Fry in batches until golden brown and crispy (around 3-4 minutes).\r\n5. Drain and Serve: Drain on paper towels to remove excess oil. Serve immediately, hot and crispy. Enjoy plain or with your favorite dipping sauce (sweet chili, condensed milk, etc.).\r\n'),
(8, 4, 'Nasi Goreng', 'nasi goreng.png', 'Experience the perfect blend of savory, spicy, and aromatic flavors in every bite of Nasi Goreng, a delightful fried rice dish.', 'Dinner', 3, '1. 2 cups cooked and cooled white rice (preferably day-old)\r\n2. 2 tablespoons vegetable oil\r\n3. 1 onion, diced\r\n4. 2 cloves garlic (minced)\r\n5. 1-2 red chilies, sliced (adjust for spice preference)\r\n6. 100 grams protein (optional - diced chicken, shrimp, tofu, etc.)\r\n7. 50 grams frozen peas\r\n8. 1 egg, beaten\r\n9. 2 tablespoons kecap manis (sweet soy sauce)\r\n10. 1 tablespoon soy sauce\r\n11. 1/2 teaspoon shrimp paste (optional)\r\n12. Salt and pepper to taste, Fried shallots (optional), for garnish', '1. Prepare Rice: If you don\'t have leftover rice, cook the rice according to package instructions and let it cool completely before using. This step helps prevent the rice from becoming mushy when fried.\r\n2. Heat Oil: Heat oil in a wok or large pan over medium heat.\r\n3. SautÃ© Aromatics: Add onion and cook until softened. Then, add garlic and chilies, stir-frying for another minute until fragrant.\r\n4. Cook Protein (Optional): If using protein, add it to the pan and cook until browned and cooked through.\r\n5. Add Peas: Add the frozen peas and cook for another minute.\r\n6. Scramble Eggs: Push the ingredients to the side and add the beaten egg. Scramble the egg until cooked through, then incorporate it back with the other ingredients.\r\n7. Incorporate Rice: Add the cooled rice to the pan and break it up with a spatula.\r\n8. Seasoning: Pour in kecap manis, soy sauce, and shrimp paste (if using). Stir-fry everything together for a few minutes to allow the flavors to meld.\r\n9. Adjust Seasoning: Season with salt and pepper to taste.\r\n10. Serve: Garnish with fried shallots (optional) and serve hot.\r\n'),
(9, 5, 'Roti Jala', 'roti jala.jpg', 'Roti Jala, lacy Malaysian pancakes, are perfect for soaking up curry flavors and fun to make with their intricate design', 'Lunch', 4, '1. 1 cup all-purpose flour\r\n2. 1 egg\r\n3. 1 cup coconut milk\r\n4. 1/2 cup water\r\n5. 1/2 teaspoon turmeric powder\r\n6. 1/2 teaspoon salt\r\n7. Oil for greasing the pan', '1. In a bowl, whisk together the flour, egg, coconut milk, water, turmeric powder, and salt until smooth.\r\n2. Strain the batter to remove any lumps.\r\n3. Heat a non-stick pan over medium heat and lightly grease with oil.\r\n4. Pour the batter into a Roti Jala mold or squeeze bottle.\r\n5. Drizzle the batter in a circular motion to create a lacy pattern in the pan.\r\n6. Cook for 1-2 minutes until set, then fold the pancake into quarters and remove from the pan.\r\n7. Repeat with the remaining batter.\r\n8.Serve warm with your favorite curry');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'tyraasmd', 'tyraasmd@gmail.com', 'athirah'),
(2, 'mmaisarah', 'mmaisarah@gmail.com', 'mmai1152'),
(3, 'alyasyaf', 'syafikaalya10@gmail.com', '123456'),
(4, 'rudyy', 'rudyykim@gmail.com', 'rudykim'),
(5, 'amniinara', 'amnii@gmail.com', 'inara');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meal_plans`
--
ALTER TABLE `meal_plans`
  ADD PRIMARY KEY (`meal_plan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `meal_plan_recipes`
--
ALTER TABLE `meal_plan_recipes`
  ADD PRIMARY KEY (`meal_plan_recipe_id`),
  ADD KEY `meal_plan_id` (`meal_plan_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meal_plans`
--
ALTER TABLE `meal_plans`
  MODIFY `meal_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `meal_plan_recipes`
--
ALTER TABLE `meal_plan_recipes`
  MODIFY `meal_plan_recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meal_plans`
--
ALTER TABLE `meal_plans`
  ADD CONSTRAINT `meal_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `meal_plan_recipes`
--
ALTER TABLE `meal_plan_recipes`
  ADD CONSTRAINT `meal_plan_recipes_ibfk_1` FOREIGN KEY (`meal_plan_id`) REFERENCES `meal_plans` (`meal_plan_id`),
  ADD CONSTRAINT `meal_plan_recipes_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
