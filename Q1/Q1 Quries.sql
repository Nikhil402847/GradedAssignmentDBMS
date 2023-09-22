use E_Commerce; 
SELECT CUS_GENDER, COUNT(*) AS TotalCustomers FROM customer JOIN orders ON customer.CUS_ID = orders.CUS_ID WHERE ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;

SELECT o.ORD_ID, o.ORD_AMOUNT, o.ORD_DATE, p.PRO_NAME FROM orders  o
JOIN product p ON o.PRICING_ID = p.PRO_ID
WHERE o.CUS_ID = 2;

SELECT s.*
FROM supplier s
JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
GROUP BY s.SUPP_ID
HAVING COUNT(sp.PRO_ID) > 1;


CREATE VIEW lowest_expensive_product AS
SELECT
    c.CAT_ID,
    c.CAT_NAME,
    p.PRO_NAME,
    MIN(sp.SUPP_PRICE) AS LowestPrice
FROM category c
JOIN product p ON c.CAT_ID = p.CAT_ID
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
GROUP BY c.CAT_ID, c.CAT_NAME, p.PRO_NAME;
select * from lowest_expensive_product;

SELECT o.ORD_ID, p.PRO_NAME
FROM orders o
JOIN product p ON o.PRICING_ID = p.PRO_ID
WHERE o.ORD_DATE > '2021-10-05';


SELECT CUS_NAME, CUS_GENDER FROM customer WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';


DELIMITER //

CREATE PROCEDURE GetSupplierRatings()
BEGIN
    SELECT
        s.SUPP_ID,
        s.SUPP_NAME,
        AVG(r.RAT_RATSTARS) AS AverageRating,
        CASE
            WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
            WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM
        supplier s
    LEFT JOIN
        supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    LEFT JOIN
        orders o ON sp.PRICING_ID = o.PRICING_ID
    LEFT JOIN
        rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY
        s.SUPP_ID, s.SUPP_NAME;
END //

DELIMITER ;
call GetSupplierRatings();