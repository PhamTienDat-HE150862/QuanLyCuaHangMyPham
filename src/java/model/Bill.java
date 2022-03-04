/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Bill {
    private int BillID;
    private int userID;
    private int totalPrice;
    private Date sellingDate;
    private String address;
    private int tel;
    private int paymentMethod;
    private int productId;

    public Bill() {
    }

    public Bill(int BillID, int userID, int totalPrice, Date sellingDate, String address, int tel, int paymentMethod, int productId) {
        this.BillID = BillID;
        this.userID = userID;
        this.totalPrice = totalPrice;
        this.sellingDate = sellingDate;
        this.address = address;
        this.tel = tel;
        this.paymentMethod = paymentMethod;
        this.productId = productId;
    }

    public int getBillID() {
        return BillID;
    }

    public void setBillID(int BillID) {
        this.BillID = BillID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getSellingDate() {
        return sellingDate;
    }

    public void setSellingDate(Date sellingDate) {
        this.sellingDate = sellingDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Bill{" + "BillID=" + BillID + ", userID=" + userID + ", totalPrice=" + totalPrice + ", sellingDate=" + sellingDate + ", address=" + address + ", tel=" + tel + ", paymentMethod=" + paymentMethod + ", productId=" + productId + '}';
    }

   
    
    
    
            
}
