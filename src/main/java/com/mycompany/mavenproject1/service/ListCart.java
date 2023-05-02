package com.mycompany.mavenproject1.service;

import com.mycompany.mavenproject1.model.Cart;
import java.util.ArrayList;

/**
 *
 * @author NAM
 */
public class ListCart {

    private static ArrayList<Cart> cartList = new ArrayList<>();

    public ListCart(ArrayList<Cart> cartList) {
        ListCart.cartList = cartList;
    }

    public static ArrayList<Cart> getCartList() {
        return cartList;
    }

    public void setCartList(ArrayList<Cart> cartList) {
        ListCart.cartList = cartList;
    }

    public static void addToCart(Cart e) {
        int check = 1;
        for (Cart cart : cartList) {
            if (e.getProduct().getProductID().equals(cart.getProduct().getProductID())
                    && e.getSize().equals(cart.getSize())) {

                int new_quantity = cart.getQuantity() + 1;
                cart.setQuantity(new_quantity);
                check = 0;
            } 
                
        }
        if (check == 1) {
            ListCart.cartList.add(e);
        }
    }

    public static void removeToCart(Cart e) {
        ListCart.cartList.remove(e);
    }

    public static int countCartItem() {
        return ListCart.cartList.size();
    }

    public static double totalCart() {
        double total = 0.0;
        for (Cart cart : cartList) {
            double price = Double.parseDouble(cart.getProduct().getProductPrice());
            total += price * cart.getQuantity();
        }
        return total;
    }

}
