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
    
    public MealPlan getMealPlanById(int mealPlanId) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM meal_plans WHERE meal_plan_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, mealPlanId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                MealPlan mealPlan = new MealPlan();
                mealPlan.setMealPlanId(rs.getInt("meal_plan_id"));
                mealPlan.setUserId(rs.getInt("user_id"));
                mealPlan.setMealDate(rs.getString("meal_date"));
                mealPlan.setCategory(rs.getString("category"));
                mealPlan.setRecipeId(rs.getInt("recipe_id"));
                return mealPlan;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<MealPlan> getMealPlansWithRecipesByUserId(int userId) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT mp.meal_plan_id, mp.user_id, mp.meal_date, mp.category, r.recipe_id, r.recipe_name "
                + "FROM meal_plans mp "
                + "JOIN meal_plan_recipes mpr ON mp.meal_plan_id = mpr.meal_plan_id "
                + "JOIN recipes r ON mpr.recipe_id = r.recipe_id "
                + "WHERE mp.user_id = ?";
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
                mealPlan.setRecipeId(rs.getInt("recipe_id"));
                mealPlan.setRecipeName(rs.getString("recipe_name"));
                mealPlans.add(mealPlan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mealPlans;
    }
    public boolean deleteMealPlanRecipe(int mealPlanId, int recipeId) {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM meal_plan_recipes WHERE meal_plan_id = ? AND recipe_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, mealPlanId);
            stmt.setInt(2, recipeId);
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                if (!mealPlanHasRecipes(mealPlanId)) {
                    deleteMealPlan(mealPlanId);
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean mealPlanHasRecipes(int mealPlanId) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM meal_plan_recipes WHERE meal_plan_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, mealPlanId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void deleteMealPlan(int mealPlanId) {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM meal_plans WHERE meal_plan_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, mealPlanId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
