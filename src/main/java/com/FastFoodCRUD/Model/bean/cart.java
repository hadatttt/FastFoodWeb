package com.FastFoodCRUD.Model.bean;

public class cart {
	private int cartId;
	private int fastfoodId;
	private int quantity;
	public cart(int cartId, int fastfoodId, int quantity) {
		this.cartId = cartId;
		this.fastfoodId = fastfoodId;
		this.quantity = quantity;
	}
	public int getCartId() {
		return this.cartId;
	}
	public int getFastfoodId() {
		return this.fastfoodId;
	}
	public int getQuantity() {
		return this.quantity;
	}
}
