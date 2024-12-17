package com.FastFoodCRUD.Controller.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.FastFoodCRUD.Model.bean.order;
import com.FastFoodCRUD.Model.bo.orderBO;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet("/employee")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<order> listOrder = orderBO.getInstance().getAllOrders();
		request.setAttribute("listOrder", listOrder);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Views/NhanVienHome.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
