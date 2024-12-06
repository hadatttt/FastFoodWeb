package com.FastFoodCRUD.Model.bean;

public class fastFood {
	private int fastFoodId;
	private String imgUrl;
	private String fastFoodName;
	private String description;
	private float price;
	private int categoryId;
	
	public fastFood(int fastFoodId, String imgUrl, String fastFoodName, String description, float price, int categoryId) {
		this.fastFoodId = fastFoodId;
		this.imgUrl = imgUrl;
		this.fastFoodName = fastFoodName;
		this.description = description;
		this.price = price;
		this.categoryId = categoryId;
	}
	
	public int getFastFoodId() {
		return this.fastFoodId;
	}
	
	public String getImgUrl() {
		return this.imgUrl;
	}
	
	public String getFastFoodName() {
		return this.fastFoodName;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public float getPrice() {
		return this.price;
	}
	
	public int getCategoryId() {
		return this.categoryId;
	}
}
