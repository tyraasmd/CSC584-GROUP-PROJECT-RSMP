package dao;

import com.rspm.model.MealPlan;
import com.rspm.model.Recipe;
import connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MealPlanDAO {

    public int saveMealPlan(MealPlan mealPlan) {
        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO meal_plans (user_id, meal_date, category) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, mealPlan.getUserId());
            stmt.setString(2, mealPlan.getMealDate());
            stmt.setString(3, mealPlan.getCategory());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Return generated meal plan ID
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean addRecipeToMealPlan(int mealPlanId, int recipeId) {
        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO meal_plan_recipes (meal_plan_id, recipe_id) VALUES (?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, mealPlanId);
            stmt.setInt(2, recipeId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public MealPlan getMealPlanByUserDateAndCategory(int userId, String mealDate, String category) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM meal_plans WHERE user_id = ? AND meal_date = ? AND category = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setString(2, mealDate);
            stmt.setString(3, category);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                MealPlan mealPlan = new MealPlan();
                mealPlan.setMealPlanId(rs.getInt("meal_plan_id"));
                mealPlan.setUserId(rs.getInt("user_id"));
                mealPlan.setMealDate(rs.getString("meal_date"));
                mealPlan.setCategory(rs.getString("category"));
                return mealPlan;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<MealPlan> getMealPlansByUserId(int userId) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM meal_plans WHERE user_id = ?";
        List<MealPlan> mealPlans = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                MealPlan mealPlan = new MealPlan();
                mealPlan.setMealPlanId(rs.getInt("meal_plan_id"));
                mealPlan.setUserId(rs.getInt("user_id"));
                mealPlan.setMealDate(rs.getString("meal_date"));
                mealPlan.setCategory(rs.getString("category"));
                mealPlans.add(mealPlan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mealPlans;
    }
}
