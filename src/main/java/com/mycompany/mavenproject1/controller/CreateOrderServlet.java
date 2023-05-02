package com.mycompany.mavenproject1.controller;

import com.mycompany.mavenproject1.database.BillDao;
import com.mycompany.mavenproject1.database.ProductDao;
import com.mycompany.mavenproject1.database.UserDao;
import com.mycompany.mavenproject1.model.Bill;
import com.mycompany.mavenproject1.model.BillDetail;
import com.mycompany.mavenproject1.model.Cart;
import com.mycompany.mavenproject1.service.ListCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NAM
 */
public class CreateOrderServlet extends HttpServlet {

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
        try {
            String totalPrice = request.getParameter("total");
            String nameCustomer = request.getParameter("nameCustomer");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String payment = request.getParameter("payment");
            String note = request.getParameter("note");

            String userEmail = (String) session.getAttribute("username");

//          xử lý thời gian đặt hàng
            String pattern = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String utilDate = simpleDateFormat.format(new Date());
            
//            truy vấn userId đặt hàng
            int userId = UserDao.getUserIdByEmail(userEmail);
            
            int billId = 0;
            Bill bill = new Bill(
                    billId,
                    utilDate,
                    "Đã xác nhận đơn hàng", //default state
                    userId,
                    nameCustomer,
                    phoneNumber,
                    note,
                    payment,
                    address,
                    totalPrice
                );
            
//            insert bill vào database
            BillDao billDao = new BillDao();
            billDao.insertBill(bill);
            
            // truy vấn billId
            billId = BillDao.findBillId(userId, utilDate);
            bill.setBillId(billId);
            
            for (Cart cart : ListCart.getCartList()) {
                BillDetail billDetail = new BillDetail(
                        cart.getProduct(),
                        cart.getQuantity(),
                        cart.getSize(),
                        billId,
                        utilDate,
                        "Đã xác nhận đơn hàng",
                        userId,
                        userEmail,
                        phoneNumber,
                        note,
                        payment,
                        address,
                        totalPrice
                );

//                insert bill detail vao db
                billDao.insertBillDetail(billDetail);
                
//                cập nhật lại số lượng sản phẩm khi người dùng đặt hàng
                ProductDao.increaseSold(cart.getProduct().getProductID(), cart.getQuantity());
            }
            
//            session.setAttribute("bill_user", bill);
           
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.getMessage();
            session.setAttribute("message", e.getMessage());
            response.sendRedirect("error.jsp");
        } finally {
            ListCart.getCartList().clear();
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
