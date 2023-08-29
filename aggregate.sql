SELECT first_name, last_name, customer_id, address
FROM Customer
ORDER BY customer_id;

SELECT * 
FROM Rental
WHERE rental_date < CURRENT_DATE + 30
ORDER BY rental_date;

SELECT name, genres, distributor_id, store_id 
FROM Distributor
ORDER BY name;

UPDATE Customer
SET last_name = 'Sweeny'
WHERE customer_id = 2;


DELETE FROM Customer
WHERE customer_id = 3;