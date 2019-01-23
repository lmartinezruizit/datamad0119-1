SELECT
	t.title_id 'TITLE ID',
	a.au_id 'AUTHOR ID', 
    (t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
FROM authors a
	INNER JOIN titleauthor ta ON a.au_id=ta.au_id
	INNER JOIN titles t ON ta.title_id=t.title_id
    INNER JOIN sales s ON s.title_id=t.title_id;

SELECT
	step_2.tID 'TITLE ID',
	step_2.aID 'AUTHOR ID', 
    SUM(step_2.sales_royalty) sum_sales
FROM (
	SELECT
		t.title_id tID,
		a.au_id aID, 
		(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
		FROM authors a
			INNER JOIN titleauthor ta ON a.au_id=ta.au_id
			INNER JOIN titles t ON ta.title_id=t.title_id
			INNER JOIN sales s ON s.title_id=t.title_id) as step_2
GROUP BY aID,tID;

#####################################################CHALLENGE1

SELECT
	DISTINCT(step_3.aID_2) 'AUTHOR ID', 
    step_3.sum_sales 'PROFIT'
FROM (
	SELECT
		step_2.tID tID_2,
		step_2.aID aID_2, 
		SUM(step_2.sales_royalty) sum_sales
	FROM (
		SELECT
			t.title_id tID,
			a.au_id aID, 
			(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
			FROM authors a
				INNER JOIN titleauthor ta ON a.au_id=ta.au_id
				INNER JOIN titles t ON ta.title_id=t.title_id
				INNER JOIN sales s ON s.title_id=t.title_id) as step_2
	GROUP BY aID_2,tID_2) as step_3
GROUP BY step_3.aID_2,step_3.sum_sales
ORDER BY step_3.sum_sales DESC
LIMIT 3;

#####################################################CHALLENGE2
CREATE TEMPORARY TABLE royalty_calculate
SELECT
	t.title_id tID,
	a.au_id aID, 
	(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
FROM authors a
	INNER JOIN titleauthor ta ON a.au_id=ta.au_id
	INNER JOIN titles t ON ta.title_id=t.title_id
    INNER JOIN sales s ON s.title_id=t.title_id;

CREATE TEMPORARY TABLE sum_royalty
SELECT
	tID,
	aID, 
	SUM(sales_royalty) sum_sales
FROM royalty_calculate
GROUP BY aID,tID;

SELECT
	DISTINCT(aID) 'AUTHOR ID', 
    sum_sales 'PROFIT'
FROM
	sum_royalty
GROUP BY aID,sum_sales
ORDER BY sum_sales DESC
LIMIT 3;

#####################################################CHALLENGE3
