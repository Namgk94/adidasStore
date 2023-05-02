package com.mycompany.mavenproject1.cookie;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author NAM
 */
public class CookieProduct {

    private static String listIdViewed = "";
    
    public static String getListIdViewed() {
        return listIdViewed;
    }
    public static void setListIdViewed(String listIdViewed) {
        CookieProduct.listIdViewed = listIdViewed;
    }


    public static void setCookieProductViewed(HttpServletRequest request, HttpServletResponse response, String productId) {
//      Kiểm tra id đã tồn tại trong mảng cookies chưa ? 
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("productViewed")) {
                    if (c.getValue().contains(productId + "/") || 
                        c.getValue().contains("/" + productId) ) {
                        return; 
                    }
                }
            }
        }
        
//      Nối chuỗi product id
        CookieProduct.setListIdViewed(listIdViewed.concat(productId + "/"));

//        Thêm chuỗi vào cookie
        Cookie cookie = new Cookie("productViewed", CookieProduct.getListIdViewed());
        cookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(cookie);
    }
    
    public static String[] getCookiesProductViewed(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String txt = "";
        for (Cookie c : cookies) {
            if (c.getName().equals("productViewed")) {
                txt = c.getValue();
            }
        }
        return CookieProduct.convertStringToArray(txt, "/");
    }
    //    hàm chuyển chuỗi id đã xem thành array;
    public static String[] convertStringToArray(String txt, String regex) {   
        String[] s = null;
        if (txt != null && txt.length() > 0) {
            s = txt.split(regex);
        }
        return s;
    }
}
