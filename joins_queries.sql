
-- Task 4: SQL Intermediate – JOINS (INNER, LEFT)

-- 1. INNER JOIN: Orders with Customer Details
SELECT 
    i.InvoiceId,
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    i.InvoiceDate,
    i.Total
FROM Invoice i
INNER JOIN Customer c 
ON i.CustomerId = c.CustomerId;

-- 2. LEFT JOIN: Customers with NO Orders
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country
FROM Customer c
LEFT JOIN Invoice i 
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- 3. Revenue per Product
SELECT 
    t.Name AS TrackName,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t 
ON il.TrackId = t.TrackId
GROUP BY t.TrackId
ORDER BY Revenue DESC;
