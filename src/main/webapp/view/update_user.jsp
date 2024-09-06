<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="edu.qs.StudentRegistration.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #fff3e0);
            color: #333;
            font-family: Arial, sans-serif;
            transition: background-color 0.5s ease-in-out;
        }
        .jumbotron {
            background: #007bff;
            color: white;
            border-radius: 0.5rem;
            padding: 2rem 1rem;
            margin-bottom: 2rem;
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }
        .jumbotron:hover {
            transform: scale(1.02);
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
        .alert-bottom {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1050;
            width: fit-content;
            display: none; /* Hidden by default */
        }
        footer {
            margin-top: 20px;
            padding: 10px 0;
            background: #007bff;
            color: white;
            text-align: center;
            transition: background-color 0.3s;
        }
    </style>
    <script>
        // Function to show success alert at the bottom of the page
        function showSuccessAlert() {
            const alertBox = document.getElementById('successAlert');
            alertBox.style.display = 'block';  // Show alert
            setTimeout(() => {
                alertBox.style.display = 'none';  // Hide after 2 seconds
            }, 2000);
        }

        // Listen for form submission to trigger the alert
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.querySelector('form');
            form.addEventListener('submit', function (event) {
                event.preventDefault(); // Prevent form from submitting immediately
                showSuccessAlert(); // Show the success alert
                setTimeout(() => {
                    form.submit(); // Submit the form after the alert is shown
                }, 1500); // Slight delay to show the alert
            });
        });
    </script>
</head>
<body>
    <div class="container mt-4">
        <!-- Jumbotron -->
        <div class="jumbotron">
            <h1 class="display-4">Update User</h1>
            <p class="lead">Modify user details below to keep the information up-to-date.</p>
        </div>

        <!-- Update Form -->
        <div class="container text-center">
            <form action="${pageContext.request.contextPath}/process_update" method="post" style="max-width:600px; margin: 0 auto; animation: fadeIn 1s ease-in-out;">
                <input type="hidden" name="id" value="${user.id}">
                <div class="mb-3">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="email" name="email" id="email" class="form-control" value="${user.email}" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" value="${user.password}" required minlength="6" maxlength="100">
                </div>
                <div class="mb-3">
                    <label for="first_name" class="form-label">First Name:</label>
                    <input type="text" name="first_name" id="first_name" class="form-control" value="${user.first_name}" required minlength="2" maxlength="20">
                </div>
                <div class="mb-3">
                    <label for="last_name" class="form-label">Last Name:</label>
                    <input type="text" name="last_name" id="last_name" class="form-control" value="${user.last_name}" required minlength="2" maxlength="20">
                </div>
                <!-- Update Button -->
                <button type="submit" class="btn btn-primary">Update User</button>
            </form>
        </div>
    </div>

    <!-- Bottom Alert -->
    <div class="alert alert-success alert-bottom" id="successAlert">
        User updated successfully!
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 PiyushCode. All rights reserved.
    </footer>

    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</body>
</html>
