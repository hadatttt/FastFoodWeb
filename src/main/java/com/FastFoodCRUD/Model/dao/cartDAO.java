package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.cart;
import com.FastFoodCRUD.Model.bean.category;

public class cartDAO implements DAOInterface<cart>{
	private static cartDAO instance;
	private Connection connect = ConnectDatabase.getConnection();
	private cartDAO() {
	}
	public static cartDAO getInstance() {
		if (instance == null)
			instance = new cartDAO();
		return instance;
	}

	@Override
	public void Insert(cart cart) {
		String query = "insert into cart(ma_cart, ma_mon_an, so_luong) values(?,?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, cart.getCartId());
			pst.setInt(2, cart.getFastfoodId());
			pst.setInt(3, cart.getQuantity());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void Update(cart cart) {
		String query = "UPDATE cart SET ma_mon_an = ?, so_luong = ? WHERE ma_cart = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, cart.getFastfoodId());
			pst.setInt(2, cart.getQuantity());
			pst.setString(3, cart.getCartId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void Delete(cart cart) {
		String query = "DELETE from cart where ma_cart = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, cart.getCartId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<cart> getAll() {
		ArrayList<cart> cartArrayList = new ArrayList<cart>();
		try {
			String sqlQuery = "SELECT* FROM cart";
			PreparedStatement pst = connect.prepareStatement(sqlQuery);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				cart cart = new cart(res.getString(1), res.getInt(2), res.getInt(3));
				cartArrayList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartArrayList;
	}

}
