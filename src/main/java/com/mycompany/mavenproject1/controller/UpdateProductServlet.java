package com.mycompany.mavenproject1.controller;

import com.mycompany.mavenproject1.database.ProductDao;
import com.mycompany.mavenproject1.model.Product;
import com.mycompany.mavenproject1.service.ListProducts;
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
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/admin/update-product"})
public class UpdateProductServlet extends HttpServlet {

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

        String currentId = request.getParameter("currentId");
        String id = request.getParameter("update-id");
        String name = request.getParameter("update-name");
        int sl = Integer.parseInt(request.getParameter("update-sl"));
        String stt = request.getParameter("update-stt");
        String price = request.getParameter("update-price");
        String cate = request.getParameter("update-cate");
        String gender = request.getParameter("update-gender");
        String label = request.getParameter("update-label");
        String img = request.getParameter("update-img");
        
        Product product = ListProducts.searchProductById(currentId);
        int index = ListProducts.getList().indexOf(product);

        String ms = "Ok";
        if (index != -1) {

            Product updateProduct = new Product(
                    id,
                    cate,
                    name,
                    img,
                    product.getProductDescription(),
                    price,
                    label,
                    sl, 
                    gender,
                    product.getProvider(),
                    stt,
                    product.getCost(),
                    product.getWishlist()
            );
            ms = ProductDao.updateProductDAO(currentId, updateProduct);
            ListProducts.removeProduct(product);
            ListProducts.updateProduct(index, updateProduct);
            response.sendRedirect("doc/table-data-product.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message", ms);
            response.sendRedirect("test.jsp");
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
