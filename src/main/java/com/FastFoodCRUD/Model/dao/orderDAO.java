package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.category;
import com.FastFoodCRUD.Model.bean.order;

public class orderDAO implements DAOInterface<order>{
	private static orderDAO instance;
	private Connection connect = ConnectDatabase.getConnection();
	private orderDAO() {
	}
	public static orderDAO getInstance() {
		if (instance == null)
			instance = new orderDAO();
		return instance;
	}
	
	@Override
	public void Insert(order order) {
		String query = "insert into don_hang"
				+ "(id_nguoi_dung, ma_cart, tong_tien, dia_chi, thoi_gian, status, id_nhan_vien)"
				+ " value(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, order.getUserId());
			pst.setInt(2, order.getCartId());
			pst.setFloat(3, order.getTotal());
			pst.setString(4, order.getAddress());
			pst.setDate(5, order.getTime());
			pst.setString(6, order.getStatus());
			pst.setInt(7, order.getEmployeeId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(order order) {
		String query = "UPDATE donhang"
				+ " SET id_nguoi_dung = ?, ma_cart = ?, tong_tien = ?, dia_chi = ?, thoi_gian = ?, status = ?, id_nhan_vien = ?"
				+ " WHERE ma_don_hang = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, order.getUserId());
			pst.setInt(2, order.getCartId());
			pst.setFloat(3, order.getTotal());
			pst.setString(4, order.getAddress());
			pst.setDate(5, order.getTime());
			pst.setString(6, order.getStatus());
			pst.setInt(7, order.getEmployeeId());
			pst.setInt(8, order.getOrderId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Delete(order order) {
		String query = "DELETE from don_hang where ma_don_hang = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, order.getOrderId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<order> getAll() {
		ArrayList<order> orderArrayList = new ArrayList<order>();
		try {
			String sqlQuery = "SELECT* FROM don_hang";
			PreparedStatement pst = connect.prepareStatement(sqlQuery);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				order order = new order(res.getInt(1), res.getInt(2), res.getInt(3), res.getFloat(4), res.getString(5), res.getDate(6), res.getString(7), res.getInt(8));
				orderArrayList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderArrayList;
	}

}
