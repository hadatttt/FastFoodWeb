package com.FastFoodCRUD.Controller;

import jakarta.servlet.http.HttpServlet;
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

@WebServlet("/SaveCategoryController")

public class SaveCategoryController extends HttpServlet{
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("category"));
        String categoryName = request.getParameter("categoryName");
        
        category category = new category(categoryId, categoryName);
        categoryBO.getInstance().updateCategory(category);

        response.sendRedirect(request.getContextPath() + "/CategoryController");
    }
}
