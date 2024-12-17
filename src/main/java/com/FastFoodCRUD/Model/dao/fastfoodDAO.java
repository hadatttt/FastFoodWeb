package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.fastfood;
import com.FastFoodCRUD.Model.dao.ConnectDatabase;

public class fastfoodDAO implements DAOInterface<fastfood>{
	private static fastfoodDAO instance;
	private Connection connect = ConnectDatabase.getConnection();
	private fastfoodDAO() {
	}
	public static fastfoodDAO getInstance() {
		if (instance == null)
			instance = new fastfoodDAO();
		return instance;
	}

	@Override
	public void Insert(fastfood fastFood) {
		String query = "insert into mon_an(ten_mon,mo_ta,phi,ma_danh_muc,img) value(?,?,?,?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, fastFood.getFastFoodName());
			pst.setString(2, fastFood.getDescription());
			pst.setFloat(3, fastFood.getPrice());
			pst.setInt(4, fastFood.getCategoryId());
			pst.setString(5, fastFood.getImgUrl());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(fastfood fastFood) {
		 String query = "UPDATE mon_an"
		 		+ " SET ten_mon = ?, mo_ta = ?, phi = ?, ma_danh_muc =  ?, img = ? WHERE id = ?";
			try {
				PreparedStatement pst = connect.prepareStatement(query);
				pst.setString(1, fastFood.getFastFoodName());
				pst.setString(2, fastFood.getDescription());
				pst.setFloat(3, fastFood.getPrice());
				pst.setInt(4, fastFood.getCategoryId());
				pst.setString(5, fastFood.getImgUrl());
				pst.setInt(6, fastFood.getFastFoodId());
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public void Delete(fastfood fastFood) {
		String query = "DELETE from mon_an where id = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, fastFood.getFastFoodId());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<fastfood> getAll() {
		ArrayList<fastfood> fastFoodArrayList = new ArrayList<fastfood>();
		try {
			String sqlQuery = "SELECT* FROM mon_an";
			PreparedStatement pst = connect.prepareStatement(sqlQuery);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				fastfood fastfood = new fastfood(res.getInt(1), res.getString(2), res.getString(3), res.getFloat(4), res.getInt(5), res.getString(6));
				fastFoodArrayList.add(fastfood);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fastFoodArrayList;
	}
	
	public fastfood getfastFoodById(int id) {
	    fastfood fastFood = null; 
	    String query = "SELECT * FROM mon_an WHERE id = ?";
	    try {
	        PreparedStatement pst = connect.prepareStatement(query);
	        pst.setInt(1, id); 
	        ResultSet res = pst.executeQuery();

	        if (res.next()) {
	            fastFood = new fastfood(
	                res.getInt(1), 
	                res.getString(2),        
	                res.getString(3),
	                res.getFloat(4),
	                res.getInt(5),
	                res.getString(6)
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return fastFood; 
	}
	
	
	public ArrayList<fastfood> getFastFoodByCategory(String category) {
		ArrayList<fastfood> fastFoodArrayList = new ArrayList<fastfood>();
		try {
			String sqlQuery = "SELECT * FROM mon_an ma inner join danh_muc dm on ma.ma_danh_muc=dm.ma_danh_muc  WHERE dm.ten_danh_muc = ?";
			PreparedStatement pst = connect.prepareStatement(sqlQuery);
			pst.setString(1, category);
			ResultSet res = pst.executeQuery();
			while (res.next()) {

				int id= res.getInt("id");
				String ten_mon = res.getString("ten_mon");
				String mota = res.getString("mo_ta");
				float price = res.getFloat("phi");
				String categoryname = res.getString("ten_danh_muc");
				String img =res.getString("img");
				fastfood fastFood = new fastfood(id, img, ten_mon, mota, price, categoryname);
				fastFoodArrayList.add(fastFood);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fastFoodArrayList;
	}
}
