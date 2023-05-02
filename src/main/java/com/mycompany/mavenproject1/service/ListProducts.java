package com.mycompany.mavenproject1.service;

import com.mycompany.mavenproject1.database.ProductDao;
import com.mycompany.mavenproject1.model.Product;
import java.util.ArrayList;

/**
 *
 * @author NAM
 */
public class ListProducts {
    private static ArrayList<Product> list = new ArrayList<>();
    private static boolean isUpdated = false;
    private static boolean firstLoad = true;

    public static boolean isFirstLoad() {
        return firstLoad;
    }

    public static void setFirstLoad(boolean firstLoad) {
        ListProducts.firstLoad = firstLoad;
    }
    
    public ListProducts() {
    }
    
    public static ArrayList<Product> getList() {
        return list;
    }

    public static void setList(ArrayList<Product> list) {
        ListProducts.list = list;
    }

    public static boolean isUpdated() {
        return isUpdated;
    }

    public static void setIsUpdated(boolean isUpdated) {
        ListProducts.isUpdated = isUpdated;
    }
    
    public static void addProduct(Product p) {
        ListProducts.list.add(p);
    }
    public static void removeProduct(Product p) {
        ListProducts.list.remove(p);
    }
    
    public static Product searchProductById(String id){
        for (Product product : ListProducts.list) {
            if(product.getProductID().equals(id)) {
                return product;
            }
        }
        return null;
    }
    
    public static void updateProduct(int index, Product p) {
        ListProducts.list.add(index, p);
    }
    public static void ClearListProduct() {
        ListProducts.list.clear();
    }

    
}
