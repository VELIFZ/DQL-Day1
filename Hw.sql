--       Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?

select count(last_name) from actor
where last_name = 'Wahlberg';
-- Answer = 2

-- 2. How many payments were made between $3.99 and $5.99?
select count(amount) from payment
where amount between 3.99 and 5.99 -- works without ';'?
-- Asnwer = 5,563

-- 3. What film does the store have the most of? (search in inventory)

select film_id, count(film_id) as c from inventory
group by film_id
order by c desc;
-- Asnwer = film_id -> 200, title-> Curtain Videotape 

-- 4. How many customers have the last name ‘William’?
select count(last_name) from  customer1 -- I did from customer and customer1 both same result
where last_name = 'William';
-- Answer = 0

-- 5. What store employee (get the id) sold the most rentals?
select * from rental;
select count(*), staff_id from rental
group by staff_id;
-- Answer: staff_id 1 with 8,040 rentals

-- 6. How many different district names are there?
select * from address;
select count(distinct district) from address;
-- Answer: 378

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select * from film_actor;
select film_id, count(distinct actor_id) as c from film_actor
group by film_id
order by c desc
limit 1;
-- Answer: film_id 508

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select * from customer;
select store_id, count(last_name) from customer
where last_name like '%es' and store_id = 1
group by store_id
-- Answer: 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
select * from payment;
select distinct amount, count(customer_id) from payment
where customer_id between 380 and 430
group by amount
having count(customer_id) > 250;
-- Answer: 3

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
select * from film;
select rating, count(*) from film
group by rating;
-- Answer: 5 categories, PG-13 with the most
