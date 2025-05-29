<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .dashboard {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 600px;
        }

        h1 {
            margin-bottom: 30px;
            color: #2c3e50;
        }

        .nav-grid {
            display: grid;
            
            gap: 20px;
        }

        .nav-item {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            transition: 0.3s;
            text-decoration: none;
            color: #2c3e50;
            font-weight: bold;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .nav-item:hover {
            background-color: #3498db;
            color: white;
            transform: scale(1.05);
        }

        .nav-item i {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .footer {
            margin-top: 30px;
            color: #555;
        }
    </style>
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <div class="dashboard">
        <h1>Product Management System</h1>
        <div class="nav-grid">
            <a href="productadd.jsp" class="nav-item">
                <i class="fas fa-plus-circle"></i>
                Add Product
            </a>
            <a href="productupdate.jsp" class="nav-item">
                <i class="fas fa-edit"></i>
                Update Product
            </a>
            <a href="productdelete.jsp" class="nav-item">
                <i class="fas fa-trash-alt"></i>
                Delete Product
            </a>
            <a href="productdisplay.jsp" class="nav-item">
                <i class="fas fa-list"></i>
                Display Products
            </a>
            <a href="report_form.jsp" class="nav-item" style="grid-column: span 2;">
                <i class="fas fa-chart-bar"></i>
                Generate Reports
            </a>
        </div>
        <div class="footer">
            <p>&copy; 2025 ProductWebApp</p>
        </div>
    </div>
</body>
</html>
