/****** Left Join  ******/
SELECT *
FROM Customer
LEFT JOIN CustomerOrder
ON Customer.CustId = CustomerOrder.CustomerId

/* Customers who have never ordered */
SELECT *
FROM Customer
LEFT JOIN CustomerOrder
ON Customer.CustId = CustomerOrder.CustomerId
WHERE CustomerOrder.CustomerId IS NULL

/****** Right Join ******/

SELECT *
FROM Customer
RIGHT JOIN CustomerOrder
ON Customer.CustId = CustomerOrder.CustomerId

/****** Inner Join ******/

SELECT *
FROM Customer
INNER JOIN CustomerOrder
on Customer.CustId = CustomerOrder.CustomerId