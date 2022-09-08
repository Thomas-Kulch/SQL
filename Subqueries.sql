SELECT *
FROM Product p
WHERE p.UnitPrice >=
	(SELECT AVG(d.UnitPrice) FROM Product d)


	/** Result-Set With a List of Values**/

SELECT p.ProductName,  p.UnitPrice
FROM Product p
WHERE p.SupplierId NOT IN
	(SELECT s.SupplierId
		FROM  Supplier s
		WHERE s.Country IN('USA','Canada'))

/** WHERE Subquery **/
SELECT *
FROM Product p
WHERE p.UnitPrice >=  	
	(SELECT AVG(pd.UnitPrice) FROM Product pd)


	/** Adding a join **/
SELECT c.FirstName, c.LastName, o.InvoiceNumber, i.ProductId, i.Quantity
FROM Customer c JOIN CustomerOrder o
	ON c.CustId = o.CustomerId 
JOIN OrderItem i 	 
	ON o.OrderId = i.OrderId 
WHERE i.Quantity > (SELECT AVG(oi.Quantity) FROM OrderItem oi)


/** IN clause **/
SELECT c.FirstName,  c.LastName, o.InvoiceNumber,  i.ProductId, i.Quantity,  p.ProductName
FROM Customer c
JOIN CustomerOrder o
	ON c.CustId = o.CustomerId
JOIN OrderItem i
	ON o.OrderId = i.OrderId
JOIN Product p
	ON i.ProductId = p.ProductId
WHERE p.ProductId IN (SELECT pr.ProductId 
			FROM  Product pr 
			WHERE pr.ProductName  LIKE '%sauce%')


/** HAVING - the HAVING clause is used when you group the retrieved rows based on a conditional expression.**/

SELECT p.ProductId, SUM(o.Quantity) AS Total_Units,  	 
	AVG(o.Quantity) AS AVERAGE_ORDER
FROM Product p
JOIN OrderItem o 	 
	ON p.ProductId = o.ProductId
GROUP BY p.ProductId
HAVING AVG(o.Quantity) >  	 
	(SELECT AVG(oi.Quantity) FROM OrderItem oi)


	/** FROM **/

SELECT c.CustId  Purchased_Item#_5, c.LastName
FROM Customer c JOIN 
		(SELECT co.CustomerId
		FROM CustomerOrder co
		JOIN  OrderItem oi 
		ON co.OrderId = oi.OrderId
		WHERE oi.ProductId = 5)  CP1
	ON c.CustId = CP1.CustomerId





SELECT c.CustId  Purchased_Item#_5, 
	c.LastName  Purchased_Item#_10
FROM Customer c JOIN 
		(SELECT co.CustomerId
		FROM CustomerOrder co
		JOIN  OrderItem oi 
		ON co.OrderId = oi.OrderId
		WHERE oi.ProductId = 5) CP1
	ON c.CustId = CP1.CustomerId
	JOIN
		(SELECT co.CustomerId
		FROM CustomerOrder co
		JOIN OrderItem oi 
		ON co.OrderId = oi.OrderId
		WHERE oi.ProductId = 10) CP2
	ON CP1.CustomerId =  CP2.CustomerId



	/** Attribute list **/

SELECT p.ProductId,  p.UnitPrice, 
		(SELECT AVG(pr.UnitPrice) FROM Product pr)
			AS  Average_Price,
		p.UnitPrice  - (SELECT AVG(pr.UnitPrice) FROM Product pr)
			AS Dif_Price
FROM Product p

/** Practice **/

SELECT s.CompanyName '1 item ordered', s.ContactName

FROM Supplier s JOIN

     (SELECT p.SupplierId
     
     FROM Product p
     
     JOIN OrderItem o
     
     ON p.ProductId = o.ProductId
     
     WHERE o.Quantity = 1) po

ON s.SupplierId = po.SupplierId