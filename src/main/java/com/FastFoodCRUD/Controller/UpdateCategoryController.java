package com.FastFoodCRUD.Controller;

import java.io.IOException;

import com.FastFoodCRUD.Model.bean.category;
import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.bo.categoryBO;
import com.FastFoodCRUD.Model.bo.fastFoodBO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCategoryController")
public class UpdateCategoryController extends HttpServlet{
	 private static final long serialVersionUID = 1L;

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	        
	        category category = categoryBO.getInstance().getCategoryById(categoryId);
	        request.setAttribute("category", category);
	        
	        request.getRequestDispatcher("/updateCategory.jsp").forward(request, response);
	    }
}
