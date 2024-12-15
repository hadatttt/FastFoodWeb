package com.FastFoodCRUD.Model.bo;

import java.sql.Connection;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.category;
import com.FastFoodCRUD.Model.dao.categoryDAO;

public class categoryBO {
	private static categoryBO instance;
	private categoryBO() {
	}
	public static categoryBO getInstance() {
		if (instance == null)
			instance = new categoryBO();
		return instance;
	}
	
	public void insertCategory(category category) {
		categoryDAO.getInstance().Insert(category);
	}
	
	public void updateCategory(category category) {
		categoryDAO.getInstance().Update(category);
	}
	
	public void deleteCategory(category cateogory) {
		categoryDAO.getInstance().Delete(cateogory);
	}
	
	public ArrayList<category> getAllCateogry() {
		return categoryDAO.getInstance().getAll();
	}
	
	public category getCategoryById(int id) {
		return categoryDAO.getInstance().getCategoryById(id);
	}
}
