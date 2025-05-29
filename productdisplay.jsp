<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Display Products</title>
    <style>
        body {
             margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            
            padding: 40px;
            margin: 0;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            max-width: 1000px;
            margin: auto;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            overflow-x: auto;
            background-color: #ffffff;
            border-radius: 10px;
        }

        th, td {
            padding: 14px 20px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
            font-size: 16px;
        }

        th {
            background-color: #3498db;
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tr:hover {
            background-color: #f2faff;
            transition: background-color 0.3s ease-in-out;
        }

        .button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
            text-align: center;
        }

        .button:hover {
            background-color: #27ae60;
        }

        .button-container {
            text-align: center;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead {
                display: none;
            }

            tr {
                margin-bottom: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            }

            td {
                padding: 10px 20px;
                text-align: left;
                position: relative;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 20px;
                top: 10px;
                font-weight: bold;
                color: #555;
            }
        }
        
    </style>
</head>
<body>
<div class="container">
    <h2>All Products</h2>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "password@123");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM Products");

                while(rs.next()) {
        %>
        <tr>
            <td data-label="ID"><%= rs.getInt("ProductID") %></td>
            <td data-label="Name"><%= rs.getString("ProductName") %></td>
            <td data-label="Category"><%= rs.getString("Category") %></td>
            <td data-label="Price">₹<%= rs.getDouble("Price") %></td>
            <td data-label="Quantity"><%= rs.getInt("Quantity") %></td>
        </tr>
        <%
                }
                con.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>

    <div class="button-container">
        <a class="button" href="index.jsp">← Back to Home</a>
    </div>
</div>
</body>
</html>
