# Lab | SQL Join

#In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals.

### Instructions
use sakila;

# 1. List number of films per `category`.
Select c.category_id, c.name, count(f.film_id) as n_films 
from sakila.category as c
join sakila.film_category as f
on c.category_id=f.category_id
group by c.category_id, c.name
order by n_films desc;

#2. Display the first and last names, as well as the address, of each staff member.
Select* from address;
Select s.first_name, s.last_name, s.address_id, a.address, a.postal_code, c.city
from sakila.staff as s
	left join sakila.address as a
	on s.address_id=a.address_id
    left join sakila.city as c
    on a.city_id=c.city_id;

#3. Display the total amount rung up by each staff member in August of 2005.
Select* from payment;
Select s.staff_id, s.first_name, s.last_name, sum(p.amount) as sum_payments
from sakila.staff as s
	left join sakila.payment as p
    on s.staff_id=p.staff_id
where month(p.payment_date)=8 and year(p.payment_date)=2005
group by p.staff_id;

Select s.staff_id, s.first_name, s.last_name, sum(p.payment_id) as n_payments
from sakila.staff as s
	left join sakila.payment as p
    on s.staff_id=p.staff_id
where month(p.payment_date)=8 and year(p.payment_date)=2005
group by p.staff_id;

#4. List each film and the number of actors who are listed for that film.
select count(a.actor_id) as n_actors, a.film_id, f.title
from sakila.film_actor as a
	left join sakila.film as f
	on a.film_id=f.film_id
group by a.film_id, f.title
order by n_actors desc;

#5. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. 
#List the customers alphabetically by last name.
Select count(customer_id) from customer; #validate result=599 costumer
Select* from payment;
Select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_amount
from sakila.customer as c
inner join sakila.payment as p
on c.customer_id=p.customer_id
group by p.customer_id
order by last_name asc;

