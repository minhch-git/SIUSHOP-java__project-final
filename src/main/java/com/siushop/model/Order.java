package com.siushop.model;

import java.util.Date;

public class Order extends Product{
    private int id;
    private int userId;
    private int productId;
    private int quantity;
    private Date createdAt;
    private float totalPrice;
    private String district;
    private String province;
    private String ward;
    private String address;

    public Order(){}

    public Order(int productId, int userId, int quantity, float totalPrice, String district, String province, String ward, String address) {
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.district = district;
        this.province = province;
        this.ward = ward;
        this.address = address;
    }

    public Order(int id, int productId, int userId, int quantity, Date createdAt, float totalPrice, String district, String province, String ward, String address) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.createdAt = createdAt;
        this.totalPrice = totalPrice;
        this.district = district;
        this.province = province;
        this.ward = ward;
        this.address = address;
    }

    public Order(int id, String title, float price, int createdBy, boolean isExclusive, String image, float promotionPrice, int id1, int userId, int productId, int quantity, Date createdAt, float totalPrice, String district, String province, String ward, String address) {
        super(id, title, price, createdBy, isExclusive, image, promotionPrice);
        this.id = id1;
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.createdAt = createdAt;
        this.totalPrice = totalPrice;
        this.district = district;
        this.province = province;
        this.ward = ward;
        this.address = address;
    }

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", createdAt=" + createdAt +
                ", totalPrice=" + totalPrice +
                ", district='" + district + '\'' +
                ", province='" + province + '\'' +
                ", ward='" + ward + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
