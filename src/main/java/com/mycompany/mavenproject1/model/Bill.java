package com.mycompany.mavenproject1.model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author NAM
 */

//Bill là hóa đơn của cả đơn hàng gồm 1 hoặc nhiều sản phẩm
public class Bill {
    
    private int billId;
    private String orderTime;
    private String orderState;
    private int userID;
    private String userName;
    private String telNumber;
    private String note;
    private String paymentMethod;
    private String address;
    private String total;


    public Bill(int billId, String orderTime, String orderState, int userID, String userName, String telNumber, String note, String paymentMethod, String address, String total) {
        this.billId = billId;
        this.orderTime = orderTime;
        this.orderState = orderState;
        this.userID = userID;
        this.userName = userName;
        this.telNumber = telNumber;
        this.note = note;
        this.paymentMethod = paymentMethod;
        this.address = address;
        this.total = total;
    }

    public Bill() {
    }   

//    CONSTRUCTOR for RateDao.getAllReviews()
    public Bill(int billId, String userName) {
        this.billId = billId;
        this.userName = userName;
    }
        
    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTelNumber() {
        return telNumber;
    }

    public void setTelNumber(String telNumber) {
        this.telNumber = telNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    
    
    
}
