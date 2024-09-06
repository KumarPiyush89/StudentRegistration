<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #fff3e0);
            font-family: Arial, sans-serif;
            transition: background-color 0.5s ease-in-out;
        }
        .jumbotron {
            background: #007bff;
            color: white;
            border-radius: 0.5rem;
            padding: 2rem 1rem;
            margin: 2rem auto;
            text-align: center;
            transition: transform 0.3s ease-in-out;
            animation: slideIn 1s ease-in-out;
        }
        .jumbotron:hover {
            transform: scale(1.03);
        }
        .form-control {
            transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .alert-danger {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <!-- Jumbotron -->
        <div class="jumbotron">
            <h1 class="display-4">Welcome Back!</h1>
            <p class="lead">Please login to access your account.</p>
        </div>

        <!-- Login Form -->
        <div class="container text-center">
            <form action="${pageContext.request.contextPath}/process_login" method="post" style="max-width:600px; margin: 0 auto;">
                <div class="mb-3">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="email" name="email" id="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" required minlength="6">
                </div>
                <button type="submit" class="btn btn-primary btn-lg">Login</button>
            </form>

            <!-- Error Alert -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mt-3">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
