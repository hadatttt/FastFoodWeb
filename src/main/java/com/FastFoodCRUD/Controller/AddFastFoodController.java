	package com.FastFoodCRUD.Controller;

import java.io.IOException;

import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.bo.fastFoodBO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddFastFoodController")

public class AddFastFoodController extends HttpServlet{
	 private static final long serialVersionUID = 1L;

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String imgUrl = request.getParameter("imgUrl");
	        String fastFoodName = request.getParameter("fastFoodName");
	        String description = request.getParameter("description");
	        float price = Float.parseFloat(request.getParameter("price"));
	        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

	        fastFood newFastFood = new fastFood(0, imgUrl, fastFoodName, description, price, categoryId);

	        fastFoodBO fastFoodBOInstance = fastFoodBO.getInstance();
	        fastFoodBOInstance.insertFastFood(newFastFood);;

	        response.sendRedirect("FastFoodController");
	    }
}
