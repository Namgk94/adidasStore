package com.mycompany.mavenproject1.database;

import com.mycompany.mavenproject1.model.BillDetail;
import com.mycompany.mavenproject1.model.Product;
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

// xử lý dữ liệu phần review đánh giá của nguwoif dùng về sản phẩm
public class RateDao {

    public static String insertRate(String productId,int billId, int rate, String review, String reviewHeader,String rateTime) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "UPDATE bill_product SET "
                    + "rate = ?,"
                    + "review = ?,"
                    + "review_header = ?, "
                    + "rateTime = ? "
                    + " WHERE (productId = ? and billID = ?)";
            ps = conn.prepareCall(sql);
            ps.setInt(1, rate);
            ps.setString(2, review);
            ps.setString(3, reviewHeader);
            ps.setString(4, rateTime);
            ps.setString(5, productId);
            ps.setInt(6, billId);
            ps.executeUpdate();
            return "ok";
        } catch (SQLException e) {
            return "Update ERROR: " + e.getMessage();
        }
    }
    
    public static ArrayList<BillDetail> getReviews(String productId) {
        Connection conn = null;
        ArrayList<BillDetail> list = new ArrayList<>();
        Statement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill_product "
                    + "where ( productId = " + productId 
                    + " and ( rate is not null or review is not null or review_header is not null));" ;

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product p = ProductDao.getProductById(resultSet.getString("productId"));
                String size = resultSet.getString("size");
                int rate = resultSet.getInt("rate");
                String reviewHeader = resultSet.getString("review_header");
                String reviewText = resultSet.getString("review");
                String rateTime = resultSet.getString("rateTime");
                BillDetail billDetail = new BillDetail(p, size, rate, reviewHeader, reviewText, rateTime);
                list.add(billDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static ArrayList<BillDetail> getAllReviews() {
        Connection conn = null;
        ArrayList<BillDetail> list = new ArrayList<>();
        Statement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill_product "
                    + "where ( rate is not null or review is not null or review_header is not null);" ;

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product p = ProductDao.getProductById(resultSet.getString("productId"));
                int billId = resultSet.getInt("billId");
                String customerName = BillDao.findBill(billId).getUserName();
                String size = resultSet.getString("size");
                int rate = resultSet.getInt("rate");
                String reviewHeader = resultSet.getString("review_header");
                String reviewText = resultSet.getString("review");
                String rateTime = resultSet.getString("rateTime");
                BillDetail billDetail = new BillDetail(p, size, rate, reviewHeader, reviewText, rateTime,billId,customerName);
                list.add(billDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
