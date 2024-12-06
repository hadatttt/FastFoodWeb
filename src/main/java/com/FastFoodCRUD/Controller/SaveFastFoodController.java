package com.FastFoodCRUD.Controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.bo.fastFoodBO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SaveFastFoodController")

public class SaveFastFoodController extends HttpServlet{
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int fastFoodId = Integer.parseInt(request.getParameter("fastFoodId"));
        String imgUrl = request.getParameter("imgUrl");
        String fastFoodName = request.getParameter("fastFoodName");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        
        fastFood fastFood = new fastFood(fastFoodId, imgUrl, fastFoodName, description, price, categoryId);
        fastFoodBO.getInstance().updateFastFood(fastFood);

        response.sendRedirect(request.getContextPath() + "/FastFoodController");
    }
}
