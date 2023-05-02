package com.mycompany.mavenproject1.model;

/**
 *
 * @author NAM
 */
// BillDetail là bill của 1 sản phẩm;
public class BillDetail extends Bill {

    private Product product;
    private int quantity;
    private String size;
    private boolean rated = false;
    private int rateStar;
    private String reviewHeader;
    private String reviewText;
    private String rateTime;

    public BillDetail(Product product, int quantity, String size, int BillId, String orderTime, String orderState, int userID, String userName, String telNumber, String note, String paymentMethod, String address, String total) {
        super(BillId, orderTime, orderState, userID, userName, telNumber, note, paymentMethod, address, total);
        this.product = product;
        this.quantity = quantity;
        this.size = size;
    }

    public BillDetail(Product product, int quantity, String size) {
        this.product = product;
        this.quantity = quantity;
        this.size = size;
    }

    public BillDetail(Product product, String size, int rateStar, String reviewHeader, String reviewText, String rateTime) {
        this.product = product;
        this.size = size;
        this.rateStar = rateStar;
        this.reviewHeader = reviewHeader;
        this.reviewText = reviewText;
        this.rateTime = rateTime;
    }

//    hàm tạo sử dụng cho lớp RateDao.getAllReviews();
    public BillDetail(Product product, String size, int rateStar, String reviewHeader, String reviewText, String rateTime, int billId, String userName) {
        super(billId, userName);
        this.product = product;
        this.size = size;
        this.rateStar = rateStar;
        this.reviewHeader = reviewHeader;
        this.reviewText = reviewText;
        this.rateTime = rateTime;
    }

    
    public String getRateTime() {
        return rateTime;
    }

    public void setRateTime(String rateTime) {
        this.rateTime = rateTime;
    }

    public int getRateStar() {
        return rateStar;
    }

    public void setRateStar(int rateStar) {
        this.rateStar = rateStar;
    }

    public String getReviewHeader() {
        return reviewHeader;
    }

    public void setReviewHeader(String reviewHeader) {
        this.reviewHeader = reviewHeader;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public boolean isRated() {
        return rated;
    }

    public void setRated(boolean rated) {
        this.rated = rated;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

}
