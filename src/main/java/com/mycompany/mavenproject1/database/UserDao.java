package com.mycompany.mavenproject1.database;

import com.mycompany.mavenproject1.model.User;
import com.mycompany.mavenproject1.service.ListProducts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author NAM
 */
public class UserDao {

    public static int getUserIdByEmail(String userEmail) {

        Statement stm = null;
        Connection conn = null;
        String sql = "select userID "
                + "from user "
                + "where userEmail = \"" + userEmail + "\"";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int id = resultSet.getInt("userID");

            return id;
        } catch (SQLException e) {
            e.getMessage();
        }
        return -1;
    }

    public static boolean checkEmailIsExist(String email) {
        Connection conn = null;
        Statement stm = null;
        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "SELECT count(userEmail) as count FROM databasename.user where userEmail = \"" + email + "\"";
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int count = resultSet.getInt("count");
            if (count == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int getTotalUser() {
        Statement stm = null;
        Connection conn = null;
        String sql = "SELECT count(userID) as countUser FROM databasename.user;";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int count = resultSet.getInt("countUser");

            return count;
        } catch (SQLException e) {
            e.getMessage();
            return -1;
        }
    }

//    lấy danh sách khách hàng mới nhất
    public static ArrayList<User> getNewestUsers() {
        Connection conn = null;
        ArrayList<User> list = new ArrayList<>();
        Statement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "SELECT * FROM databasename.user \n"
                    + "order by userId desc limit 5;";

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                User user = new User(
                        resultSet.getString("userFirstname"),
                        resultSet.getString("userLastname"),
                        resultSet.getString("userGender"),
                        resultSet.getString("userEmail"),
                        "null",
                        true
                );
                user.setUserID(resultSet.getInt("userID"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static String UpdateUser(String id, String fn, String ln, String pw) {
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "UPDATE databasename.user SET "
                    + "userFirstname = ?,"
                    + "userLastname = ?,"
                    + "userPass = ? "
                    + " WHERE (userID = ?)";
            ps = conn.prepareCall(sql);

            ps.setString(1, fn);
            ps.setString(2, ln);
            ps.setString(3, pw);
            ps.setString(4, id);
            
            ps.executeUpdate();
            return "ok";
        } catch (SQLException e) {
            return "Update User ERROR: " + e.getMessage();
        }
    }
    
    public static int getUserById(String id) {

        Statement stm = null;
        Connection conn = null;
        String sql = "select userID "
                + "from user "
                + "where userID = \"" + id + "\"";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int idUser = resultSet.getInt("userID");

            return idUser;
        } catch (SQLException e) {
            e.getMessage();
        }
        return -1;
    }
}
