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
                        <tr class="border-b hover:bg-orange-50">
                            <td class="px-4 py-3">#ORD001</td>
                            <td class="px-4 py-3">John Doe</td>
                            <td class="px-4 py-3">2x Burger, 1x Fries</td>
                            <td class="px-4 py-3">$25.99</td>
                            <td class="px-4 py-3">10:30 AM</td>
                            <td class="px-4 py-3">
                                <button class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded-lg transition duration-200" onclick="approveOrder(this)">Approve</button>
                            </td>
                        </tr>
                        <tr class="border-b hover:bg-orange-50">
                            <td class="px-4 py-3">#ORD002</td>
                            <td class="px-4 py-3">Sarah Smith</td>
                            <td class="px-4 py-3">1x Pizza, 2x Coke</td>
                            <td class="px-4 py-3">$32.50</td>
                            <td class="px-4 py-3">11:15 AM</td>
                            <td class="px-4 py-3">
                                <button class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded-lg transition duration-200" onclick="approveOrder(this)">Approve</button>
                            </td>
                        </tr>
                        <tr class="border-b hover:bg-orange-50">
                            <td class="px-4 py-3">#ORD003</td>
                            <td class="px-4 py-3">Mike Johnson</td>
                            <td class="px-4 py-3">3x Tacos, 1x Salad</td>
                            <td class="px-4 py-3">$18.75</td>
                            <td class="px-4 py-3">11:45 AM</td>
                            <td class="px-4 py-3">
                                <button class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded-lg transition duration-200" onclick="approveOrder(this)">Approve</button>
                            </td>
                        </tr>
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