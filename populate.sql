INSERT INTO Store (name)VALUES (
     'ACME'
);


INSERT INTO Distributor (genres,store_id, name)

WITH names AS(
SELECT 'Horror', 1, 'Universal' FROM dual UNION ALL
SELECT 'Comedy', 1, '20th Century Fox' FROM dual UNION ALL
SELECT 'Drama', 1, 'A24' FROM dual UNION ALL
SELECT 'Action', 1, 'Marvel' FROM dual UNION ALL
SELECT 'Mystery', 1, 'Netflix' FROM dual
)SELECT * FROM names;


INSERT INTO Inventory (inventory_year,store_id,stock)
VALUES
(2023, 1, 0);

INSERT INTO Customer (store_id, first_name, last_name, address, email, phone_number)
WITH names AS(
SELECT 1, 'Ava', 'Sinclaire', '3421 Boulder Drive, 20941', '1234@gmail.com', 1023412456 FROM dual UNION ALL
SELECT 1, 'Josh', 'Sinclaire', '3441 Cedar Drive, 12312', '1234@gmail.com', 4023412456 FROM dual UNION ALL
SELECT 1, 'Brooke', 'Sinclaire', '3121 River Drive, 34920', '1234@gmail.com', 7023412456 FROM dual UNION ALL
SELECT 1, 'Clarice', 'Sinclaire', '8421 Limestone Drive, 91803', '1234@gmail.com', 6023412456 FROM dual UNION ALL
SELECT 1, 'Hugo', 'Sinclaire', '3461 Marlboro Drive ,01957', '1234@gmail.com', 2023432456 FROM dual 
)SELECT * FROM names;


INSERT INTO Catalogue (distributor_id, inventory_id)
WITH names AS(
    SELECT 1.cat, 1 FROM dual UNION ALL
    SELECT 2.cat, 1 FROM dual UNION ALL
    SELECT 3.cat, 1 FROM dual UNION ALL
    SELECT 4.cat, 1 FROM dual UNION ALL
    SELECT 5.cat, 1 FROM dual)SELECT * FROM names;


INSERT INTO Movie (distributor_id, inventory_id,genre, year_released,rating,awards, price,name,serial, "type")
WITH names AS(
    SELECT 1.Movie,1,'Horror',1994, 4,2,23.22, 'Batman',  '127836187', 'DVD' FROM dual UNION ALL
    SELECT 2.Movie,1,'Comedy',1995, 3,0,12.34, 'Batman 2','857929274', 'VHS' FROM dual UNION ALL
    SELECT 3.Movie,1,'Comedy',1996, 5,4,43.34, 'Batman 3','981639491', 'DVD' FROM dual UNION ALL
    SELECT 4.Movie,1,'Comedy',1997, 2,0,35.40, 'Batman 4','392659283', 'VHS' FROM dual UNION ALL
    SELECT 5.Movie,1,'Comedy',1998, 1,0,22.34, 'Batman 5','739275090', 'DVD' FROM dual
    )SELECT * FROM names;

INSERT INTO Actor (movie_id, first_name,last_name,awards)
WITH names AS(
    SELECT 1.Act, 'Christian', 'Bale', 1 FROM dual UNION ALL
    SELECT 2.Act, 'Joe', 'Schmo', 0 FROM dual UNION ALL
    SELECT 3.Act, 'John', 'Appleseed', 4 FROM dual UNION ALL
    SELECT 4.Act, 'Joel', 'Miller', 1 FROM dual UNION ALL
    SELECT 5.Act, 'Tess', 'Comstock', 9 FROM dual
    )SELECT * FROM names;

INSERT INTO Director (movie_id, first_name,last_name,awards)
WITH names AS(
    SELECT 1.Director, 'Steven', 'Yuen', 1 FROM dual UNION ALL
    SELECT 2.Director, 'Joe', 'Schmo', 0 FROM dual UNION ALL
    SELECT 3.Director, 'JJ', 'Blake', 4 FROM dual UNION ALL
    SELECT 4.Director, 'Clarice', 'Clausen', 1 FROM dual UNION ALL
    SELECT 5.Director, 'Sierra', 'Buskirk', 9 FROM dual
    )SELECT * FROM names;

INSERT INTO Rental (customer_id, movie_id, rental_date, due_date, price)
WITH names AS(
    SELECT 1.Rental_cust,1.Rental_movie, TO_DATE('2023/04/20', 'yyyy/mm/dd'), TO_DATE('2023/04/30', 'yyyy/mm/dd'), 4.99 FROM dual UNION ALL
    SELECT 2.Rental_cust,2.Rental_movie, TO_DATE('2023/05/3', 'yyyy/mm/dd'), TO_DATE('2023/05/13', 'yyyy/mm/dd'), 4.99 FROM dual UNION ALL
    SELECT 3.Rental_cust,3.Rental_movie, TO_DATE('2023/06/20', 'yyyy/mm/dd'), TO_DATE('2023/06/30', 'yyyy/mm/dd'), 4.99 FROM dual UNION ALL
    SELECT 4.Rental_cust,4.Rental_movie, TO_DATE('2023/07/20', 'yyyy/mm/dd'), TO_DATE('2023/07/30', 'yyyy/mm/dd'), 4.99 FROM dual UNION ALL
    SELECT 5.Rental_cust,5.Rental_movie, TO_DATE('2023/08/20', 'yyyy/mm/dd'), TO_DATE('2023/08/30', 'yyyy/mm/dd'), 4.99 FROM dual
)SELECT * FROM names;

INSERT INTO Charges (customer_id, late_fee, damage_fee,no_rewind_fee,standard_fee,taxes)
WITH names AS(
    SELECT 1, 2.99, 10.99, .99, 4.99, 0.06 FROM dual UNION ALL
    SELECT 2, 0, 0, .99, 4.99, 0.06 FROM dual UNION ALL
    SELECT 3, 0, 0, 0, 4.99, 0.06 FROM dual UNION ALL
    SELECT 4, 8.99, 0, 0, 4.99, 0.06 FROM dual UNION ALL
    SELECT 5, 0, 0, 0, 4.99, 0.06 FROM dual
)SELECT * FROM names;