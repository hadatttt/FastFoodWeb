package com.FastFoodCRUD.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.FastFoodCRUD.Model.bean.category;
import com.FastFoodCRUD.Model.bo.categoryBO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CategoryViewController")
public class CategoryViewController extends HttpServlet{
	 private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        ArrayList<category> categories = categoryBO.getInstance().getAllCateogry();

	        request.setAttribute("categories", categories);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("categoryView.jsp");
	        dispatcher.forward(request, response);
	    }
}
