package com.FastFoodCRUD.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.account;

public class accountDAO implements DAOInterface<account>{
	private static accountDAO instance;
	private Connection connect = ConnectDatabase.getConnection();
	private accountDAO() {
	}
	public static accountDAO getInstance() {
		if (instance == null)
			instance = new accountDAO();
		return instance;
	}
	@Override
	public void Insert(account account) {
		String query = "insert into account(username,pass,role) value(?,?,?)";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, account.getUsername());
			pst.setString(2, account.getPassword());
			pst.setString(3, account.getRole());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(account account) {
		String query = "UPDATE account SET pass = ?, role = ? WHERE id_account = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setString(1, account.getPassword());
			pst.setString(2, account.getRole());
			pst.setInt(3, account.getAccountId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Delete(account account) {
		String query = "DELETE from account where id_account = ?";
		try {
			PreparedStatement pst = connect.prepareStatement(query);
			pst.setInt(1, account.getAccountId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isValidUser(String username, String password) {
        String query = "SELECT username, pass FROM account WHERE username = ? AND pass = ?";
        boolean isValid = false;

        try {
            PreparedStatement pst = connect.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);

            try (ResultSet res = pst.executeQuery()) {
                isValid = res.next(); 
            } catch (SQLException e) {
    			e.printStackTrace();
    		}
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }

	@Override
	public ArrayList<account> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
