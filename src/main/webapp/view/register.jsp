<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: #333;
            font-family: Arial, sans-serif;
            overflow-x: hidden;
            animation: fadeIn 1s ease-in-out;
        }
        .card {
            margin-top: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-control {
            border-radius: 0;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .jumbotron {
            background-color: #007bff;
            color: white;
            padding: 2rem 1rem;
            border-radius: 0.5rem;
            animation: slideIn 1s ease-out;
        }
        footer {
            margin-top: 20px;
            padding: 10px 0;
            background: #007bff;
            color: white;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes slideIn {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="jumbotron text-center">
            <h1 class="display-4">Welcome to PiyushCode!</h1>
            <p class="lead">Manage your registrations and user data efficiently.</p>
            <hr class="my-4">
            <p>Get started by exploring the options below.</p>
            <!-- <a class="btn btn-custom btn-lg" href="/register" role="button">Register Now</a> -->
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h2>Register</h2>
                    </div>
                    <div class="card-body">
                        <form id="registerForm" action="${pageContext.request.contextPath}/register_sucess" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">E-mail:</label>
                                <input type="email" name="email" id="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" name="password" id="password" class="form-control" required minlength="6" maxlength="100">
                            </div>
                            <div class="mb-3">
                                <label for="first_name" class="form-label">First Name:</label>
                                <input type="text" name="first_name" id="first_name" class="form-control" required minlength="2" maxlength="20">
                            </div>
                            <div class="mb-3">
                                <label for="last_name" class="form-label">Last Name:</label>
                                <input type="text" name="last_name" id="last_name" class="form-control" required minlength="2" maxlength="20">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        &copy; 2024 PiyushCode. All rights reserved.
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById('registerForm');
            form.addEventListener('submit', function(event) {
                event.preventDefault();
                let valid = true;

                // Simple form validation example
                ['email', 'password', 'first_name', 'last_name'].forEach(id => {
                    const input = document.getElementById(id);
                    if (!input.value) {
                        input.classList.add('is-invalid');
                        valid = false;
                    } else {
                        input.classList.remove('is-invalid');
                    }
                });

                // Submit form if valid
                if (valid) {
                    form.submit();
                } else {
                    alert("Please fill out all fields correctly.");
                }
            });

            // Add animations to form inputs
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', () => {
                    input.style.transition = 'all 0.2s';
                    input.style.transform = 'scale(1.05)';
                });
                input.addEventListener('blur', () => {
                    input.style.transform = 'scale(1)';
                });
            });
        });
    </script>
</body>
</html>
