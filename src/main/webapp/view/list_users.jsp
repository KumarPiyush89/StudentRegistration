<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ page import="java.util.List" %>
<%@ page import="edu.qs.StudentRegistration.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List of Users</title>
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
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }
        .jumbotron:hover {
            transform: scale(1.02);
        }
        .table-hover tbody tr:hover {
            animation: rowHighlight 0.3s ease-in-out;
            cursor: pointer;
        }
        @keyframes rowHighlight {
            from {
                background-color: #ffffff;
            }
            to {
                background-color: #c8e6c9;
            }
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-custom:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        .page-title {
            font-weight: bold;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-warning {
            background-color: #ffc107;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-warning:hover {
            background-color: #e0a800;
            transform: translateY(-2px);
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
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
        document.addEventListener("DOMContentLoaded", function() {
            // Highlight table rows on hover
            const rows = document.querySelectorAll('.table-hover tbody tr');
            rows.forEach(row => {
                row.addEventListener('click', () => {
                    alert('You clicked on User ID: ' + row.cells[0].innerText);
                });
            });
        });
    </script>
</head>
<body>
    <div class="container mt-4">
        <!-- Jumbotron -->
        <div class="jumbotron mb-4">
            <h1 class="display-4">User Management</h1>
            <p class="lead">View, update, or delete user information below.</p>
            <hr class="my-4">
            <p>Manage all your users with ease and efficiency.</p>
        </div>

        <!-- Table of Users -->
        <h1 class="page-title">List of Users</h1>
        <table class="table table-hover table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<User> users = (List<User>) request.getAttribute("users");
                    for(User user : users) {
                %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getFirst_name() %></td>
                        <td><%= user.getLast_name() %></td>
                        <td>
                            <!-- Update button -->
                            <a href="<%= request.getContextPath() %>/update_user?id=<%= user.getId() %>" class="btn btn-warning btn-sm">Update</a>
                            <!-- Delete button -->
                            <a href="<%= request.getContextPath() %>/delete_user?id=<%= user.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="text-center">
            <a href="/" class="btn btn-custom btn-lg mt-3">Back to Home</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 PiyushCode. All rights reserved.
    </footer>
</body>
</html>
