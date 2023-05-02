package com.mycompany.mavenproject1.model;


/**
 *
 * @author NAM
 */
public class Product {

    private String productID;
    private String productCategory;
    private String productName;
    private String productImage;
    private String productDescription;
    private String productPrice;
    private String productLabel;
    private int amount;
    private String gender;
    private String provider;
    private String status;
    private String cost;
    private int wishlist; //0 = false | 1 = true
    
    private String size; // dùng để lưu size mà người dùng chọn mua sản phẩm

    public Product(String productID, String productCategory, String productName, String productImage, String productDescription, String productPrice, String productLabel, int amount, String gender, String provider, String status, String cost, int wishlist) {
        this.productID = productID;
        this.productCategory = productCategory;
        this.productName = productName;
        this.productImage = productImage;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productLabel = productLabel;
        this.amount = amount;
        this.gender = gender;
        this.provider = provider;
        this.status = status;
        this.cost = cost;
        this.wishlist = wishlist;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    

    public int getWishlist() {
        return wishlist;
    }

    public void setWishlist(int wishlist) {
        this.wishlist = wishlist;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }
    

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductLabel() {
        return productLabel;
    }

    public void setProductLabel(String productLabel) {
        this.productLabel = productLabel;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

}
