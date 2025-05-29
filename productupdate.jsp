<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Update Product</title>
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
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
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
    <h2>Update Product</h2>
    <form method="post">
        <input type="text" name="id" placeholder="Product ID" required />
        <input type="text" name="name" placeholder="New Name (leave blank if no change)" />
        <input type="text" name="category" placeholder="New Category (leave blank if no change)" />
        <input type="text" name="price" placeholder="New Price (leave blank if no change)" />
        <input type="text" name="qty" placeholder="New Quantity (leave blank if no change)" />
        <input type="submit" value="Update" />
    </form>

    <%
        String id = request.getParameter("id");
        if (id != null && !id.trim().isEmpty()) {
            try {
                String name = request.getParameter("name");
                String cat = request.getParameter("category");
                String price = request.getParameter("price");
                String qty = request.getParameter("qty");

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "password@123");

                // Build update query dynamically
                StringBuilder sql = new StringBuilder("UPDATE Products SET ");
                boolean first = true;

                if (name != null && !name.trim().isEmpty()) {
                    sql.append("ProductName = ?");
                    first = false;
                }
                if (cat != null && !cat.trim().isEmpty()) {
                    if (!first) sql.append(", ");
                    sql.append("Category = ?");
                    first = false;
                }
                if (price != null && !price.trim().isEmpty()) {
                    if (!first) sql.append(", ");
                    sql.append("Price = ?");
                    first = false;
                }
                if (qty != null && !qty.trim().isEmpty()) {
                    if (!first) sql.append(", ");
                    sql.append("Quantity = ?");
                    first = false;
                }

                // If no fields to update, show message and skip DB update
                if (first) {
    %>
                    <div class="message error">Please provide at least one field to update.</div>
    <%
                } else {
                    sql.append(" WHERE ProductID = ?");

                    PreparedStatement ps = con.prepareStatement(sql.toString());

                    // Set parameters dynamically
                    int paramIndex = 1;
                    if (name != null && !name.trim().isEmpty()) {
                        ps.setString(paramIndex++, name);
                    }
                    if (cat != null && !cat.trim().isEmpty()) {
                        ps.setString(paramIndex++, cat);
                    }
                    if (price != null && !price.trim().isEmpty()) {
                        ps.setDouble(paramIndex++, Double.parseDouble(price));
                    }
                    if (qty != null && !qty.trim().isEmpty()) {
                        ps.setInt(paramIndex++, Integer.parseInt(qty));
                    }
                    ps.setInt(paramIndex, Integer.parseInt(id));

                    int updated = ps.executeUpdate();

                    if (updated > 0) {
    %>
                        <div class="message success">Product updated successfully.</div>
    <%
                    } else {
    %>
                        <div class="message error">No product found with ID: <%= id %></div>
    <%
                    }
                    ps.close();
                }

                con.close();

            } catch (Exception e) {
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
