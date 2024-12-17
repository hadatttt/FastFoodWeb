package com.FastFoodCRUD.Model.bean;

import java.sql.Date;
import java.sql.Time;

public class order {
	private int orderId;
	private int userId;
	private String cartId;
	private float total;
	private String address;
	private Date time;
	private String status;
	private int employeeId;
	private Time t;
	
	public Time getT() {
		return t;
	}
	public void setT(Time t) {
		this.t = t;
	}
	public order(int orderId, int userId, String cartId, float total, String address, Date time, String status, int employeeId) {
		this.orderId = orderId;
		this.userId = userId;
		this.cartId = cartId;
		this.total = total;
		this.address = address;
		this.time = time;
		this.status = status;
		this.employeeId = employeeId;
	}
	public int getOrderId() {
		return this.orderId;
	}
	public int getUserId() {
		return this.userId;
	}
	public String getCartId() {
		return this.cartId;
	}
	public float getTotal() {
		return this.total;
	}
	public String getAddress() {
		return this.address;
	}
	public Date getTime() {
		return this.time;
	}
	public String getStatus() {
		return this.status;
	}
	public int getEmployeeId() {
		return this.employeeId;
	}
}
