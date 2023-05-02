package com.mycompany.mavenproject1.controller;

import com.mycompany.mavenproject1.database.BillDao;
import com.mycompany.mavenproject1.database.UserDao;
import com.mycompany.mavenproject1.model.Bill;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NAM
 */
public class OrderTrackerController extends HttpServlet {

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
        int orderNumber = Integer.parseInt(request.getParameter("order_number")); //billId
        String email = request.getParameter("email_user");
        HttpSession session = request.getSession();
        
        int userId = UserDao.getUserIdByEmail(email);
        BillDao billDao = new BillDao();
        Bill order = billDao.trackerBill(orderNumber,userId);
            
        if ( order.getOrderTime() != null) {
            session.setAttribute("orderNumber", order.getBillId());
            session.setAttribute("order_State", order.getOrderState());
            session.setAttribute("order_Time", order.getOrderTime());
            session.setAttribute("orderTotal", order.getTotal());
            session.setAttribute("orderTel", order.getTelNumber());
            session.setAttribute("orderAddress", order.getAddress());
            session.setAttribute("orderCustomer", order.getUserName());
            
            response.sendRedirect("order_detail.jsp?order_number=" + order.getBillId());
        } else {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Mã đơn hàng hoặc email người đặt hàng không trùng khớp !');");
            out.println("location='order_tracker.jsp';");
            out.println("</script>");
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
