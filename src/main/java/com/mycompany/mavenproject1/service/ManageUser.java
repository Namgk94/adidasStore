package com.mycompany.mavenproject1.service;

import com.mycompany.mavenproject1.model.User;
import java.util.ArrayList;

/**
 *
 * @author NAM
 */
public class ManageUser {
    private static ArrayList<User> listUsers = new ArrayList<>();

    public ManageUser(ArrayList<User> listUsers) {
        ManageUser.listUsers = listUsers;
    }

    public ManageUser() {
    }
    
    public static ArrayList<User> getListUsers() {
        return listUsers;
    }

    public static void setListUsers(ArrayList<User> listUsers) {
        ManageUser.listUsers = listUsers;
    }
    
    public static void addUser(User e) {
        ManageUser.listUsers.add(e);
    }

}
