SELECT s.CompanyName,  
	FORMAT(AVG(p.UnitPrice), 'C') 'Average Unit Price',
	COUNT(p.UnitPrice) 'Total Items'
FROM Product p
JOIN Supplier s
ON p.SupplierId = s.SupplierId 	 
	GROUP BY s.CompanyName



	SELECT c.CustId, 
	COUNT(o.OrderId) '#  of Orders', 
	FORMAT(SUM(o.TotalAmount), 'C') 'Total_Amount', 
	FORMAT(AVG(i.UnitPrice), 'C') 'Average_Price', 
	FORMAT(MIN(i.UnitPrice), 'N') 'Lowest_Priced Item', 
	FORMAT(MAX(i.UnitPrice), 'C') 'Highest_Priced Item', 
	SUM(i.Quantity) 'Total_Items_Purchased'
FROM Customer c
JOIN CustomerOrder o
ON c.CustId = o.CustomerId
JOIN OrderItem i
ON o.OrderId = i.OrderId
	GROUP BY  c.CustId
	ORDER BY Total_Items_Purchased DESC


	/** Grouping on multiple columns**/

	SELECT c.Country, c.city,
	COUNT(o.OrderId) '#  of Orders', 
	FORMAT(SUM(o.TotalAmount), 'C') 'Total  Amount', 
	FORMAT(AVG(i.UnitPrice), 'C') 'Average  Price', 
	FORMAT(MIN(i.UnitPrice), 'N') 'Lowest  Priced Item', 
	FORMAT(MAX(i.UnitPrice), 'C') 'Highest  Priced Item', 
	SUM(i.Quantity) 'Total  Items Purchased'
FROM Customer c
JOIN CustomerOrder o
ON c.CustId = o.CustomerId
JOIN OrderItem i
ON o.OrderId = i.OrderId
	GROUP BY  c.Country, c.city
	ORDER BY c.Country

	/**Grouping With More Than One Column and Comments**/

	SELECT i.OrderId,  i.ProductId, 
/*     COUNT(o.OrderId)  '# of Orders', 
	FORMAT(SUM(o.TotalAmount),  'C') 'Total Amount', */
	FORMAT(AVG(i.UnitPrice), 'C') 'Average  Price', 
	FORMAT(MIN(i.UnitPrice), 'N') 'Lowest  Priced Item', 
	FORMAT(MAX(i.UnitPrice), 'C') 'Highest  Priced Item', 
	SUM(i.Quantity) 'Total  Items Purchased'
FROM Customer c
JOIN CustomerOrder o
ON c.CustId = o.CustomerId
JOIN OrderItem i
ON o.OrderId = i.OrderId
	GROUP BY  i.OrderId, i.ProductId
	ORDER BY i.OrderId