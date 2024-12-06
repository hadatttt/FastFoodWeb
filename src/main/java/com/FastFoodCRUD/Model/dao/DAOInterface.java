package com.FastFoodCRUD.Model.dao;
import java.util.ArrayList;
public interface DAOInterface<T> {	
	public void Insert(T obj);
	public void Update(T obj);
	public void Delete(T obj);
	public ArrayList<T> getAll();
}
