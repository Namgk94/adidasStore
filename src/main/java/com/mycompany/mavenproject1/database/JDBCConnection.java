package com.mycompany.mavenproject1.database;

import com.mycompany.mavenproject1.model.Order;
import com.mycompany.mavenproject1.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author NAM
 */
public class JDBCConnection {

    public static Connection getJDBCConnection() {
        final String url = "jdbc:mysql://localhost:3306/databasename";
        final String user = "root";
        final String password = "123456";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
    }
    
    public static int countCurrentUserID() throws SQLException {
        String sql = "select count(userID) from user";
        Statement stm = null;
        Connection conn = null;
        ResultSet rs = null;
        int rowCount = -1;
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.prepareCall(sql);
            rs = stm.executeQuery(sql);
            rs.next();
            rowCount = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            rs.close();
            stm.close();
        }
        return rowCount;
    }

    public static boolean insertUser(User user) {
        PreparedStatement statement = null;
        try {
            Connection conn = JDBCConnection.getJDBCConnection();

            String sql = "insert into databasename.user(userFirstname,userLastname,userGender,userEmail,userPass,userRole)"
                    + " values (?, ?, ?, ?, ?, ?)";

            statement = conn.prepareCall(sql);
            statement.setString(1, user.getUserFirstname());
            statement.setString(2, user.getUserLastname());
            statement.setString(3, user.getUserGender());
            statement.setString(4, user.getUserEmail());
            statement.setString(5, user.getUserPass());
            statement.setBoolean(6, true);
            int rs = statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
//            return "error: " + e.getMessage();
            return false;
        }
    }
    
    
    
    public static boolean insertOrder(Order order) {
        PreparedStatement statement = null;
        try {
            Connection conn = JDBCConnection.getJDBCConnection();

            String sql = "insert into databasename.bill(userFirstname,userLastname,userGender,userEmail,userPass,userRole)"
                    + " values (?, ?, ?, ?, ?, ?)";

            statement = conn.prepareCall(sql);

            statement.setBoolean(6, true);
            int rs = statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
//            return "error: " + e.getMessage();
            return false;
        }
    }
}
