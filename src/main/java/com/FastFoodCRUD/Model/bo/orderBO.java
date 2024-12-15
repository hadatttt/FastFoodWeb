package com.FastFoodCRUD.Model.bo;

import java.sql.Connection;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.order;
import com.FastFoodCRUD.Model.dao.orderDAO;

public class orderBO {
	private static orderBO instance;
	private orderBO() {
	}
	public static orderBO getInstance() {
		if (instance == null)
			instance = new orderBO();
		return instance;
	}
	public void insertOrder(order order) {
		orderDAO.getInstance().Insert(order);
	}
	public void updateOrder(order order) {
		orderDAO.getInstance().Update(order);
	}
	public void deleteOrder(order order) {
		orderDAO.getInstance().Delete(order);
	}
	public ArrayList<order> getAllOrders() {
		return orderDAO.getInstance().getAll();
	}
}
