package com.FastFoodCRUD.Controller;

import java.io.IOException;

import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.bo.fastFoodBO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateFastFoodController")
public class UpdateFastFoodController extends HttpServlet{
	 private static final long serialVersionUID = 1L;

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        int fastFoodID = Integer.parseInt(request.getParameter("fastFoodId"));
	        
	        fastFood fastFood = fastFoodBO.getInstance().getFastFoodById(fastFoodID);
	        request.setAttribute("fastfood", fastFood);
	        
	        request.getRequestDispatcher("/updateFastFood.jsp").forward(request, response);
	    }
}
