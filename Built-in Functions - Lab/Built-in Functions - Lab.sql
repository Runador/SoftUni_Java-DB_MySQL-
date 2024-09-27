SELECT * FROM book_library.books;


SELECT title
FROM books
WHERE  SUBSTRING(title, 1, 3) = '';


SELECT 
REPLACE(title, 'The', '***') AS title
FROM books
WHERE  SUBSTRING(title, 1, 3) = 'The';


SELECT 
	REPLACE(
		REPLACE('The Dead zone', 'The', '***'), -- The Dead zone
		'zone', '****');


SELECT LEFT('The dread', 3); 


SELECT ROUND(SUM(cost), 2)
FROM books;


SELECT LOWER('The');
SELECT UPPER('Runador');


SELECT title
FROM books
WHERE author_id = 4 AND SUBSTRING(title, 1, 1) = 'H';


