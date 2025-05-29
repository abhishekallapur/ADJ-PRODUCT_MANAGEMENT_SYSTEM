<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Report Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 20px;
            color: #333;
        }
        h2 {
            text-align: center;
            color: #222;
            margin-bottom: 25px;
        }
        p {
            font-size: 1.1em;
            margin-bottom: 15px;
            text-align: center;
            font-weight: 600;
        }
        table {
            border-collapse: collapse;
            margin: 0 auto; /* center the table */
            width: 80%;
            max-width: 900px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 18px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF; /* Bootstrap blue */
            color: white;
            font-weight: 600;
            letter-spacing: 0.05em;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f2f7ff;
        }
        tr:hover {
            background-color: #d1e3ff;
        }
        /* Responsive */
        @media (max-width: 600px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }
            tr {
                margin-bottom: 15px;
            }
            th {
                background-color: transparent;
                color: #007BFF;
                font-size: 1.1em;
                text-align: left;
                padding-left: 20px;
            }
            td {
                text-align: right;
                padding-left: 50%;
                position: relative;
            }
            td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                top: 12px;
                font-weight: 600;
                color: #007BFF;
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>
<h2>Report Results</h2>
<%
    String action = request.getParameter("action");
    String query = "";
    String condition = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "password@123");

        if("Price Report".equals(action)) {
            String price = request.getParameter("price");
            query = "SELECT * FROM Products WHERE Price > " + price;
            condition = "Price > " + price;
        } else if("Category Report".equals(action)) {
            String category = request.getParameter("category");
            query = "SELECT * FROM Products WHERE Category = '" + category + "'";
            condition = "Category = '" + category + "'";
        }

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
%>

<p>Showing products with condition: <b><%= condition %></b></p>
<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Category</th>
    <th>Price</th>
    <th>Quantity</th>
</tr>
<%
        while(rs.next()) {
%>
<tr>
    <td data-label="ID"><%= rs.getInt(1) %></td>
    <td data-label="Name"><%= rs.getString(2) %></td>
    <td data-label="Category"><%= rs.getString(3) %></td>
    <td data-label="Price"><%= rs.getDouble(4) %></td>
    <td data-label="Quantity"><%= rs.getInt(5) %></td>
</tr>
<%
        }
        con.close();
    } catch(Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    }
%>
</table>
</body>
</html>
