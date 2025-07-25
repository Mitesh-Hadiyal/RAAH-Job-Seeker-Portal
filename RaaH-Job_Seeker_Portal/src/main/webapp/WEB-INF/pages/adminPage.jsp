<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            position: fixed;
            width: 240px;
            background-color: #f8f9fa;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            color: #333;
            display: block;
        }
        .sidebar a:hover {
            background-color: #ddd;
        }
        .content {
            margin-left: 240px;
            padding: 20px;
        }
        .mobile-sidebar-toggle {
            display: none;
        }
        .navbar {

        }

        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                height: auto;
                position: relative;
            }
            .content {
                margin-left: 0;
            }
            .mobile-sidebar-toggle {
                display: block;
                position: absolute;
                top: 20px;
                left: 10px;
                z-index: 1000;
            }
        }
    </style>
</head>
<body>

<div class="mobile-sidebar-toggle">
    <button class="btn btn-primary" onclick="toggleSidebar()">☰ Menu</button>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Job Portal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#" onclick="showContent('home')">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showContent('jobs')">Jobs</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showContent('about')">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showContent('contact')">Contact</a>
            </li>
        </ul>
    </div>
</nav>

<div class="sidebar">
    <a href="#" onclick="showContent('users')">All Users</a>
    <a href="#" onclick="showContent('products')">All Products</a>
    <a href="#" onclick="showContent('orders')">Order Details</a>
</div>

<div class="content">
    <div id="contentArea">
        <h2>Welcome to Job Portal</h2>
        <p>Select an option from the navbar or sidebar to view details.</p>
    </div>
</div>

<script>
    function showContent(contentType) {
        const contentArea = document.getElementById('contentArea');
        switch (contentType) {
            case 'home':
                contentArea.innerHTML = '<h3>Home</h3><p>Welcome to the Job Seeker Portal.</p>';
                break;
            case 'jobs':
                contentArea.innerHTML = '<h3>Jobs</h3><p>Browse available job listings.</p>';
                break;
            case 'about':
                contentArea.innerHTML = '<h3>About Us</h3><p>Learn more about our job portal.</p>';
                break;
            case 'contact':
                contentArea.innerHTML = '<h3>Contact</h3><p>Contact us for more information.</p>';
                break;
            case 'users':
                contentArea.innerHTML = '<h3>All Users</h3><p>Details of all users will be displayed here.</p>';
                break;
            case 'products':
                contentArea.innerHTML = '<h3>All Products</h3><p>Details of all products will be displayed here.</p>';
                break;
            case 'orders':
                contentArea.innerHTML = '<h3>Order Details</h3><p>Details of all orders will be displayed here.</p>';
                break;
            default:
                contentArea.innerHTML = '<h2>Welcome to Job Portal</h2><p>Select an option from the navbar or sidebar to view details.</p>';
        }
    }

    function toggleSidebar() {
        const sidebar = document.querySelector('.sidebar');
        const content = document.querySelector('.content');
        if (sidebar.style.display === 'none') {
            sidebar.style.display = 'block';
            content.style.marginLeft = '240px';
        } else {
            sidebar.style.display = 'none';
            content.style.marginLeft = '0';
        }
    }
</script>

</body>
</html>