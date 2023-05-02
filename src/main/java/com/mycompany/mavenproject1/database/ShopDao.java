package com.mycompany.mavenproject1.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author NAM
 */
public class ShopDao {

    public static int getRevenue_6Months(String month) {
        int revenue = 0;
        Connection conn = null;
        Statement stm = null;

        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            String sql = "select productPrice, Sl, ordertime\n"
                    + "from product\n"
                    + "inner join bill_product\n"
                    + "on product.productId = bill_product.productId\n"
                    + "inner join bill \n"
                    + "on bill.billId = bill_product.billId\n"
                    + "having orderTime like \"%-"+month+"-%\";";
            
            ResultSet resultSet = stm.executeQuery(sql);
            while (resultSet.next()) {                
               int price = Integer.parseInt(resultSet.getString("productPrice"));
               int sl = resultSet.getInt("SL");
               revenue = revenue + sl * price;
            }
            return revenue;
        } catch (SQLException e) {
            e.getMessage();
        }
        return revenue;
    }
    
    public static int getProfit_6Months(String month) {
        int profit = 0;
        Connection conn = null;
        Statement stm = null;

        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            String sql = "select productPrice, cost, Sl, ordertime\n"
                    + "from product\n"
                    + "inner join bill_product\n"
                    + "on product.productId = bill_product.productId\n"
                    + "inner join bill \n"
                    + "on bill.billId = bill_product.billId\n"
                    + "having orderTime like \"%-"+month+"-%\";";
            
            ResultSet resultSet = stm.executeQuery(sql);
            while (resultSet.next()) {                
               int price = Integer.parseInt(resultSet.getString("productPrice"));
               int cost =  Integer.parseInt(resultSet.getString("cost"));
               int sl = resultSet.getInt("SL");
               profit = profit + ((sl * price) - (sl * cost));
            }
            return profit;
        } catch (SQLException e) {
            e.getMessage();
        }
        return profit;
    }
}
