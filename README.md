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


HOME PAGE:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/Allproduct.png

ADD PAGE:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/add.png

UPDATE PAGE:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/delete.png

DISPLAY PAGE:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/Allproduct.png

DELETE PAGE:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/delete.png

RESULT_FORM PAGE:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/generatereport.png

PRICE_FILTER_DISPLAY:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/pricefilter.png

CATEGORY_FILTER_DISPLAY:https://github.com/abhishekallapur/ADJ-PRODUCT_MANAGEMENT_SYSTEM/blob/main/OUTPUT/category.png




MySQL DATABASE :
```
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



