<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Generate Reports</title>
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

        form p {
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        input[type="text"] {
            flex: 1;
            padding: 12px 15px;
            margin-left: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
        form p {
    font-size: 16px;
    color: #2c3e50;
    margin-bottom: 8px;
    font-weight: 600;          /* Slightly bolder text */
    letter-spacing: 0.03em;    /* subtle letter spacing */
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
    <h2>Generate Reports</h2>
    <form action="report_result.jsp" method="get">
        <p>
            1. Products with Price Greater Than:
            <input type="text" name="price"  />
        </p>
        <input type="submit" name="action" value="Price Report" />

        <p>
            2. Products in Category:
            <input type="text" name="category" />
        </p>
        <input type="submit" name="action" value="Category Report" />
        
    </form>

    <a class="button" href="index.jsp">← Back to Dashboard</a>
</div>
</body>
</html>
