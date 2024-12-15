package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.employee;

public class employeeDAO implements DAOInterface<employee>{
	private static employeeDAO instance;
	private Connection connect = ConnectDatabase.getConnection();
	private employeeDAO() {
	}
	public static employeeDAO getInstance() {
		if (instance == null)
			instance = new employeeDAO();
		return instance;
	}

	@Override
	public void Insert(employee employee) {
		String query = "insert into employ(ten,id_account,email,phone) value(?,?,?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, employee.getName());
			pst.setInt(2, employee.getAccountId());
			pst.setString(3, employee.getEmail());
			pst.setString(4, employee.getPhoneNumber());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(employee employee) {
		String query = "UPDATE employ SET ten = ?,id_account = ?, email =?, phone = ? WHERE id = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, employee.getName());
			pst.setInt(2, employee.getAccountId());
			pst.setString(3, employee.getEmail());
			pst.setString(4, employee.getPhoneNumber());
			pst.setInt(5, employee.getEmployeeId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Delete(employee employee) {
		String query = "DELETE from employ where id = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, employee.getEmployeeId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<employee> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
