<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
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
            background-color: #e74c3c;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
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
    <h2>Delete Product</h2>
    <form method="post">
        <input type="text" name="id" placeholder="Enter Product ID to Delete" required />
        <input type="submit" value="Delete Product" />
    </form>

    <%
        String id = request.getParameter("id");
        if(id != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "password@123");
                PreparedStatement ps = con.prepareStatement("DELETE FROM Products WHERE ProductID=?");
                ps.setInt(1, Integer.parseInt(id));
                int i = ps.executeUpdate();

                if(i > 0) {
    %>
                    <div class="message success">Product with ID <%= id %> deleted successfully.</div>
    <%
                } else {
    %>
                    <div class="message error">No product found with ID: <%= id %></div>
    <%
                }
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
