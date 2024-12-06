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

@WebServlet("/DeleteCategoryController")

public class DeleteCategoryController extends HttpServlet{
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        categoryBO.getInstance().deleteCategory(new category(categoryId, ""));
        response.sendRedirect(request.getContextPath() + "/CategoryController");
    }
}
