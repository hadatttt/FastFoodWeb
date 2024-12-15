package com.FastFoodCRUD.Model.bo;

import java.sql.Connection;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.cart;
import com.FastFoodCRUD.Model.dao.cartDAO;

public class cartBO {
	private static cartBO instance;
	private cartBO() {
	}
	public static cartBO getInstance() {
		if (instance == null)
			instance = new cartBO();
		return instance;
	}
	public void insertCart(cart cart) {
		cartDAO.getInstance().Insert(cart);
	}
	public void updateCart(cart cart) {
		cartDAO.getInstance().Update(cart);
	}
	public void deleteCart(cart cart) {
		cartDAO.getInstance().Delete(cart);
	}
	public ArrayList<cart> getAllCarts() {
		return cartDAO.getInstance().getAll();
	}
}
