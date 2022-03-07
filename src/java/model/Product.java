/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Product {
    private int productID;
    private String name;
    private String imgUrl;
    private int price;
    private int publisherID;
    private String detail;
    private int categoryID;
    private int quantity;

    public Product() {
    }

    public Product(int productID, String name, String imgUrl, int price, int publisherID, String detail, int categoryID, int quantity) {
        this.productID = productID;
        this.name = name;
        this.imgUrl = imgUrl;
        this.price = price;
        this.publisherID = publisherID;
        this.detail = detail;
        this.categoryID = categoryID;
        this.quantity = quantity;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", name=" + name + ", imgUrl=" + imgUrl + ", price=" + price + ", publisherID=" + publisherID + ", detail=" + detail + ", categoryID=" + categoryID + ", quantity=" + quantity + '}';
    }

    
    
}
