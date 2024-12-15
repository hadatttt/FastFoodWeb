package com.FastFoodCRUD.Model.bean;

public class account {
	private int accountId;
	private String username;
	private String password;
	private String role;
	public account(int id, String username, String password, String role) {
		this.accountId = id;
		this.username = username;
		this.password = password;
		this.role = role;
	}
	public int getAccountId() {
		return this.accountId;
	}
	public String getUsername() {
		return this.username;
	}
	public String getPassword() {
		return this.password;
	}
	public String getRole() {
		return this.role;
	}
}
