-- 1) senior most employee
-- Query:select * from employee order by levels desc limit 1;

-- 2) country with most no of invoices
-- Query:select billing_country,count(*) from invoice group by billing_country  order by count(*) desc limit 1;

-- 3) top 3 values of invoice
-- Query:select total  from invoice order by total desc limit 3;

-- 4) city with highest sales
-- Query:select billing_city,sum(total) from invoice group by billing_city order by sum(total) desc limit 1;


-- 5) best customer (who made max total)
--  Query: select customer.customer_id,customer.first_name,customer.last_name, sum(invoice.total) as total
-- from customer
-- join invoice on invoice.customer_id = customer.customer_id
-- group by customer.customer_id
-- order by total desc
-- limit 1

-- 6) return email,first_name,last_name & genre of all rock music listeners return list ordered alphabetically
-- Query:select distinct email,first_name,last_name
-- from customer 
-- join invoice on invoice.customer_id = customer.customer_id
-- join invoice_line on invoice.invoice_id = invoice_line.invoice_id
-- where track_id in (
-- 	select track_id from track
-- 	join genre on genre.genre_id = track.genre_id
-- 	where genre.name ilike 'rock'
-- )
-- order by email;

-- 7) artist who written most rock music 

-- Query:select artist.artist_id,artist.name,count(artist.artist_id) as no_of_songs from artist join
-- album on album.artist_id = artist.artist_id
-- join track on track.album_id = album.album_id
-- join genre on genre.genre_id = track.genre_id
-- where genre.name ilike 'rock'
-- group by artist.artist_id
-- order by no_of_songs desc
-- limit 10;



--8) songs having song length greater than avg song length 
--Query: select track.name,milliseconds from track 
-- where milliseconds > ( select avg(milliseconds) from track )
-- order by milliseconds desc;




