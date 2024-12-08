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
                <button class="bg-orange-500 text-white px-6 py-2 rounded-full hover:bg-orange-600">Login</button>
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
                <form id="paymentForm" onsubmit="processPayment(event)" class="space-y-4">
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
                { name: "Classic Burger", price: 8.99, image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd", description: "Juicy beef patty with fresh vegetables" },
                { name: "Cheese Burger", price: 9.99, image: "https://images.unsplash.com/photo-1586190848861-99aa4a171e90", description: "Classic burger with melted cheese" },
                { name: "Double Burger", price: 12.99, image: "https://images.unsplash.com/photo-1553979459-d2229ba7433b", description: "Double patty with extra toppings" }
            ],
            pizza: [
                { name: "Pepperoni Pizza", price: 12.99, image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38", description: "Classic pizza with pepperoni toppings" },
                { name: "Margherita Pizza", price: 10.99, image: "https://images.unsplash.com/photo-1574071318508-1cdbab80d002", description: "Traditional Italian pizza" },
                { name: "Vegetarian Pizza", price: 11.99, image: "https://images.unsplash.com/photo-1513104890138-7c749659a591", description: "Fresh vegetables on crispy crust" }
            ],
            sides: [
                { name: "French Fries", price: 4.99, image: "https://images.unsplash.com/photo-1619747175439-e81fb03e5dda", description: "Crispy golden fries with seasoning" },
                { name: "Onion Rings", price: 5.99, image: "https://images.unsplash.com/photo-1639024471283-03518883512d", description: "Crispy battered onion rings" },
                { name: "Chicken Wings", price: 8.99, image: "https://images.unsplash.com/photo-1608039829572-78524f79c4c7", description: "Spicy buffalo wings" }
            ],
            drinks: [
                { name: "Cola", price: 2.99, image: "https://images.unsplash.com/photo-1622483767028-3f66f32aef97", description: "Classic cola drink" },
                { name: "Milkshake", price: 4.99, image: "https://images.unsplash.com/photo-1577805947697-89e18249d767", description: "Creamy vanilla milkshake" },
                { name: "Lemonade", price: 3.99, image: "https://images.unsplash.com/photo-1621263764928-df1444c5e859", description: "Fresh squeezed lemonade" }
            ],
            desserts: [
                { name: "Ice Cream", price: 4.99, image: "https://images.unsplash.com/photo-1563805042-7684c019e1cb", description: "Vanilla ice cream with toppings" },
                { name: "Chocolate Cake", price: 6.99, image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587", description: "Rich chocolate cake" },
                { name: "Apple Pie", price: 5.99, image: "https://images.unsplash.com/photo-1621743478914-cc8a86d7e9f4", description: "Homemade apple pie" }
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
                foodItems.innerHTML += `
                    <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow">
                        <img src="${item.image}" alt="${item.name}" class="w-full h-48 object-cover">
                        <div class="p-4">
                            <h3 class="text-lg font-semibold">${item.name}</h3>
                            <p class="text-gray-600 text-sm mt-1">${item.description}</p>
                            <div class="mt-4 flex items-center justify-between">
                                <span class="text-orange-500 font-bold">$${item.price}</span>
                                <button onclick="addToCart('${item.name}', ${item.price}, '${item.image}')" class="bg-orange-500 text-white px-4 py-2 rounded-full hover:bg-orange-600">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                `;
            });
        }

        showCategory('burgers');

        function addToCart(name, price, image) {
            const existingItem = cart.find(item => item.name === name);
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                cart.push({ name, price, image, quantity: 1 });
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
                cartItems.innerHTML += `
                    <div class="flex items-center justify-between">
                        <div class="flex items-center space-x-3">
                            <img src="${item.image}" class="w-16 h-16 object-cover rounded">
                            <div>
                                <h4 class="text-sm font-medium">${item.name}</h4>
                                <p class="text-sm text-gray-500">$${item.price}</p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-2">
                            <button onclick="removeFromCart('${item.name}', ${item.price})" class="text-gray-500 hover:text-gray-600">-</button>
                            <span class="text-gray-600">${item.quantity}</span>
                            <button onclick="addToCart('${item.name}', ${item.price}, '${item.image}')" class="text-gray-500 hover:text-gray-600">+</button>
                        </div>
                    </div>
                `;
            });

            cartCount.textContent = totalQuantity;
            cartTotal.textContent = `$${total.toFixed(2)}`;
            if(paymentTotal) {
                paymentTotal.textContent = `$${total.toFixed(2)}`;
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
            document.getElementById('paymentTotal').textContent = `$${total.toFixed(2)}`;
        }

        function processPayment(event) {
            event.preventDefault();
            alert('Payment processed successfully!');
            cart = [];
            total = 0;
            updateCart();
            document.getElementById('paymentModal').classList.add('hidden');
            showNotification('Payment completed successfully!');
        }
    </script>
</body>
</html>