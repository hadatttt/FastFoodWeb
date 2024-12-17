package com.FastFoodCRUD.Model.bean;

public class cart {
	private String cartId;
	private int fastfoodId;
	private int quantity;
	public cart(String cartId, int fastfoodId, int quantity) {
		this.cartId = cartId;
		this.fastfoodId = fastfoodId;
		this.quantity = quantity;
	}
	public String getCartId() {
		return this.cartId;
	}
	public int getFastfoodId() {
		return this.fastfoodId;
	}
	public int getQuantity() {
		return this.quantity;
	}
}
