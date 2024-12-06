package com.FastFoodCRUD.Model.bo;

import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.dao.fastFoodDAO;

public class fastFoodBO {
	private static fastFoodBO instance;
	private fastFoodBO() {
	}
	public static fastFoodBO getInstance() {
		if (instance == null)
			instance = new fastFoodBO();
		return instance;
	}
	
	public void insertFastFood(fastFood fastFood) {
		fastFoodDAO.getInstance().Insert(fastFood);
	}
	
	public void updateFastFood(fastFood fastFood) {
		fastFoodDAO.getInstance().Update(fastFood);
	}
	
	public void deleteFastFood(fastFood fastFood) {
		fastFoodDAO.getInstance().Delete(fastFood);
	}
	
	public ArrayList<fastFood> getAllFastFood() {
		return fastFoodDAO.getInstance().getAll();
	}
	
	public fastFood getFastFoodById(int id) {
		return fastFoodDAO.getInstance().getfastFoodById(id);
	}
	
	public ArrayList<fastFood> getFastFoodByCategory(int categoryId) {
		return fastFoodDAO.getInstance().getFastFoodByCategory(categoryId);
	}
}
