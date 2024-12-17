package com.FastFoodCRUD.Controller.Web;

import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.fastfood;
import com.FastFoodCRUD.Model.bo.fastfoodBO;

public class test {
	public static void main (String []ar) {
		ArrayList<fastfood> listFastFood = fastfoodBO.getInstance().getFastFoodByCategory("Burgers");
		for (fastfood f: listFastFood) {
			System.out.println(f.getFastFoodName());
		}
	}
}
