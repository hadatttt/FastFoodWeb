	package com.FastFoodCRUD.Model.bean;

public class fastfood {
	private int fastFoodId;
	private String fastFoodName;
	private String description;
	private float price;
	private int categoryId;
	private String category;
	
	public fastfood(int fastFoodId, String imgUrl, String fastFoodName, String description, float price,
			String category) {
		super();
		this.fastFoodId = fastFoodId;
		this.imgUrl = imgUrl;
		this.fastFoodName = fastFoodName;
		this.description = description;
		this.price = price;
		this.category = category;
	}

	public fastfood(int fastFoodId, String imgUrl, String fastFoodName, String description, float price, int categoryId) {

		this.fastFoodId = fastFoodId;
		this.fastFoodName = fastFoodName;
		this.description = description;
		this.price = price;
		this.categoryId = categoryId;
		this.imgUrl = imgUrl;
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
