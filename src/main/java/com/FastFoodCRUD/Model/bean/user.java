package com.FastFoodCRUD.Model.bean;

public class user {
	private int userId;
	private String name;
	private String phone;
	private String email;
	private int accountId;
	public user(int userId, String name, String phone, String email, int accountId) {
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.accountId = accountId;
	}
	public int getUserId() {
		return this.userId;
	}
	public String getName() {
		return this.name;
	}
	public String getPhone() {
		return this.phone;
	}
	public String getEmail() {
		return this.email;
	}
	public int getAccountId() {
		return this.accountId;
	}
}
