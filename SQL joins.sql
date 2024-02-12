-- select all the computers from the products table:
-- using the products table and the categories table, return the product name and the category name
select P.Name AS ProductName, C.Name As CategoryName
from products As P
INNER JOIN categories AS C
On C.CategoryID = P.CategoryID
Where C.Name = "Computers";

-- find all product names, product prices, and products ratings that have a rating of 5 
select p.Name, p.Price, r.Rating 
from products as p
INNER join reviews as r on r.ProductID = p.ProductID
where r.Rating = 5;

-- find the employee with the most total quantity sold.  use the sum() function and group by 
 select e.FirstName, e.LastName, Sum(s.Quantity) AS Total
 from sales AS s
 INNER JOIN employees AS e On e.EmployeeID = s.EmployeeID
 Group by e.EmployeeID
 Order by Total DESC
 LIMIT 5;
 
 
 -- find the name of the department, and the name of the category for Appliances and Games
 select d.Name as "Department Name", c.Name as "Category Name" from departments as d
 INNER JOIN categories as c On c.DepartmentID = d.DepartmentID
 Where c.Name = "Appliances" Or c.Name = "Games";
 
 -- find the product name, total # sold, and total price sold,
 -- for Eagles: Hotel California --You may need to use SUM()
 select p.Name, Sum(s.Quantity) as "Total Sold" , Sum(s.Quantity * s.PricePerUnit) as "Total Price"
 from products as p 
 INNER JOIN sales as s on s.ProductID = p.ProductID
 where p.ProductID = 97;
 
 select * from sales where ProductID = 97; 
 
-- find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
 select p.Name, r.Reviewer, r.Rating, r.Comment from products as p
INNER join reviews as r On r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1; 


-- Extra - May be difficult
/*Your goal is to write a query that serves as an employee sales report.
 This query should return:
 the employeeID
 the employee's first and last name
 the name of each product
 and how many of that product they sold */
 
 select e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) as TotalSold
 from sales as s
 INNER join employees as e on e.EmployeeID = s.EmployeeID
 INNER join products as p on p.ProductID = s.ProductID
 Group by e.EmployeeID, p.ProductID;
 