package com.FastFoodCRUD.Model.bo;

import java.sql.Connection;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.account;
import com.FastFoodCRUD.Model.dao.accountDAO;

public class accountBO {
	private static accountBO instance;
	private accountBO() {
	}
	public static accountBO getInstance() {
		if (instance == null)
			instance = new accountBO();
		return instance;
	}
	public void insertAccount(account account) {
		accountDAO.getInstance().Insert(account);
	}
	public void updateAccount(account account) {
		accountDAO.getInstance().Update(account);
	}
	public void deleteAccount(account account) {
		accountDAO.getInstance().Delete(account);
	}
	public boolean isValidUser(String username, String password) {
		return accountDAO.getInstance().isValidUser(username, password);
	}
}
