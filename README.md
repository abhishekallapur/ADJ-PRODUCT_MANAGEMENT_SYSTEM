# ADJ-PRODUCT_MANAGEMENT_SYSTEM
Project Purpose:
To manage product inventory, including adding new products, updating details, deleting obsolete
products, and viewing product lists. Reports include products with price above a certain amount,
products in a specific category, and top-selling products.

FILE_FORMAT

```
ProductWebApp/
├── WebContent/
│ ├── index.jsp
│ ├── productadd.jsp
│ ├── productupdate.jsp
│ ├── productdelete.jsp
│ ├── productdisplay.jsp
│ ├── reports.jsp
│ ├── report_form.jsp
│ └── report_result.jsp
```


HOME PAGE
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/homepage.png)
ADD PAGE:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/add.png)

UPDATE PAGE:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/update.png)

DISPLAY PAGE:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/Allproduct.png)

DELETE PAGE:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/delete.png)

RESULT_FORM PAGE:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/generatereport.png)

PRICE_FILTER_DISPLAY:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/pricefilter.png)

CATEGORY_FILTER_DISPLAY:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/category.png)


MYSQL:
![image alt](https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/mysql.jpg)




```
MySQL DATABASE :

CREATE DATABASE productdb;
use productdb;
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2),
Quantity INT
);
```

```



