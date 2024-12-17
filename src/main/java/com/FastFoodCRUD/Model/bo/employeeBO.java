package com.FastFoodCRUD.Model.bo;

import java.sql.Connection;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.employee;
import com.FastFoodCRUD.Model.dao.employeeDAO;

public class employeeBO {
	private static employeeBO instance;
	private employeeBO() {
	}
	public static employeeBO getInstance() {
		if (instance == null)
			instance = new employeeBO();
		return instance;
	}
	public void insertEmployee(employee employee) {
		employeeDAO.getInstance().Insert(employee);
	}
	public void updateEmployee(employee employee) {
		employeeDAO.getInstance().Update(employee);
	}
	public void deleteEmployee(employee employee) {
		employeeDAO.getInstance().Delete(employee);
	}
}
