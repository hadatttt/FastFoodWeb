package com.FastFoodCRUD.Controller;

import java.io.IOException;

import com.FastFoodCRUD.Model.bean.fastFood;
import com.FastFoodCRUD.Model.bo.fastFoodBO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteRoomController")

public class DeleteFastFoodController extends HttpServlet{
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int fastFoodId = Integer.parseInt(request.getParameter("fastFoodId"));
        fastFoodBO.getInstance().deleteFastFood(new fastFood(fastFoodId,"","","",(float) 0.0,0));
        response.sendRedirect(request.getContextPath() + "/FastFoodController");
    }
}
