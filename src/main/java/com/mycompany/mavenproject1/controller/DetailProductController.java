package com.mycompany.mavenproject1.controller;

import com.mycompany.mavenproject1.cookie.CookieProduct;
import com.mycompany.mavenproject1.database.ProductDao;
import com.mycompany.mavenproject1.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NAM
 */
public class DetailProductController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String id = request.getParameter("productIdValue");
        if (id == null || "".equals(id)) {
            id = request.getParameter("detail_product_id");
        }
        Product product = ProductDao.getProductById(id);
        if ( product != null) {
            DecimalFormat formatter = new DecimalFormat("###,###,###");
            String priceFormat = formatter.format(Double.parseDouble(product.getProductPrice()));
            session.setAttribute("price_format", priceFormat);
            session.setAttribute("product", product);
            CookieProduct.setCookieProductViewed(request, response, id);
            response.sendRedirect("detail_product.jsp?detail_product_id="+id);
        } else {
            session.setAttribute("message","Khong tim thay san pham !");
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
