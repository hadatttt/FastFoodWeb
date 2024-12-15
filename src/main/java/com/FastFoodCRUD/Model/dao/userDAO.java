package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.user;

public class userDAO implements DAOInterface<user>{
	private static userDAO instance;
	private Connection connect = ConnectDatabase.getConnection();
	private userDAO() {
	}
	public static userDAO getInstance() {
		if (instance == null)
			instance = new userDAO();
		return instance;
	}

	@Override
	public void Insert(user user) {
		String query = "insert into user(ten_nguoi_dung,id_account) value(?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAccountId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(user user) {
		String query = "UPDATE user SET ten_nguoi_dung =?, id_account = ? WHERE id = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAccountId());
			pst.setInt(3, user.getUserId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Delete(user user) {
		String query = "DELETE from user where id = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, user.getUserId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<user> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
