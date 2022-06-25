package com.siushop.model;

public class Cart extends Product{
    private int quantity;

    public Cart(){}

    public Cart(int quantity) {
        this.quantity = quantity;
    }

    public Cart(int id, String title, float price, int createdBy, boolean isExclusive, String image, float promotionPrice, int quantity) {
        super(id, title, price, createdBy, isExclusive, image, promotionPrice);
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "quantity=" + quantity +
                '}';
    }
}
