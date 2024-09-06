<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome to PiyushCode</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .jumbotron {
            background-color: #007bff;
            color: white;
            padding: 2rem 1rem;
            border-radius: 0.5rem;
        }
        .card {
            margin: 1rem;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 1rem 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">PiyushCode</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/list_users" id="listUsersLink">List All Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/register" id="registerLink">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login" id="loginLink">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="jumbotron text-center">
        <h1 class="display-4">Welcome to PiyushCode!</h1>
        <p class="lead">Manage your registrations and user data efficiently.</p>
        <hr class="my-4">
        <p>Get started by exploring the options below.</p>
        <a class="btn btn-custom btn-lg" href="/register" role="button">Register Now</a>
    </div>

    <div class="row text-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">List Users</h5>
                    <p class="card-text">View all registered users in the system.</p>
                    <a href="/list_users" class="btn btn-primary">View Users</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Register</h5>
                    <p class="card-text">Create a new account in just a few steps.</p>
                    <a href="/register" class="btn btn-success">Register</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Login</h5>
                    <p class="card-text">Access your account and manage users.</p>
                    <a href="/login" class="btn btn-warning">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <span>&copy; 2024 PiyushCode. All rights reserved.</span>
    </div>
</footer>

<script>
    // Highlight active link
    const path = window.location.pathname;
    if (path.includes('/list_users')) {
        document.getElementById('listUsersLink').classList.add('active');
    } else if (path.includes('/register')) {
        document.getElementById('registerLink').classList.add('active');
    } else if (path.includes('/login')) {
        document.getElementById('loginLink').classList.add('active');
    }
</script>

</body>
</html>
