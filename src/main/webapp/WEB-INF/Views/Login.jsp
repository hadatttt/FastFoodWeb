<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FastBite - Login/Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-cover bg-center min-h-screen" style="background-image: url('https://images.unsplash.com/photo-1561758033-d89a9ad46330?ixlib=rb-4.0.3')">

    <!-- Logo FastFood -->
    <div class="absolute top-4 left-4">
        <h1 class="text-2xl font-bold text-white">FastFood DHC</h1>
    </div>

    <!-- Login Form -->
    <div id="loginForm" class="container max-w-md mx-auto p-6 mt-20" >
        <div class="bg-white bg-opacity-95 rounded-lg shadow-lg p-8">
            <div class="text-center mb-8">
                <h2 class="text-3xl font-bold text-gray-800">Login</h2>
            </div>
            
            <form class="space-y-6" action="/FastFoodCRUD/login" method="POST">
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Username</label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute text-gray-500 top-3 left-3"></i>
                        <input type="text" id="username" name="username" class="w-full pl-10 pr-3 py-2 rounded-lg border border-gray-300 focus:outline-none focus:border-orange-500" placeholder="Enter your Username" required>
                    </div>
                </div>
                
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="password">Password</label>
                    <div class="relative">
                        <i class="fas fa-lock absolute text-gray-500 top-3 left-3"></i>
                        <input type="password" id="password" name="password" class="w-full pl-10 pr-10 py-2 rounded-lg border border-gray-300 focus:outline-none focus:border-orange-500" placeholder="Enter your password" required>
                        <button type="button" class="absolute top-3 right-3 text-gray-500" onclick="togglePassword('password')"><i class="fas fa-eye"></i></button>
                    </div>
                </div>
                
                <div class="flex items-center justify-between">
                    <a href="#" class="text-sm text-orange-500 hover:text-orange-600">Forgot Password?</a>
                </div>
                
                <input type="submit" class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600 transition duration-300" value="Login">
                
                <p class="text-center text-sm text-gray-600">Don't have an account? 
                    <a href="#" onclick="toggleForms()" class="text-orange-500 hover:text-orange-600">Register here</a>
                </p>
            </form>
        </div>
    </div>
    
    <!-- Registration Form -->
    <div id="registerForm" class="container max-w-md mx-auto p-6 mt-20 hidden">
        <div class="bg-white bg-opacity-95 rounded-lg shadow-lg p-8">
            <div class="text-center mb-8">
                <h2 class="text-3xl font-bold text-gray-800">Register</h2>
            </div>
            
            <form class="space-y-6">
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Username</label>
                    <div class="relative">
                        <i class="fas fa-user absolute text-gray-500 top-3 left-3"></i>
                        <input type="text" id="username" class="w-full pl-10 pr-3 py-2 rounded-lg border border-gray-300 focus:outline-none focus:border-orange-500" placeholder="Choose a username" required>
                    </div>
                </div>
                
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="reg-email">Email</label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute text-gray-500 top-3 left-3"></i>
                        <input type="email" id="reg-email" class="w-full pl-10 pr-3 py-2 rounded-lg border border-gray-300 focus:outline-none focus:border-orange-500" placeholder="Enter your email" required>
                    </div>
                </div>
                
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="reg-password">Password</label>
                    <div class="relative">
                        <i class="fas fa-lock absolute text-gray-500 top-3 left-3"></i>
                        <input type="password" id="reg-password" class="w-full pl-10 pr-10 py-2 rounded-lg border border-gray-300 focus:outline-none focus:border-orange-500" placeholder="Choose a password" required>
                        <button type="button" class="absolute top-3 right-3 text-gray-500" onclick="togglePassword('reg-password')"><i class="fas fa-eye"></i></button>
                    </div>
                </div>
                
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="confirm-password">Confirm Password</label>
                    <div class="relative">
                        <i class="fas fa-lock absolute text-gray-500 top-3 left-3"></i>
                        <input type="password" id="confirm-password" class="w-full pl-10 pr-10 py-2 rounded-lg border border-gray-300 focus:outline-none focus:border-orange-500" placeholder="Confirm your password" required>
                        <button type="button" class="absolute top-3 right-3 text-gray-500" onclick="togglePassword('confirm-password')"><i class="fas fa-eye"></i></button>
                    </div>
                </div>
                
                <button type="submit" class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600 transition duration-300">Register</button>
                
                <p class="text-center text-sm text-gray-600">Already have an account? 
                    <a href="#" onclick="toggleForms()" class="text-orange-500 hover:text-orange-600">Login here</a>
                </p>
            </form>
        </div>
    </div>

    <script>
        function toggleForms() {
            document.getElementById('loginForm').classList.toggle('hidden');
            document.getElementById('registerForm').classList.toggle('hidden');
        }

        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            input.type = input.type === 'password' ? 'text' : 'password';
        }
    </script>
</body>
</html>