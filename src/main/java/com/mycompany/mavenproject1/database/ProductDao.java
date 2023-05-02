package com.mycompany.mavenproject1.database;

import com.mycompany.mavenproject1.model.Product;
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
public class ProductDao {

    public static String insertNewProduct(Product product) {
        PreparedStatement statement = null;
        try {
            Connection conn = JDBCConnection.getJDBCConnection();

            String sql = "insert into databasename.product(productID,productPrice,productName,productImg,productDesc,type,label,gender,provider,amount,status,cost)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?)";

            statement = conn.prepareCall(sql);

            statement.setString(1, product.getProductID());
            statement.setString(2, product.getProductPrice());
            statement.setString(3, product.getProductName());
            statement.setString(4, product.getProductImage());
            statement.setString(5, product.getProductDescription());
            statement.setString(6, product.getProductCategory());
            statement.setString(7, product.getProductLabel());
            statement.setString(8, product.getGender());
            statement.setString(9, product.getProvider());
            statement.setInt(10, product.getAmount());
            statement.setString(11, product.getStatus());
            statement.setString(12, product.getCost());
            statement.executeUpdate();
            ListProducts.addProduct(product);
            ListProducts.setIsUpdated(true);
            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return e.getMessage();
//            return false;
        }
    }

    public static String DeleteProduct(Product product) {
        Statement statement = null;
        try {
            Connection conn = JDBCConnection.getJDBCConnection();
            statement = conn.createStatement();

            String sql = "Delete from product where productId = " + product.getProductID();
            statement.executeUpdate(sql);

            ListProducts.removeProduct(product);
            ListProducts.setIsUpdated(true);
            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error: " + e.getMessage();
////            return false;
        }
    }

    public static String updateProductDAO(String currentId, Product product) {
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "UPDATE product SET "
                    + "productId = ?,"
                    + "productName = ?,"
                    + "amount = ?, "
                    + "status = ?,"
                    + "productPrice = ?,"
                    + "label= ?, "
                    + "gender = ?,"
                    + "type = ?,"
                    + "productImg = ? "
                    + " WHERE (productId = ?)";
            ps = conn.prepareCall(sql);

            ps.setString(1, product.getProductID());
            ps.setString(2, product.getProductName());
            ps.setInt(3, product.getAmount());
            ps.setString(4, product.getStatus());
            ps.setString(5, product.getProductPrice());
            ps.setString(6, product.getProductLabel());
            ps.setString(7, product.getGender());
            ps.setString(8, product.getProductCategory());
            ps.setString(9, product.getProductImage());
            ps.setString(10, currentId);
            ps.executeUpdate();
            ListProducts.setIsUpdated(true);
            return "ok";
        } catch (SQLException e) {
            return "Update ERROR: " + e.getMessage();
        }
    }

    public static String getProductsData() {
        Statement statement = null;
        try {
            Connection conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.product";

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getString("productId"),
                        resultSet.getString("type"),
                        resultSet.getString("productName"),
                        resultSet.getString("productImg"),
                        resultSet.getString("productDesc"),
                        resultSet.getString("productPrice"),
                        resultSet.getString("label"),
                        resultSet.getInt("amount"),
                        resultSet.getString("gender"),
                        resultSet.getString("provider"),
                        resultSet.getString("status"),
                        resultSet.getString("cost"),
                        resultSet.getInt("wishlist")
                );
                ListProducts.addProduct(product);
                ListProducts.setIsUpdated(true);
            }
            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error: " + e.getMessage();
//            return false;
        }
    }

    public static Product getProductById(String id) {
        try {
            Connection conn = JDBCConnection.getJDBCConnection();
            String sql = "select * from databasename.product"
                    + " where productId = " + id;

            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery(sql);
            resultSet.next();
            Product product = new Product(
                    resultSet.getString("productId"),
                    resultSet.getString("type"),
                    resultSet.getString("productName"),
                    resultSet.getString("productImg"),
                    resultSet.getString("productDesc"),
                    resultSet.getString("productPrice"),
                    resultSet.getString("label"),
                    resultSet.getInt("amount"),
                    resultSet.getString("gender"),
                    resultSet.getString("provider"),
                    resultSet.getString("status"),
                    resultSet.getString("cost"),
                    resultSet.getInt("wishlist")
            );
            return product;
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }

    public static String getTrendingProducts() {
        Statement statement = null;
        try {
            Connection conn = JDBCConnection.getJDBCConnection();

            String sql = "select * from databasename.product "
                    + "where sold >= 5 "
                    + "order by sold desc "
                    + "limit 10";

            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getString("productId"),
                        resultSet.getString("type"),
                        resultSet.getString("productName"),
                        resultSet.getString("productImg"),
                        resultSet.getString("productDesc"),
                        resultSet.getString("productPrice"),
                        resultSet.getString("label"),
                        resultSet.getInt("amount"),
                        resultSet.getString("gender"),
                        resultSet.getString("provider"),
                        resultSet.getString("status"),
                        resultSet.getString("cost"),
                        resultSet.getInt("wishlist")
                );
                ListProducts.addProduct(product);
                ListProducts.setIsUpdated(true);
            }
            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error: " + e.getMessage();
//            return false;
        }
    }

    public static ArrayList<Product> getProductsByGender(String gender) {
        if (gender.equalsIgnoreCase("men")) {
            gender = "nam";
        }
        if (gender.equalsIgnoreCase("women")) {
            gender = "nữ";
        }

        PreparedStatement statement = null;
        Connection conn = null;
        String sql = null;
        ArrayList<Product> list = new ArrayList<>(100);
        try {
            conn = JDBCConnection.getJDBCConnection();
            sql = "select * from databasename.product"
                    + " where gender = '" + gender + "' or gender = 'unisex'";

            statement = conn.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getString("productId"),
                        resultSet.getString("type"),
                        resultSet.getString("productName"),
                        resultSet.getString("productImg"),
                        resultSet.getString("productDesc"),
                        resultSet.getString("productPrice"),
                        resultSet.getString("label"),
                        resultSet.getInt("amount"),
                        resultSet.getString("gender"),
                        resultSet.getString("provider"),
                        resultSet.getString("status"),
                        resultSet.getString("cost"),
                        resultSet.getInt("wishlist")
                );
                list.add(product);
            }

            return list;
        } catch (SQLException e) {
            e.getMessage();
//            return "error" + e.getMessage() + sql;
        }
        return null;
    }

    public static ArrayList<Product> getProductsByProp(String prop) {
        PreparedStatement statement = null;
        Connection conn = null;
        ArrayList<Product> list = new ArrayList<>(100);
        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "SELECT * FROM databasename.product "
                    + "where label like \"%" + prop + "%\" or type like \"%" + prop + "%\"";

            statement = conn.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getString("productId"),
                        resultSet.getString("type"),
                        resultSet.getString("productName"),
                        resultSet.getString("productImg"),
                        resultSet.getString("productDesc"),
                        resultSet.getString("productPrice"),
                        resultSet.getString("label"),
                        resultSet.getInt("amount"),
                        resultSet.getString("gender"),
                        resultSet.getString("provider"),
                        resultSet.getString("status"),
                        resultSet.getString("cost"),
                        resultSet.getInt("wishlist")
                );
                list.add(product);
            }

            return list;
        } catch (SQLException e) {
            e.getMessage();
//            return "er: " + e.getMessage();
        }
        return null;
    }

    public static ArrayList<Product> getProductsBySearch(String search) {
        PreparedStatement statement = null;
        Connection conn = null;
        ArrayList<Product> list = new ArrayList<>(100);
        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "SELECT * FROM databasename.product "
                    + "where label like \"%" + search + "\""
                    + " or type like \"%" + search + "%\""
                    + " or productName like \"%" + search + "%\"";

            statement = conn.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getString("productId"),
                        resultSet.getString("type"),
                        resultSet.getString("productName"),
                        resultSet.getString("productImg"),
                        resultSet.getString("productDesc"),
                        resultSet.getString("productPrice"),
                        resultSet.getString("label"),
                        resultSet.getInt("amount"),
                        resultSet.getString("gender"),
                        resultSet.getString("provider"),
                        resultSet.getString("status"),
                        resultSet.getString("cost"),
                        resultSet.getInt("wishlist")
                );
                list.add(product);
            }

            return list;
        } catch (SQLException e) {
            e.getMessage();
//            return "er: " + e.getMessage();
        }
        return null;
    }

    public static int getTotalProduct() {
        Statement stm = null;
        Connection conn = null;
        String sql = "SELECT count(productId) as countProduct FROM databasename.product;";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int count = resultSet.getInt("countProduct");

            return count;
        } catch (SQLException e) {
            e.getMessage();
            return -1;
        }
    }

//  Tính số lượng sản phẩm sắp hết hàng   
    public static int getAmountRunOut() {
        Statement stm = null;
        Connection conn = null;
        String sql = "SELECT count(productId) as countProduct FROM databasename.product where amount < 20;";
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int count = resultSet.getInt("countProduct");

            return count;
        } catch (SQLException e) {
            e.getMessage();
            return -1;
        }
    }
//  get tổng số lượng sản phẩm đã bán
    public static int getAmountSold(String productId) {
        Statement stm = null;
        Connection conn = null;
        String sql = "SELECT sold FROM databasename.product where productId = " + productId;
        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            resultSet.next();
            int sold = resultSet.getInt("sold");

            return sold;
        } catch (SQLException e) {
            e.getMessage();
            return -1;
        }
    }

    public static String increaseSold(String productId, int boughtAmount) {
        PreparedStatement ps = null;
        Connection conn = null;
        int currentSold = ProductDao.getAmountSold(productId);
        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "UPDATE databasename.product SET "
                    + "sold = ?,"
                    + " WHERE (productId = ?)";
            ps = conn.prepareCall(sql);
            
            ps.setInt(1, currentSold + boughtAmount);
            ps.setString(2, productId);
            ps.executeUpdate();
            ListProducts.setIsUpdated(true);
            return "ok";
        } catch (SQLException e) {
            return "Update ERROR: " + e.getMessage();
        }
    }
}
