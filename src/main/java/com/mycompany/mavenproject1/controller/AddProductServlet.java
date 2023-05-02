package com.mycompany.mavenproject1.controller;

import com.mycompany.mavenproject1.database.ProductDao;
import com.mycompany.mavenproject1.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NAM
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/admin/add-new-product"})
public class AddProductServlet extends HttpServlet {

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

        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String productLabel = request.getParameter("productLabel");
        int productSL = Integer.parseInt(request.getParameter("productSL"));
        String productStatus = request.getParameter("productStatus");
        String productGender = request.getParameter("productGender");
        String productCategory = request.getParameter("productCategory");
        String productProvider = request.getParameter("productProvider");
        String productPrice = request.getParameter("productPrice");
        String productCost = request.getParameter("productCost");
        String ImageUpload = request.getParameter("ImageUpload");
        String mota = request.getParameter("mota");

        Product product = new Product(
                productID,
                productCategory,
                productName,
                ImageUpload,
                mota,
                productPrice,
                productLabel,
                productSL,
                productGender,
                productProvider,
                productStatus,
                productCost,
                0
        );
        
        String ms = ProductDao.insertNewProduct(product);
        HttpSession session = request.getSession();
        session.setAttribute("check_valid_add_product", ms);
        session.setAttribute("product_id_add", productID);
        response.sendRedirect("doc/form-add-san-pham.jsp");
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
