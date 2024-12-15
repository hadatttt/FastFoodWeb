package com.FastFoodCRUD.Model.bo;

import com.FastFoodCRUD.Model.bean.user;
import com.FastFoodCRUD.Model.dao.userDAO;

public class userBO {
	private static userBO instance;
	private userBO() {
	}
	public static userBO getInstance() {
		if (instance == null)
			instance = new userBO();
		return instance;
	}
	public void insert(user user) {
		userDAO.getInstance().Insert(user);
	}
	public void update(user user) {
		userDAO.getInstance().Update(user);
	}
	public void delete(user user) {
		userDAO.getInstance().Delete(user);
	}
}
