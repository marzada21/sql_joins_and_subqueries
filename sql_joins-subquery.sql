-- question 1: list all customers who live in Texas (use joins)
select * from address;
select * from customer;

select first_name, last_name, address.address, district
from customer
join address on customer.address = address.address
where district = 'Texas';

-- question 2: get all payments above $6.99 with the customers full name
select * from payment;
select * from customer;

select customer.first_name, customer.last_name, payment.amount
from customer
join payment on customer.customer_id = payment.customer_id
where payment.amount > 6.99;

-- question 3: show all customers names who have made payments over $175 (use subqueries)
select * from customer;
select * from payment;

select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 175
);


-- question 4: list all customers that live in Nepal (use the city table)
select * from customer;
select * from city;

select first_name, last_name
from customer
join city on customer.city = city.city
where city.city = 'Nepal';

-- question 5: which staff member had the most transactions?
select * from staff;
select * from payment;

select staff_id
from staff 
where staff_id = (
	select staff_id
	from payment
	group by staff_id
	order by count(payment_id) desc
	limit 1
);

-- staff_id 2 had the most transactions

-- question 6: how many movies of each rating are there?
select rating, count(*)
from film group by rating;

-- question 7: show all customers who have made a single payment above $ 6.99 (use subqueries)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having count(*) = 1 and max(amount) > 6.99
);

-- question 8: how many free rentals did our stores give away?
select count(*) from rental
join payment on rental.rental_id = payment.rental_id
where payment.amount = 0.00;

-- no free rentals were given away