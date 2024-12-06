package com.FastFoodCRUD.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.bo.fastFoodBO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FastFoodViewController")
public class FastFoodViewController extends HttpServlet{
	 private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        ArrayList<fastFood> fastFoods = fastFoodBO.getInstance().getAllFastFood();

	        request.setAttribute("fastFoods", fastFoods);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("fastFoodView.jsp");
	        dispatcher.forward(request, response);
	    }
}
