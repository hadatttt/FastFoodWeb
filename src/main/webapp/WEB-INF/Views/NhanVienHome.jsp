<%@page import="com.FastFoodCRUD.Model.dao.userDAO"%>
<%@page import="com.FastFoodCRUD.Model.bo.userBO"%>
<%@page import="com.FastFoodCRUD.Model.bean.order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FassFood Order Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-orange-50">
	<%	ArrayList<order> listOrder = (ArrayList<order>)request.getAttribute("listOrder"); %>
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex items-center justify-between mb-6">
                <h1 class="text-3xl font-bold text-orange-600">Order Management</h1>
                <div class="bg-orange-100 rounded-full px-4 py-2">
                    <span class="text-orange-600 font-semibold" id="orderCount">0 Pending Orders</span>
                </div>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full table-auto">
                    <thead>
                        <tr class="bg-orange-500 text-white">
                            <th class="px-4 py-3 text-left">Order ID</th>
                            <th class="px-4 py-3 text-left">Customer</th>
                            <th class="px-4 py-3 text-left">Items</th>
                            <th class="px-4 py-3 text-left">Total</th>
                            <th class="px-4 py-3 text-left">Time</th>
                            <th class="px-4 py-3 text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody id="orderTableBody">
                    <%
                    	if (!listOrder.isEmpty()){
	                    	for (order o:listOrder){
                    		
                    	
                    		%>
                    		<tr class="border-b hover:bg-orange-50">
                            <td class="px-4 py-3"><%= o.getOrderId() %></td>
                            <td class="px-4 py-3"><%=userDAO.getInstance().getNameById(o.getUserId()) %></td>
                            <td class="px-4 py-3">2x Burger, 1x Fries</td>
                            <td class="px-4 py-3"><%= o.getTotal() %></td>
                            <td class="px-4 py-3"><%= o.getT().toString() %></td>
                            <td class="px-4 py-3">
                                <a class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded-lg transition duration-200 cursor-pointer" onclick="approveOrder(this)" >Approve</a>
                            </td>
                        </tr>
                    		
                    <% 		
                    		}
                    	}
                    %>
                        
                       
                    </tbody>
                </table>
            </div>
            <div id="noOrders" class="hidden text-center py-8">
                <p class="text-gray-500 text-lg">No pending orders</p>
            </div>
        </div>
    </div>
    <script>
        function approveOrder(button) {
            const row = button.closest('tr');
            row.classList.add('bg-green-100');
            setTimeout(() => {
                row.remove();
                updateOrderCount();
                checkEmptyTable();
            }, 500);
        }

        function updateOrderCount() {
            const count = document.querySelectorAll('#orderTableBody tr').length;
            document.getElementById('orderCount').textContent = count + ' Pending Orders';
        }

        function checkEmptyTable() {
            const tbody = document.getElementById('orderTableBody');
            const noOrders = document.getElementById('noOrders');
            if (tbody.children.length === 0) {
                noOrders.classList.remove('hidden');
            }
        }

        updateOrderCount();
    </script>
</body>
</html>