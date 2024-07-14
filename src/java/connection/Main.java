/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

/**
 *
 * @author HP
 */
import connection.DBConnection;
import java.sql.Connection;

public class Main {
    public static void main(String[] args) {
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            System.out.println("Database connection established successfully.");
        } else {
            System.out.println("Failed to establish database connection.");
        }
    }
}
