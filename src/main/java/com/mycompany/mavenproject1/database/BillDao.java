package com.mycompany.mavenproject1.database;

import com.mycompany.mavenproject1.model.Bill;
import com.mycompany.mavenproject1.model.BillDetail;
import com.mycompany.mavenproject1.model.Product;
import com.mycompany.mavenproject1.service.ListProducts;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author NAM
 */
public class BillDao {

    public ArrayList<Bill> getAllBills() {
        Connection conn = null;
        ArrayList<Bill> list = new ArrayList<>();
        Statement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill";

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Bill bill = new Bill(
                        resultSet.getInt("billId"),
                        resultSet.getString("orderTime"),
                        resultSet.getString("orderState"),
                        resultSet.getInt("userId"),
                        resultSet.getString("username"),
                        resultSet.getString("tel"),
                        resultSet.getString("note"),
                        resultSet.getString("payment"),
                        resultSet.getString("address"),
                        resultSet.getString("total")
                );
                list.add(bill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Bill findBill(int billId) {
        Connection conn = null;
        Statement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill where billId = " + billId;
            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            resultSet.next();
            Bill bill = new Bill(
                    resultSet.getInt("billId"),
                    resultSet.getString("orderTime"),
                    resultSet.getString("orderState"),
                    resultSet.getInt("userId"),
                    resultSet.getString("username"),
                    resultSet.getString("tel"),
                    resultSet.getString("note"),
                    resultSet.getString("payment"),
                    resultSet.getString("address"),
                    resultSet.getString("total")
            );
            return bill;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Bill> getBillByUserId(int userId) {
        Connection conn = null;
        ArrayList<Bill> list = new ArrayList<>();
        Statement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill where userid = " + userId;

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Bill bill = new Bill(
                        resultSet.getInt("billId"),
                        resultSet.getString("orderTime"),
                        resultSet.getString("orderState"),
                        resultSet.getInt("userId"),
                        resultSet.getString("username"),
                        resultSet.getString("tel"),
                        resultSet.getString("note"),
                        resultSet.getString("payment"),
                        resultSet.getString("address"),
                        resultSet.getString("total")
                );
                list.add(bill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getAmountByBillId(int billId) {
        Connection conn = null;
        Statement stm = null;
        int amount = 0;
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            String sql = "select sum(SL) as amount from databasename.bill_product where billId = " + billId;
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            amount = resultSet.getInt("amount");
            return amount;
        } catch (SQLException e) {
            e.getMessage();
        }
        return 0;
    }

    public String getStringBillDetail(int billId) {
        Connection conn = null;
        Statement statement = null;
        String resultBillDetail = "";
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill_product where billId = " + billId;

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String productId = resultSet.getString("productId");
                int quantity = resultSet.getInt("SL");
                String size = resultSet.getString("size");

                Product product = ProductDao.getProductById(productId);
                resultBillDetail = resultBillDetail.concat("- " + product.getProductName() + " <|Size " + size + "|> " + "(" + quantity + ")<br>");
            }
            return resultBillDetail;
        } catch (SQLException e) {
            return "error: " + e.getMessage();
        }

    }

    public String insertBillDetail(BillDetail billDetail) throws SQLException {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "insert into databasename.bill_product(SL,productId,billId,size)"
                    + " values (?, ?, ?, ?)";

            pstm = conn.prepareCall(sql);

            pstm.setInt(1, billDetail.getQuantity());
            pstm.setString(2, billDetail.getProduct().getProductID());
            pstm.setInt(3, billDetail.getBillId());
            pstm.setString(4, billDetail.getSize());

            pstm.executeUpdate();
            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error: " + e.getMessage();
//            return false;
        } finally {
            conn.close();
            pstm.close();
        }
    }

    public String insertBill(Bill bill) throws SQLException {
        Connection conn = null;
        PreparedStatement pstm = null;
//        java.sql.Date sqlDate = new java.sql.Date(bill.getOrderTime().getTime());
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "insert into databasename.bill(address,payment,tel,total,note,username,userId,orderTime,orderState)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstm = conn.prepareCall(sql);

            pstm.setString(1, bill.getAddress());
            pstm.setString(2, bill.getPaymentMethod());
            pstm.setString(3, bill.getTelNumber());
            pstm.setString(4, bill.getTotal());
            pstm.setString(5, bill.getNote());
            pstm.setString(6, bill.getUserName());
            pstm.setInt(7, bill.getUserID());
            pstm.setString(8, bill.getOrderTime());
            pstm.setString(9, bill.getOrderState());
            pstm.executeUpdate();
            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error: " + e.getMessage();
//            return false;
        } finally {
            conn.close();
            pstm.close();
        }
    }

    public static int findBillId(int userId, String date) {
        Statement stm = null;
        Connection conn = null;
        String sql = "select billId from databasename.bill"
                + " where( userId = " + userId + " and orderTime = '" + date + "')";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int billId = resultSet.getInt("billId");
            return billId;

        } catch (SQLException e) {
            e.getMessage();
        }
        return -1;
    }

    public Bill trackerBill(int billId, int userId) {

        Statement stm = null;
        Connection conn = null;
        String sql = "select * from databasename.bill"
                + " where( userId = " + userId + " and billId = " + billId + ")";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            Bill bill = new Bill();
            while (resultSet.next()) {
                bill.setBillId(resultSet.getInt("billId"));
                bill.setOrderTime(resultSet.getString("orderTime"));
                bill.setOrderState(resultSet.getString("orderState"));
                bill.setUserID(resultSet.getInt("userId"));
                bill.setUserName(resultSet.getString("username"));
                bill.setTelNumber(resultSet.getString("tel"));
                bill.setNote(resultSet.getString("note"));
                bill.setPaymentMethod(resultSet.getString("payment"));
                bill.setAddress(resultSet.getString("address"));
                bill.setTotal(resultSet.getString("total"));
            }
            return bill;
        } catch (SQLException e) {
            e.getMessage();
            return null;
        }

    }

    public ArrayList<Product> getProductsInBillDetails(int billId) {
        Connection conn = null;
        Statement statement = null;
        ArrayList<Product> list = new ArrayList<>();
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill_product where billId = " + billId;

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String productId = resultSet.getString("productId");
                int quantity = resultSet.getInt("SL");
                String size = resultSet.getString("size");

                Product product = ProductDao.getProductById(productId);
                product.setAmount(quantity);
                product.setSize(size);
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            e.getMessage();
            return null;
        }
    }

    public ArrayList<BillDetail> getBillDetailsByBillId(int billId) {
        Connection conn = null;
        Statement statement = null;
        ArrayList<BillDetail> list = new ArrayList<>();
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.bill_product where billId = " + billId;

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String productId = resultSet.getString("productId");
                int _billId = resultSet.getInt("billId");
                int quantity = resultSet.getInt("SL");
                String size = resultSet.getString("size");
                int rateStar = resultSet.getInt("rate");
                String review = resultSet.getString("review");
                String review_header = resultSet.getString("review_header");
                Product product = ProductDao.getProductById(productId);
                product.setAmount(quantity);
                product.setSize(size);
                BillDetail billDetail = new BillDetail(product, quantity, size);
                billDetail.setBillId(_billId);
                if (rateStar > 0) {
                    billDetail.setRated(true);
                } else {
                    billDetail.setRated(false);
                }
                list.add(billDetail);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

//    đếm số lượng đơn hàng
    public static int getTotalBill() {
        Statement stm = null;
        Connection conn = null;
        String sql = "SELECT count(billId) as countBill FROM databasename.bill;";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int count = resultSet.getInt("countBill");

            return count;
        } catch (SQLException e) {
            e.getMessage();
            return -1;
        }
    }

//    lấy danh sách các đơn hàng mới nhất.
    public static ArrayList<Bill> getNewestBills() {
        Connection conn = null;
        ArrayList<Bill> list = new ArrayList<>();
        Statement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();

            String sql = "SELECT * FROM databasename.bill \n"
                    + "order by orderTime desc limit 5;";

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Bill bill = new Bill(
                        resultSet.getInt("billId"),
                        resultSet.getString("orderTime"),
                        resultSet.getString("orderState"),
                        resultSet.getInt("userId"),
                        resultSet.getString("username"),
                        resultSet.getString("tel"),
                        resultSet.getString("note"),
                        resultSet.getString("payment"),
                        resultSet.getString("address"),
                        resultSet.getString("total")
                );
                list.add(bill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//    lấy dữ liệu đơn hàng 6 tháng.
    public static int getAmountBill6Months(String month) {
        int amount = 0;
        Connection conn = null;
        Statement stm = null;

        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            String sql = "SELECT count(billId) as amountBill "
                    + "FROM databasename.bill "
                    + "where orderTime like \"%-" + month + "-%\"";
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            amount = resultSet.getInt("amountBill");
            return amount;
        } catch (SQLException e) {
            e.getMessage();
        }
        return amount;
    }
}
