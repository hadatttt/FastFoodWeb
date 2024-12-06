<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Management Interface</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <!-- Admin Text -->
    <div class="container mx-auto px-4 pt-4">
        <h1 class="text-2xl font-bold text-gray-800 mb-4">Admin Dashboard</h1>
    </div>

    <div class="container mx-auto px-4 py-8">
        <!-- Search and Filter Section -->
        <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
            <div class="relative w-full md:w-1/3">
                <input type="text" placeholder="Search foods..." class="w-full pl-10 pr-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500">
                <svg class="absolute left-3 top-2.5 h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                </svg>
            </div>
            <select class="w-full md:w-1/4 py-2 px-4 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500">
                <option value="">All Categories</option>
                <option value="burgers">Burgers</option>
                <option value="pizza">Pizza</option>
                <option value="sides">Sides</option>
                <option value="drinks">Drinks</option>
                <option value="desserts">Desserts</option>
            </select>
            <button onclick="document.getElementById('addFoodModal').classList.remove('hidden')" class="w-full md:w-auto px-6 py-2 bg-orange-500 text-white rounded-lg hover:bg-orange-600 transition-colors">
                Add New Food
            </button>
        </div>

        <!-- Food Items Table -->
        <div class="overflow-x-auto bg-white rounded-lg shadow">
            <table class="min-w-full table-auto">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Food Item</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Image</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">Classic Burger</td>
                        <td class="px-6 py-4 whitespace-nowrap">Burgers</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd" alt="Classic Burger" class="h-12 w-12 rounded-lg object-cover">
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <button onclick="document.getElementById('editFoodModal').classList.remove('hidden')" class="text-indigo-600 hover:text-indigo-900 mr-4">Edit</button>
                            <button onclick="document.getElementById('deleteConfirmModal').classList.remove('hidden')" class="text-red-600 hover:text-red-900">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Add Food Modal -->
        <div id="addFoodModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
            <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-medium">Add New Food Item</h3>
                    <button onclick="document.getElementById('addFoodModal').classList.add('hidden')" class="text-gray-400 hover:text-gray-500">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
                <form class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Name</label>
                        <input type="text" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-orange-500 focus:ring-orange-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Description</label>
                        <textarea class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-orange-500 focus:ring-orange-500"></textarea>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Category</label>
                        <select class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-orange-500 focus:ring-orange-500">
                            <option>Burgers</option>
                            <option>Pizza</option>
                            <option>Sides</option>
                            <option>Drinks</option>
                            <option>Desserts</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Image</label>
                        <input type="file" class="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-orange-50 file:text-orange-700 hover:file:bg-orange-100">
                    </div>
                    <button type="submit" class="w-full bg-orange-500 text-white py-2 px-4 rounded-md hover:bg-orange-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500">Add Food Item</button>
                </form>
            </div>
        </div>

        <!-- Edit Food Modal -->
        <div id="editFoodModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
            <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-medium">Edit Food Item</h3>
                    <button onclick="document.getElementById('editFoodModal').classList.add('hidden')" class="text-gray-400 hover:text-gray-500">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
                <form class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Name</label>
                        <input type="text" value="Classic Burger" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-orange-500 focus:ring-orange-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Description</label>
                        <textarea class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-orange-500 focus:ring-orange-500">Delicious classic burger with cheese</textarea>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Category</label>
                        <select class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-orange-500 focus:ring-orange-500">
                            <option selected>Burgers</option>
                            <option>Pizza</option>
                            <option>Sides</option>
                            <option>Drinks</option>
                            <option>Desserts</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Image</label>
                        <input type="file" class="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-orange-50 file:text-orange-700 hover:file:bg-orange-100">
                    </div>
                    <button type="submit" class="w-full bg-orange-500 text-white py-2 px-4 rounded-md hover:bg-orange-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500">Update Food Item</button>
                </form>
            </div>
        </div>

        <!-- Delete Confirmation Modal -->
        <div id="deleteConfirmModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
            <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
                <div class="mt-3 text-center">
                    <h3 class="text-lg leading-6 font-medium text-gray-900">Delete Confirmation</h3>
                    <div class="mt-2 px-7 py-3">
                        <p class="text-sm text-gray-500">Are you sure you want to delete this food item? This action cannot be undone.</p>
                    </div>
                    <div class="flex justify-center gap-4 mt-4">
                        <button onclick="document.getElementById('deleteConfirmModal').classList.add('hidden')" class="px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400">Cancel</button>
                        <button class="px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>