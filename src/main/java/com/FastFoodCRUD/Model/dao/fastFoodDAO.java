package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.dao.ConnectDatabase;

public class fastFoodDAO implements DAOInterface<fastFood>{
	private static fastFoodDAO instance;
	private Connection connect = ConnectDatabase.getConnection();
	private fastFoodDAO() {
	}
	public static fastFoodDAO getInstance() {
		if (instance == null)
			instance = new fastFoodDAO();
		return instance;
	}

	@Override
	public void Insert(fastFood fastFood) {
		String query = "insert into fastfood(imgUrl, fastFoodName, description, price, categoryId) value(?,?,?,?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, fastFood.getImgUrl());
			pst.setString(2, fastFood.getFastFoodName());
			pst.setString(3, fastFood.getDescription());
			pst.setFloat(4, fastFood.getPrice());
			pst.setInt(5, fastFood.getCategoryId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(fastFood fastFood) {
		 String query = "UPDATE fastFood SET imgUrl = ?, fastFoodName = ?, description = ?, price = ?, categoryId WHERE fastFoodId = ?";
			try {
				PreparedStatement pst = connect.prepareStatement(query);
				pst.setString(1, fastFood.getImgUrl());
				pst.setString(2, fastFood.getFastFoodName());
				pst.setString(3, fastFood.getDescription());
				pst.setFloat(4, fastFood.getPrice());
				pst.setInt(5, fastFood.getCategoryId());
				pst.setInt(6, fastFood.getFastFoodId());
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public void Delete(fastFood fastFood) {
		String query = "DELETE from fastfood where fastFoodId = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, fastFood.getFastFoodId());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<fastFood> getAll() {
		ArrayList<fastFood> fastFoodArrayList = new ArrayList<fastFood>();
		try {
			String sqlQuery = "SELECT* FROM fastFood";
			PreparedStatement pst = connect.prepareStatement(sqlQuery);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				fastFood employee = new fastFood(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getFloat(5), res.getInt(6));
				fastFoodArrayList.add(employee);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fastFoodArrayList;
	}
	
	public fastFood getfastFoodById(int id) {
	    fastFood fastFood = null; 
	    String query = "SELECT * FROM fastfood WHERE fastFoodId = ?";
	    try {
	        PreparedStatement pst = connect.prepareStatement(query);
	        pst.setInt(1, id); 
	        ResultSet res = pst.executeQuery();

	        if (res.next()) {
	            fastFood = new fastFood(
	                res.getInt(1), 
	                res.getString(2),        
	                res.getString(3),
	                res.getString(3),
	                res.getFloat(5),
	                res.getInt(6)
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return fastFood; 
	}
	
	public ArrayList<fastFood> getFastFoodByCategory(int categoryId) {
		ArrayList<fastFood> fastFoodArrayList = new ArrayList<fastFood>();
		try {
			String sqlQuery = "SELECT* FROM fastFood WHERE categoryId = ?";
			PreparedStatement pst = connect.prepareStatement(sqlQuery);
			pst.setInt(1, categoryId);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				fastFood fastFood = new fastFood(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getFloat(5), res.getInt(6));
				fastFoodArrayList.add(fastFood);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fastFoodArrayList;
	}
}
