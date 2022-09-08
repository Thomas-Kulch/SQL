

/** AND Operator **/

SELECT *
FROM customer AS c
JOIN CustomerOrder AS o
ON c.CustId = o.CustomerId
WHERE c.LastName = 'Brown'
AND o.TotalAmount > 500


/** OR **/

SELECT *
FROM customer AS c
JOIN CustomerOrder AS o
ON c.CustId = o.CustomerId
WHERE c.LastName = 'Brown'
OR o.TotalAmount > 500


/** NOT **/

SELECT *
FROM customer AS c
JOIN CustomerOrder AS o
ON c.CustId = o.CustomerId
WHERE NOT c.LastName = 'Brown'
AND NOT o.TotalAmount > 500



/** IN **/

SELECT *
FROM customer AS c
JOIN CustomerOrder AS o
ON c.CustId = o.CustomerId
WHERE c.LastName IN ('Brown','Wilson','Bennett')
AND o.TotalAmount > 500

/** BETWEEN **/

SELECT *
FROM customer AS c
JOIN CustomerOrder AS o
ON c.CustId = o.CustomerId
WHERE o.TotalAmount BETWEEN 100 AND 500

/** LIKE **/

SELECT *
FROM customer AS c
JOIN CustomerOrder AS o
ON c.CustId = o.CustomerId
WHERE c.LastName LIKE 'Berg%'
AND  o.TotalAmount > 500

/** SELECT DISTINCT **/

SELECT DISTINCT c.Country
FROM customer AS c
JOIN CustomerOrder AS o
ON c.CustId = o.CustomerId
WHERE o.TotalAmount > 5000

/** IS NOT NULL **/

SELECT *
FROM Supplier AS S
WHERE S.Fax IS NOT NULL