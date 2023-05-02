package com.mycompany.mavenproject1.controller;

import com.mycompany.mavenproject1.database.JDBCConnection;
import com.mycompany.mavenproject1.model.Cart;
import com.mycompany.mavenproject1.model.Product;
import com.mycompany.mavenproject1.service.ListCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NAM
 */
public class AddProductToCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String size = request.getParameter("sizeValue");
        String id = request.getParameter("idValue");
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = JDBCConnection.getJDBCConnection();
            String sql = "select * from databasename.product"
                    + " where productId = " + id;

            statement = conn.prepareStatement(sql);

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

            Cart cart = new Cart(product, size,1);
            ListCart.addToCart(cart);
            response.sendRedirect("detail_product.jsp?detail_product_id="+id);
        } catch (SQLException e) {
            HttpSession session = request.getSession();
            session.setAttribute("message", e.getMessage() + "id = " + id);
            response.sendRedirect("error.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
