package dao;

import com.rspm.model.MealPlan;
import connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MealPlanDAO {

    public List<MealPlan> getMealPlansByUserId(int userId) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT mp.meal_plan_id, mp.meal_date, mp.category, r.recipe_name, r.recipe_image FROM meal_plans mp INNER JOIN meal_plan_recipes mpr ON mp.meal_plan_id = mpr.meal_plan_id INNER JOIN recipes r ON mpr.recipe_id = r.recipe_id WHERE mp.user_id = ?";
        List<MealPlan> mealPlans = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                MealPlan mealPlan = new MealPlan();
                mealPlan.setMealPlanId(rs.getInt("meal_plan_id"));
                mealPlan.setMealDate(rs.getString("meal_date"));
                mealPlan.setCategory(rs.getString("category"));
                mealPlan.setRecipeName(rs.getString("recipe_name"));
                mealPlan.setRecipeImage(rs.getString("recipe_image"));
                mealPlans.add(mealPlan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mealPlans;
    }
    
    public boolean addRecipeToMealPlan(int userId, int recipeId, String mealCategory, String mealDate) {
        Connection conn = DBConnection.getConnection();
        String insertMealPlanSQL = "INSERT INTO meal_plans (user_id, meal_date, category) VALUES (?, ?, ?)";
        String insertMealPlanRecipeSQL = "INSERT INTO meal_plan_recipes (meal_plan_id, recipe_id) VALUES (?, ?)";

        try (PreparedStatement stmt1 = conn.prepareStatement(insertMealPlanSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                PreparedStatement stmt2 = conn.prepareStatement(insertMealPlanRecipeSQL)) {

            // Insert into meal_plans
            stmt1.setInt(1, userId);
            stmt1.setString(2, mealDate);
            stmt1.setString(3, mealCategory);
            int rowsAffected = stmt1.executeUpdate();

            if (rowsAffected > 0) {
                // Retrieve the generated meal_plan_id
                ResultSet generatedKeys = stmt1.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int mealPlanId = generatedKeys.getInt(1);

                    // Insert into meal_plan_recipes
                    stmt2.setInt(1, mealPlanId);
                    stmt2.setInt(2, recipeId);
                    stmt2.executeUpdate();
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}