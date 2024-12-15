package com.FastFoodCRUD.Model.bo;

import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.fastfood;
import com.FastFoodCRUD.Model.dao.fastfoodDAO;

public class fastfoodBO {
	private static fastfoodBO instance;
	private fastfoodBO() {
	}
	public static fastfoodBO getInstance() {
		if (instance == null)
			instance = new fastfoodBO();
		return instance;
	}
	
	public void insertFastFood(fastfood fastFood) {
		fastfoodDAO.getInstance().Insert(fastFood);
	}
	
	public void updateFastFood(fastfood fastFood) {
		fastfoodDAO.getInstance().Update(fastFood);
	}
	
	public void deleteFastFood(fastfood fastFood) {
		fastfoodDAO.getInstance().Delete(fastFood);
	}
	
	public ArrayList<fastfood> getAllFastFood() {
		return fastfoodDAO.getInstance().getAll();
	}
	
	public fastfood getFastFoodById(int id) {
		return fastfoodDAO.getInstance().getfastFoodById(id);
	}
	
	public ArrayList<fastfood> getFastFoodByCategory(int categoryId) {
		return fastfoodDAO.getInstance().getFastFoodByCategory(categoryId);
	}
}
