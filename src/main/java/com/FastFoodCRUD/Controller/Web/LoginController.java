package com.FastFoodCRUD.Controller.Web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.FastFoodCRUD.Model.bean.account;
import com.FastFoodCRUD.Model.bean.user;
import com.FastFoodCRUD.Model.bo.accountBO;
import com.FastFoodCRUD.Model.bo.userBO;
import com.FastFoodCRUD.Model.dao.accountDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/Views/Login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+" "+password);
		if (accountBO.getInstance().isValidUser(username, password)) {
			user USER = userBO.getInstance().getUserByUserName(username);
			request.getSession().setAttribute("USER", USER);
			if (accountDAO.getInstance().getRoleByIdAccount(USER.getAccountId()).equals("user")) {
				
				RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
				rd.forward(request, response);
			}else if (accountDAO.getInstance().getRoleByIdAccount(USER.getAccountId()).equals("employee")) {
				response.sendRedirect("/FastFoodCRUD/employee");
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Views/AdminHome.jsp");
				rd.forward(request, response);
			}
		}else {
			response.sendRedirect("/FastFoodCRUD/login");
		}
	}

}
