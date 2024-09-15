# Music Database Analysis

This repository contains a collection of SQL queries designed to analyze a music database. The goal is to extract insightful information about employees, customers, sales, and music tracks from the database.

## Queries and Results

### Senior Most Employee

**Query:**
```sql
SELECT * FROM employee ORDER BY levels DESC LIMIT 1;
Description: Retrieves the employee with the highest level.

Country with Most Number of Invoices
Query:SELECT billing_country, COUNT(*) FROM invoice GROUP BY billing_country ORDER BY COUNT(*) DESC LIMIT 1;
Description: Identifies the country with the most invoices.

Top 3 Invoice Values
Query:SELECT total FROM invoice ORDER BY total DESC LIMIT 3;
Description: Lists the top 3 highest invoice totals.

City with Highest Sales
Query:SELECT billing_city, SUM(total) FROM invoice GROUP BY billing_city ORDER BY SUM(total) DESC LIMIT 1;
Description: Finds the city with the highest total sales.

Best Customer (Who Made Maximum Total Purchases)
Query:SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS total
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC LIMIT 1;
Description: Identifies the customer who has spent the most.

Rock Music Listeners
Query:SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
  SELECT track_id FROM track
  JOIN genre ON genre.genre_id = track.genre_id
  WHERE genre.name ILIKE 'rock'
)
ORDER BY email;
Description: Lists all rock music listeners with their email, first name, and last name, ordered alphabetically.

Artists Who Wrote the Most Rock Music
Query:SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS no_of_songs
FROM artist
JOIN album ON album.artist_id = artist.artist_id
JOIN track ON track.album_id = album.album_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name ILIKE 'rock'
GROUP BY artist.artist_id
ORDER BY no_of_songs DESC LIMIT 10;
Description: Finds the top 10 artists who have written the most rock songs.

Songs with Length Greater Than Average
Query:SELECT track.name, milliseconds FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
ORDER BY milliseconds DESC;
Description: Lists songs with lengths greater than the average song length.

Setup and Execution
Clone this repository to your local machine:git clone https://github.com/your-username/music-database-analysis.git
Connect to your SQL database and execute the queries provided in the Queries and Results section to analyze the music database.

Modify the queries as needed based on your specific database schema and requirements.
