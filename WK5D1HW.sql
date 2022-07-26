-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name) FROM actor
WHERE last_name = 'Wahlberg';
-- Answer 2 (Nick & Daryl)


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- Answer 5602


-- 3. What film does the store have the most of? (search in inventory)
SELECT inventory.store_id, film.title, COUNT(inventory.film_id)
FROM inventory, film
WHERE film.film_id = inventory.film_id
GROUP BY store_id, film.title;
-- Answer Too Many to list - 4 was the highest count for any title
-- Secondary answer Store 2 had the most titles


-- 4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
-- Answer 0


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff.first_name, staff.last_name, rental.staff_id, COUNT(rental.staff_id)
FROM rental, staff
WHERE rental.staff_id = staff.staff_id
GROUP BY staff.first_name, staff.last_name, rental.staff_id;
-- Answer Mike with 8040 rentals


-- 6. How many different district names are there?
-- Customers with a District name in address
SELECT COUNT(district)
FROM address;
-- Answer 603

-- the number of distinct District names
SELECT COUNT(DISTINCT district)
from address;
-- Answer 378


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_actor.film_id, film.title, COUNT(film_actor.actor_id)
FROM film_actor, film
WHERE film.film_id = film_actor.film_id
GROUP BY film_actor.film_id, title;
-- Answer Lambs Cincinatti with 15



-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
-- Answer 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT COUNT(DISTINCT rating), rating, COUNT(rating) as mpaa_rating
from film
GROUP BY rating
ORDER BY mpaa_rating DESC;
-- Answer 5 rating categories, with PG13 being the most prevalent at 223. 
