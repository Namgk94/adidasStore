package com.mycompany.mavenproject1.model;

import java.util.ArrayList;

/**
 *
 * @author NAM
 */
public class User {

    public static final boolean IS_USER = true;
    public static final boolean IS_ADMIN = false;

    protected int userID;
    protected String userFirstname;
    protected String userLastname;
    protected String userGender;
    protected String userEmail;
    protected String userPass;
    protected boolean userRole;
//  userRole = true if is user
//  userRole = false if is admin

    protected ArrayList<Bill> bills = new ArrayList<>();
    
    public User(String userFirstname, String userLastname, String userGender, String userEmail, String userPass, boolean userRole) {
        this.userFirstname = userFirstname;
        this.userLastname = userLastname;
        this.userGender = userGender.toUpperCase();
        this.userEmail = userEmail;
        this.userPass = userPass;
        this.userRole = userRole;
    }

    public User() {
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public boolean getUserRole() {
        return userRole;
    }

    public void setUserRole(boolean userRole) {
        this.userRole = userRole;
    }

    public String getUserFirstname() {
        return userFirstname;
    }

    public void setUserFirstname(String userFirstname) {
        this.userFirstname = userFirstname;
    }

    public String getUserLastname() {
        return userLastname;
    }

    public void setUserLastname(String userLastname) {
        this.userLastname = userLastname;
    }

    public String getUserGender() {
        return userGender.toUpperCase();
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender.toUpperCase();
    }

    public String getUserFullname() {
        return this.userFirstname + " " + this.userLastname;
    }

    public ArrayList<Bill> getBills() {
        return bills;
    }

    public void setBills(ArrayList<Bill> bills) {
        this.bills = bills;
    }

    public void addBillToUser(Bill e) {
        this.bills.add(e);
    }
}
