-- INNER JOIN --
SELECT p.Name, s.Date AS "Sale Date"
FROM products AS p
INNER JOIN sales AS s
ON p.ProductID = s.ProductID;

-- LEFT JOIN --
SELECT e.FirstName AS "First Name", e.LastName AS "Last Name", s.Date AS "Sale Date", s.Quantity AS "Quantity Sold"
FROM sales AS s
LEFT JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
ORDER BY e.FirstName;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name AS "Product Name", C.Name AS "Category Name" 
 FROM products as P
 INNER JOIN categories AS C 
 ON P.CategoryID = C.CategoryID
 WHERE C.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 Select P.Name AS "Product Name", P.Price, R.Rating
 FROM products AS P
 INNER JOIN reviews AS R ON P.ProductID = R.ProductID 
 Where R.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FirstName, E.LastName, Sum(S.Quantity) AS Total 
FROM sales AS S
INNER JOIN employees AS E ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID ORDER BY Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name AS "Category Name", d.Name AS "Department Name" 
From departments AS d
INNER JOIN categories AS c ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name AS "Product Name", SUM(s.Quantity) AS "CD's Sold", SUM(s.Quantity*s.PricePerUnit) AS "$$$ Sold"
FROM sales AS s
INNER JOIN products AS p ON s.ProductID = p.ProductID 
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS "Product Name", r.Reviewer, MIN(r.Rating), r.Comment
FROM reviews AS r
INNER JOIN products AS p ON p.ProductID = r.ProductID
WHERE p.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, CONCAT(e.FirstName, e.LastName) AS "Employee Name", p.Name AS "Product Name", s.Quantity
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON s.ProductID = p.ProductID
ORDER BY e.EmployeeID; 
