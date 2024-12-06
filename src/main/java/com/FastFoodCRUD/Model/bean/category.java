package com.FastFoodCRUD.Model.bean;

public class category {
	private int categoryId;
	private String categoryName;
	
	public category(int categoryId, String categoryName) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}
	
	public int getCategoryId() {
		return this.categoryId;
	}
	
	public String getCategoryName() {
		return this.categoryName;
	}
}
