SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME', titles.title 'TITLE', publishers.pub_name 'PUBLISHER' 
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id
ORDER BY authors.au_id;

SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME', 
titles.title 'TITLE', publishers.pub_name 'PUBLISHER', 
COUNT(authors.au_id) 'TITLE COUNT'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id
GROUP BY authors.au_id
ORDER BY authors.au_id;

SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME',
sum(authors.au_id) 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY count(authors.au_id) DESC
LIMIT 3;

SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME',
sum(authors.au_id) 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY count(authors.au_id) DESC
LIMIT 23;

SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME', 
sum(titles.royalty+titles.advance) 'PROFIT'
FROM authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
GROUP by authors.au_id
ORDER BY sum(titles.royalty*titleauthor.royaltyper*0.01+titles.advance) DESC
LIMIT 3;