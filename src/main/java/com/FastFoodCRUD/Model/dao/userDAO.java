package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		String query = "insert into user(ten_nguoi_dung,phone,email,id_account) value(?,?,?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getPhone());
			pst.setString(3, user.getEmail());
			pst.setInt(2, user.getAccountId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(user user) {
		String query = "UPDATE user SET ten_nguoi_dung =?, id_account = ?, phone=?, email=? WHERE id = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAccountId());
			pst.setString(3, user.getPhone());
			pst.setString(4, user.getEmail());
			pst.setInt(5, user.getUserId());
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
	
	public user getUserByUserName(String name) {
		user user = null; 
	    String query = "SELECT * FROM [user] inner join account on [user].id_account=account.id_account where username = ?";
	    try {
	        PreparedStatement pst = connect.prepareStatement(query);
	        pst.setString(1, name); 
	        ResultSet res = pst.executeQuery();

	        if (res.next()) {
	            user = new user(
	                res.getInt(1), 
	                res.getString(2),        
	                res.getString(4),
	                res.getString(5),
	                res.getInt(3)
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user; 
	}

	@Override
	public ArrayList<user> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String getNameById(int id) {
		String query = "SELECT * FROM [user]  where id = ?";
	    try {
	        PreparedStatement pst = connect.prepareStatement(query);
	        pst.setInt(1, id); 
	        ResultSet res = pst.executeQuery();

	        if (res.next()) {
	            return res.getString("ten_nguoi_dung");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null; 
	}

}