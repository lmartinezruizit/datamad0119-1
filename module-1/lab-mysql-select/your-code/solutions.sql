SELECT 
	a.au_id 'AUTHOR ID', 
	a.au_lname 'LAST NAME', 
    a.au_fname 'FIRST NAME', 
    t.title 'TITLE', 
    p.pub_name 'PUBLISHER' 
FROM authors a
	INNER JOIN titleauthor ta ON a.au_id=ta.au_id 
	INNER JOIN titles t ON ta.title_id=t.title_id
	INNER JOIN publishers p ON p.pub_id=t.pub_id
ORDER BY a.au_id;

SELECT 
	a.au_id 'AUTHOR ID', 
    a.au_lname 'LAST NAME', 
    a.au_fname 'FIRST NAME', 
    p.pub_name 'PUBLISHER',
    COUNT(t.title_id) 'TITLE COUNT'
FROM authors a
	INNER JOIN titleauthor ta ON a.au_id=ta.au_id 
	INNER JOIN titles t ON ta.title_id=t.title_id
	INNER JOIN publishers p ON p.pub_id=t.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY a.au_id DESC, p.pub_name DESC;

SELECT 
	a.au_id 'AUTHOR ID', 
	a.au_lname 'LAST NAME', 
    a.au_fname 'FIRST NAME',
	sum(s.qty) 'TOTAL'
FROM authors a
	INNER JOIN titleauthor ta ON a.au_id=ta.au_id 
	INNER JOIN titles t ON ta.title_id=t.title_id
	INNER JOIN sales s ON s.title_id=t.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
LIMIT 3;

SELECT 
	a.au_id 'AUTHOR ID', 
    a.au_lname 'LAST NAME', 
    a.au_fname 'FIRST NAME', 
	IFNULL(sum(s.qty),0) 'TOTAL'
FROM authors a 
	LEFT JOIN titleauthor ta ON a.au_id=ta.au_id 
	LEFT JOIN titles t ON ta.title_id=t.title_id
	LEFT JOIN sales s ON s.title_id=t.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
LIMIT 23;

SELECT 
	a.au_id 'AUTHOR ID', 
	a.au_lname 'LAST NAME', 
    a.au_fname 'FIRST NAME', 
	sum(t.royalty+t.advance) 'PROFIT'
FROM authors a
	INNER JOIN titleauthor ta ON a.au_id=ta.au_id
	INNER JOIN titles t ON ta.title_id=t.title_id
GROUP by a.au_id
ORDER BY sum(t.royalty*ta.royaltyper*0.01+t.advance) DESC
LIMIT 3;