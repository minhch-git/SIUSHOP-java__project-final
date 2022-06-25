package com.siushop.model;

import javax.sound.sampled.Port;

public class Product {
    private int id;
    private String title;
    private float price;
    private int createdBy;
    private boolean isExclusive;
    private String image;
    private float promotionPrice;

    public Product(){}

    public Product(int id, String title, float price, int createdBy, boolean isExclusive, String image, float promotionPrice) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.createdBy = createdBy;
        this.isExclusive = isExclusive;
        this.image = image;
        this.promotionPrice = promotionPrice;
    }

    public Product(String title, float price, int createdBy, boolean isExclusive, String image, float promotionPrice) {
        this.title = title;
        this.price = price;
        this.createdBy = createdBy;
        this.isExclusive = isExclusive;
        this.image = image;
        this.promotionPrice = promotionPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public boolean isExclusive() {
        return isExclusive;
    }

    public void setExclusive(boolean exclusive) {
        isExclusive = exclusive;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(float promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", createdBy=" + createdBy +
                ", isExclusive=" + isExclusive +
                ", image='" + image + '\'' +
                ", promotionPrice=" + promotionPrice +
                '}';
    }
}
