package com.FastFoodCRUD.Controller.Web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.Date;
import java.util.ArrayList;
import java.util.UUID;

import com.FastFoodCRUD.Model.bean.cart;
import com.FastFoodCRUD.Model.bean.fastfood;
import com.FastFoodCRUD.Model.bean.order;
import com.FastFoodCRUD.Model.bean.user;
import com.FastFoodCRUD.Model.bo.cartBO;
import com.FastFoodCRUD.Model.bo.fastfoodBO;
import com.FastFoodCRUD.Model.bo.orderBO;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = (String) request.getParameter("category");
		if (category!=null) {
			System.out.println(category);
			ArrayList<fastfood> listFastFood = fastfoodBO.getInstance().getFastFoodByCategory(category);
			request.setAttribute("listFastFood", listFastFood);
		}else {
			System.out.println("category null");
			ArrayList<fastfood> listFastFood = new ArrayList<fastfood>();
			request.setAttribute("listFastFood", listFastFood);
		}
		RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		user USER = (user) request.getSession().getAttribute("USER");
		float total =Float.parseFloat(request.getParameter("total"));
		String address = request.getParameter("address");
		if (USER!=null) {
			UUID uuid = UUID.randomUUID();
			String cartt = request.getParameter("cart");
			System.out.println(cartt);
			  String[] items = cartt.split(",");
		        for (String item : items) {
		            String[] parts = item.trim().split(" ");
		            int idmon = Integer.parseInt(parts[0]);
		            int soluon = Integer.parseInt(parts[1]); 
		            double price = Double.parseDouble(parts[2]);
		        
		            cartBO.getInstance().insertCart(new cart(uuid.toString(), idmon, soluon));
		        }
		        System.out.println("tới đây");
		        System.out.println(USER.getUserId());
		        orderBO.getInstance().insertOrder(new order(0, USER.getUserId(), uuid.toString(), total, address, new Date(System.currentTimeMillis()), "Chưa xử lý", 0));
		}else {
			response.sendRedirect("/FastFoodCRUD/login");
		}
	}

}
