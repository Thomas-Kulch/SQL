CREATE VIEW v_Supplier_Product AS
SELECT Supplier.CompanyName 'Supplier',
        Supplier.ContactName 'Contact', Supplier.Phone 'Phone',
        Product.ProductName 'Product', Product.ProductId
FROM Supplier
JOIN Product
ON Supplier.SupplierId = Product.SupplierID
 
SELECT * FROM v_Supplier_Product