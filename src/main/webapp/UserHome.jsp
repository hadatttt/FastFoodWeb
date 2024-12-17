<%@page import="com.FastFoodCRUD.Model.bean.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FastFood Online</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-50">
    <header class="bg-white shadow-md fixed w-full top-0 z-50">
        <nav class="container mx-auto px-4 py-4 flex items-center justify-between">
            <div class="flex items-center space-x-8">
                <div class="text-2xl font-bold text-orange-500">FastFood</div>
                <div class="hidden md:flex space-x-6">
                    <a href="#" class="text-gray-600 hover:text-orange-500">Home</a>
                    <a href="#" class="text-gray-600 hover:text-orange-500">Menu</a>
                    <a href="#" class="text-gray-600 hover:text-orange-500">About</a>
                    <a href="#" class="text-gray-600 hover:text-orange-500">Contact</a>
                    <%user USER = (user)request.getSession().getAttribute("USER"); 
                    	if (USER!=null){
                    		%>
                    		<p>WELCOME, <%=USER.getName() %></p>
                    <% 		
                    	}
                    %>
                </div>
            </div>
            <div class="flex items-center space-x-4">
                <div class="relative">
                    <input type="text" id="searchInput" placeholder="Search foods..." onkeyup="searchFoods()" class="w-64 px-4 py-2 rounded-full border focus:outline-none focus:ring-2 focus:ring-orange-500">
                    <button class="absolute right-3 top-2.5 text-gray-400"><i class="fas fa-search"></i></button>
                    <div id="searchSuggestions" class="absolute w-full mt-1 bg-white rounded-lg shadow-lg max-h-60 overflow-y-auto hidden">
                    </div>
                </div>
                <div class="relative">
                    <button onclick="document.getElementById('cartModal').classList.remove('hidden')" class="text-gray-600 hover:text-orange-500"><i class="fas fa-shopping-cart text-xl"></i></button>
                    <span id="cartCount" class="absolute -top-2 -right-2 bg-orange-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs">0</span>
                </div>
                <% 
                	if (USER==null){
                		%>
                <a href="/FastFoodCRUD/login" class="bg-orange-500 text-white px-6 py-2 rounded-full hover:bg-orange-600">Login</a>
                	
                	
                <% 	}else{
                	%>
                
                <a href="/FastFoodCRUD/login" class="bg-orange-500 text-white px-6 py-2 rounded-full hover:bg-orange-600">LogOut</a>
                <% }
                	
                %>
            </div>
        </nav>
    </header>

    <div id="cartModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center border-b pb-3">
                <h3 class="text-xl font-semibold text-gray-900">Shopping Cart</h3>
                <button onclick="document.getElementById('cartModal').classList.add('hidden')" class="text-gray-400 hover:text-gray-500"><i class="fas fa-times"></i></button>
            </div>
            <div id="cartItems" class="mt-4 space-y-3">
            </div>
            <div class="mt-4 border-t pt-3">
                <div class="flex justify-between items-center mb-4">
                    <span class="font-semibold">Total:</span>
                    <span id="cartTotal" class="font-bold text-orange-500">$0.00</span>
                </div>
                <button onclick="showPaymentModal()" class="w-full bg-orange-500 text-white py-2 rounded-full hover:bg-orange-600">Proceed to Payment</button>
            </div>
        </div>
    </div>

    <div id="paymentModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center border-b pb-3">
                <h3 class="text-xl font-semibold text-gray-900">Payment Details</h3>
                <button onclick="document.getElementById('paymentModal').classList.add('hidden')" class="text-gray-400 hover:text-gray-500"><i class="fas fa-times"></i></button>
            </div>
            <div class="mt-4">
                <form id="paymentForm" action="home" method="POST" class="space-y-4">
                    <div>
                        <label class="block text-gray-700 text-sm font-bold mb-2">Payment Method</label>
                        <div class="space-y-2">
                            <label class="flex items-center">
                                <input type="radio" name="paymentMethod" value="card" checked class="mr-2">
                                <span>Credit/Debit Card</span>
                            </label>
                            <label class="flex items-center">
                                <input type="radio" name="paymentMethod" value="paypal" class="mr-2">
                                <span>PayPal</span>
                            </label>
                        </div>
                    </div>
                    <div id="cardDetails">
                    	<div class="mb-3">
                            <label class="block text-gray-700 text-sm font-bold mb-2">Địa chỉ</label>
                            <input type="text" placeholder="10, Lê Ngô Cát" name="address" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500" maxlength="19" required>
                        </div>
                        <div class="mb-3">
                            <label class="block text-gray-700 text-sm font-bold mb-2">Card Number</label>
                            <input type="text" placeholder="1234 5678 9012 3456" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500" maxlength="19" required>
                        </div>
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-gray-700 text-sm font-bold mb-2">Expiry Date</label>
                                <input type="text" placeholder="MM/YY" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500" maxlength="5" required>
                            </div>
                            <div>
                                <label class="block text-gray-700 text-sm font-bold mb-2">CVV</label>
                                <input type="password" placeholder="123" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500" maxlength="3" required>
                            </div>
                        </div>
                    </div>
                    <div class="border-t pt-4">
                        <div class="flex justify-between items-center mb-4">
                            <span class="font-semibold">Total Amount:</span>
                            <span id="paymentTotal" class="font-bold text-orange-500"></span>
                        </div>
                   		
                        <button type="submit" class="w-full bg-orange-500 text-white py-2 rounded-full hover:bg-orange-600">Complete Payment</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <main class="container mx-auto px-4 mt-24 flex">
        <aside class="hidden md:block w-64 pr-8">
            <h2 class="text-xl font-semibold mb-4">Categories</h2>
            <ul class="space-y-2">
                <li><a href="#" onclick="showCategory('burgers')" class="block p-2 rounded hover:bg-orange-100 text-gray-700">🍔 Burgers</a></li>
                <li><a href="#" onclick="showCategory('pizza')" class="block p-2 rounded hover:bg-orange-100 text-gray-700">🍕 Pizza</a></li>
                <li><a href="#" onclick="showCategory('sides')" class="block p-2 rounded hover:bg-orange-100 text-gray-700">🍟 Sides</a></li>
                <li><a href="#" onclick="showCategory('drinks')" class="block p-2 rounded hover:bg-orange-100 text-gray-700">🥤 Drinks</a></li>
                <li><a href="#" onclick="showCategory('desserts')" class="block p-2 rounded hover:bg-orange-100 text-gray-700">🍦 Desserts</a></li>
            </ul>
        </aside>

        <div class="flex-1">
            <div id="foodItems" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            </div>
        </div>
    </main>

    <footer class="bg-gray-800 text-white mt-16">
        <div class="container mx-auto px-4 py-8">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div>
                    <h3 class="text-xl font-semibold mb-4">Contact Us</h3>
                    <p class="text-gray-300">Phone: (555) 123-4567</p>
                    <p class="text-gray-300">Email: info@fastfood.com</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold mb-4">Follow Us</h3>
                    <div class="flex space-x-4">
                        <a href="#" class="text-gray-300 hover:text-white"><i class="fab fa-facebook"></i></a>
                        <a href="#" class="text-gray-300 hover:text-white"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-gray-300 hover:text-white"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div>
                    <h3 class="text-xl font-semibold mb-4">Store Hours</h3>
                    <p class="text-gray-300">Mon-Fri: 10:00 AM - 10:00 PM</p>
                    <p class="text-gray-300">Sat-Sun: 11:00 AM - 11:00 PM</p>
                </div>
            </div>
        </div>
    </footer>

    <script>
        let cart = [];
        let total = 0;

        const menuItems = {
            burgers: [
                {id:1, name: "Classic Burger", price: 8.99, image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd", description: "Juicy beef patty with fresh vegetables" },
                {id:2, name: "Cheese Burger", price: 9.99, image: "https://images.unsplash.com/photo-1586190848861-99aa4a171e90", description: "Classic burger with melted cheese" },
                {id:3, name: "Double Burger", price: 12.99, image: "https://images.unsplash.com/photo-1553979459-d2229ba7433b", description: "Double patty with extra toppings" }
            ],
            pizza: [
                {id:4, name: "Pepperoni Pizza", price: 12.99, image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38", description: "Classic pizza with pepperoni toppings" },
                {id:5, name: "Margherita Pizza", price: 10.99, image: "https://images.unsplash.com/photo-1574071318508-1cdbab80d002", description: "Traditional Italian pizza" },
                {id:6, name: "Vegetarian Pizza", price: 11.99, image: "https://images.unsplash.com/photo-1513104890138-7c749659a591", description: "Fresh vegetables on crispy crust" }
            ],
            sides: [
                {id:7, name: "French Fries", price: 4.99, image: "https://images.unsplash.com/photo-1619747175439-e81fb03e5dda", description: "Crispy golden fries with seasoning" },
                {id:8, name: "Onion Rings", price: 5.99, image: "https://images.unsplash.com/photo-1639024471283-03518883512d", description: "Crispy battered onion rings" },
                {id:9, name: "Chicken Wings", price: 8.99, image: "https://images.unsplash.com/photo-1608039829572-78524f79c4c7", description: "Spicy buffalo wings" }
            ],
            drinks: [
                {id:10, name: "Cola", price: 2.99, image: "https://images.unsplash.com/photo-1622483767028-3f66f32aef97", description: "Classic cola drink" },
                {id:11, name: "Milkshake", price: 4.99, image: "https://images.unsplash.com/photo-1577805947697-89e18249d767", description: "Creamy vanilla milkshake" },
                {id:12, name: "Lemonade", price: 3.99, image: "https://images.unsplash.com/photo-1621263764928-df1444c5e859", description: "Fresh squeezed lemonade" }
            ],
            desserts: [
                {id:13, name: "Ice Cream", price: 4.99, image: "https://images.unsplash.com/photo-1563805042-7684c019e1cb", description: "Vanilla ice cream with toppings" },
                {id:14, name: "Chocolate Cake", price: 6.99, image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587", description: "Rich chocolate cake" },
                {id:15, name: "Apple Pie", price: 5.99, image: "https://images.unsplash.com/photo-1621743478914-cc8a86d7e9f4", description: "Homemade apple pie" }
            ]
        };

        function searchFoods() {
            const searchInput = document.getElementById('searchInput');
            const suggestionsDiv = document.getElementById('searchSuggestions');
            const searchTerm = searchInput.value.toLowerCase();

            if (searchTerm.length === 0) {
                suggestionsDiv.classList.add('hidden');
                return;
            }

            let allItems = [];
            for (let category in menuItems) {
                allItems = allItems.concat(menuItems[category]);
            }

            const matchingItems = allItems.filter(item =>
                item.name.toLowerCase().includes(searchTerm) ||
                item.description.toLowerCase().includes(searchTerm)
            );

            if (matchingItems.length > 0) {
                suggestionsDiv.classList.remove('hidden');
                suggestionsDiv.innerHTML = matchingItems.map(item => `
                    <div class="p-2 hover:bg-orange-50 cursor-pointer flex items-center space-x-3" 
                         onclick="selectFoodItem('${item.name}', ${item.price}, '${item.image}')">
                        <img src="${item.image}" class="w-12 h-12 object-cover rounded">
                        <div>
                            <div class="font-medium">${item.name}</div>
                            <div class="text-sm text-gray-500">$${item.price}</div>
                        </div>
                    </div>
                `).join('');
            } else {
                suggestionsDiv.innerHTML = '<div class="p-2 text-gray-500">No items found</div>';
                suggestionsDiv.classList.remove('hidden');
            }
        }

        function selectFoodItem(name, price, image) {
            addToCart(name, price, image);
            document.getElementById('searchInput').value = '';
            document.getElementById('searchSuggestions').classList.add('hidden');
        }

        document.addEventListener('click', function(e) {
            const searchSuggestions = document.getElementById('searchSuggestions');
            const searchInput = document.getElementById('searchInput');
            if (!searchInput.contains(e.target)) {
                searchSuggestions.classList.add('hidden');
            }
        });

        function showCategory(category) {
            const foodItems = document.getElementById('foodItems');
            foodItems.innerHTML = '';
            
            menuItems[category].forEach(item => {
            	// Tạo div cho mỗi món ăn
                const foodItemDiv = document.createElement('div');
                foodItemDiv.classList.add('bg-white', 'rounded-lg', 'shadow-md', 'overflow-hidden', 'hover:shadow-lg', 'transition-shadow');

                // Tạo hình ảnh
                const image = document.createElement('img');
                image.src = item.image;
                image.alt = item.name;
                image.classList.add('w-full', 'h-48', 'object-cover');
                
                // Tạo div cho phần mô tả
                const contentDiv = document.createElement('div');
                contentDiv.classList.add('p-4');

                // Tạo tiêu đề món ăn
                const title = document.createElement('h3');
                title.classList.add('text-lg', 'font-semibold');
                title.textContent = item.name;

                // Tạo mô tả món ăn
                const description = document.createElement('p');
                description.classList.add('text-gray-600', 'text-sm', 'mt-1');
                description.textContent = item.description;

                // Tạo phần giá và nút thêm vào giỏ hàng
                const priceAndButtonDiv = document.createElement('div');
                priceAndButtonDiv.classList.add('mt-4', 'flex', 'items-center', 'justify-between');

                const price = document.createElement('span');
                price.classList.add('text-orange-500', 'font-bold');
                price.textContent = item.price;

                const button = document.createElement('button');
                button.classList.add('bg-orange-500', 'text-white', 'px-4', 'py-2', 'rounded-full', 'hover:bg-orange-600');
                button.textContent = 'Add to Cart';
                button.onclick = () => addToCart(item.name, item.price, item.image, item.id);

                // Thêm các phần tử vào foodItemDiv
                priceAndButtonDiv.appendChild(price);
                priceAndButtonDiv.appendChild(button);
                contentDiv.appendChild(title);
                contentDiv.appendChild(description);
                contentDiv.appendChild(priceAndButtonDiv);
                foodItemDiv.appendChild(image);
                foodItemDiv.appendChild(contentDiv);

                // Thêm phần tử foodItemDiv vào foodItems
                foodItems.appendChild(foodItemDiv);
            });
            	
        }

        showCategory('burgers');

        function addToCart(name, price, image,id) {
            const existingItem = cart.find(item => item.name === name);
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                cart.push({ name, price, image, id, quantity: 1 });
            }
            total += price;
            updateCart();
            showNotification(`Added ${name} to cart`);
        }

        function removeFromCart(name, price) {
            const itemIndex = cart.findIndex(item => item.name === name);
            if (itemIndex > -1) {
                if (cart[itemIndex].quantity > 1) {
                    cart[itemIndex].quantity -= 1;
                } else {
                    cart.splice(itemIndex, 1);
                }
                total -= price;
                updateCart();
            }
        }

        function updateCart() {
            const cartItems = document.getElementById('cartItems');
            const cartCount = document.getElementById('cartCount');
            const cartTotal = document.getElementById('cartTotal');
            const paymentTotal = document.getElementById('paymentTotal');
            
            cartItems.innerHTML = '';
            let totalQuantity = 0;

            cart.forEach(item => {
                totalQuantity += item.quantity;
             // Tạo div chứa toàn bộ thông tin về món ăn
                const cartItemDiv = document.createElement('div');
                cartItemDiv.classList.add('flex', 'items-center', 'justify-between');

                // Tạo div chứa hình ảnh và tên món ăn
                const itemInfoDiv = document.createElement('div');
                itemInfoDiv.classList.add('flex', 'items-center', 'space-x-3');

                // Tạo hình ảnh
                const image = document.createElement('img');
                image.src = item.image;
                image.classList.add('w-16', 'h-16', 'object-cover', 'rounded');

                // Tạo tên món ăn và giá
                const infoDiv = document.createElement('div');

                const name = document.createElement('h4');
                name.classList.add('text-sm', 'font-medium');
                name.textContent = item.name;

                const price = document.createElement('p');
                price.classList.add('text-sm', 'text-gray-500');
                price.textContent = item.price;

                // Thêm hình ảnh và thông tin món ăn vào itemInfoDiv
                infoDiv.appendChild(name);
                infoDiv.appendChild(price);
                itemInfoDiv.appendChild(image);
                itemInfoDiv.appendChild(infoDiv);

                // Tạo div cho các nút + và - và hiển thị số lượng
                const quantityDiv = document.createElement('div');
                quantityDiv.classList.add('flex', 'items-center', 'space-x-2');

                // Tạo nút giảm số lượng
                const minusButton = document.createElement('button');
                minusButton.classList.add('text-gray-500', 'hover:text-gray-600');
                minusButton.textContent = '-';
                minusButton.onclick = () => removeFromCart(item.name, item.price);

                // Tạo phần hiển thị số lượng
                const quantity = document.createElement('span');
                quantity.classList.add('text-gray-600');
                quantity.textContent = item.quantity;

                // Tạo nút tăng số lượng
                const plusButton = document.createElement('button');
                plusButton.classList.add('text-gray-500', 'hover:text-gray-600');
                plusButton.textContent = '+';
                plusButton.onclick = () => addToCart(item.name, item.price, item.image);

                // Thêm nút giảm, số lượng và nút tăng vào quantityDiv
                quantityDiv.appendChild(minusButton);
                quantityDiv.appendChild(quantity);
                quantityDiv.appendChild(plusButton);

                // Thêm itemInfoDiv và quantityDiv vào cartItemDiv
                cartItemDiv.appendChild(itemInfoDiv);
                cartItemDiv.appendChild(quantityDiv);

                // Thêm cartItemDiv vào cartItems (phần tử hiển thị giỏ hàng)
                cartItems.appendChild(cartItemDiv);
            });

            cartCount.textContent = totalQuantity;
            cartTotal.textContent = total.toFixed(2);
            if(paymentTotal) {
                paymentTotal.textContent = total;
            }
        }

        function showNotification(message) {
            const notification = document.createElement('div');
            notification.className = 'fixed bottom-4 right-4 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg transition-opacity duration-300';
            notification.textContent = message;
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.style.opacity = '0';
                setTimeout(() => notification.remove(), 300);
            }, 2000);
        }

        function showPaymentModal() {
            document.getElementById('cartModal').classList.add('hidden');
            document.getElementById('paymentModal').classList.remove('hidden');
            document.getElementById('paymentTotal').textContent = total;
            const paymentForm = document.getElementById('paymentForm');
            const inputField = document.createElement('input');
            inputField.type = 'hidden';
            inputField.name = 'cart';
            const cartDetails = cart.map(item => item.id+" "+item.quantity+" "+item.price).join(',');
            inputField.value = cartDetails;
            paymentForm.appendChild(inputField);
			console.log(cartDetails);
			const inputField1 = document.createElement('input');
            inputField1.type = 'hidden';
            inputField1.name = 'total';
            inputField1.value = total;
            paymentForm.appendChild(inputField1);
        }

      
    </script>
</body>
</html>