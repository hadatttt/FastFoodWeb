package com.FastFoodCRUD.Model.bean;

public class employee {
	private int employeeId;
	private String name;
	private int accountId;
	private String email;
	private String phoneNumber;
	public employee(int employeeId, String name, int accountId, String email, String phoneNumber) {
		this.employeeId = employeeId;
		this.name = name;
		this.accountId = accountId;
		this.email = email;
		this.phoneNumber = phoneNumber;
	}
	public int getEmployeeId() {
		return this.employeeId;
	}
	public String getName() {
		return this.name;
	}
	public int getAccountId() {
		return this.accountId;
	}
	public String getEmail() {
		return this.email;
	}
	public String getPhoneNumber() {
		return this.phoneNumber;
	}
}
