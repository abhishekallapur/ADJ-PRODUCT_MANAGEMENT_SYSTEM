<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .message {
            margin-top: 20px;
            padding: 12px;
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }

      .back-link {
    display: inline-block;
    text-align: center;
    margin-top: 20px;
    padding: 12px 20px;
    text-decoration: none;
    color: white;
    background-color: #3498db;
    font-weight: bold;
    border-radius: 10px;
    transition: background-color 0.3s, box-shadow 0.3s;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.back-link:hover {
    background-color: #2980b9;
    text-decoration: none;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
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

    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Product</h2>
    <form method="post">
        <input type="text" name="id" placeholder="Product ID" required />
        <input type="text" name="name" placeholder="Product Name" required />
        <input type="text" name="category" placeholder="Category" required />
        <input type="text" name="price" placeholder="Price" required />
        <input type="text" name="qty" placeholder="Quantity" required />
        <input type="submit" value="Add Product" />
    </form>

    <%
        String id = request.getParameter("id");
        if(id != null) {
            String name = request.getParameter("name");
            String cat = request.getParameter("category");
            String price = request.getParameter("price");
            String qty = request.getParameter("qty");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "password@123");
                PreparedStatement ps = con.prepareStatement("INSERT INTO Products VALUES (?, ?, ?, ?, ?)");
                ps.setInt(1, Integer.parseInt(id));
                ps.setString(2, name);
                ps.setString(3, cat);
                ps.setDouble(4, Double.parseDouble(price));
                ps.setInt(5, Integer.parseInt(qty));
                ps.executeUpdate();
    %>
                <div class="message success">Product added successfully.</div>
    <%
                con.close();
            } catch(Exception e) {
    %>
                <div class="message error">Error: <%= e.getMessage() %></div>
    <%
            }
        }
    %>

    <a class="button" href="index.jsp">← Back to Dashboard</a>
</div>
</body>
</html>
