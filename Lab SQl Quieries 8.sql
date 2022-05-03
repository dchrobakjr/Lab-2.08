# Lab SQL Quieries 8


# 1. 


use
	sakila;
    

select 
	*
from 
	sakila.film;
    
select
	title, length
from
	sakila.film;
    
    
select
	title as 'Title', length as 'Length', 
    dense_rank() over (Order by length desc) as 'Length Rank'
from
	sakila.film
where 
	'Length Rank' is not null  or  'Length Rank' != 0 or 'Length' != ' ';
    


#2.


select
	title as 'Title', length as 'Length', rating as 'Rating',
    dense_rank() over (partition by rating Order by length desc) as 'Length Rank'
from
	sakila.film
where 
	'Length Rank' is not null  or  'Length Rank' != 0 or 'Length' != ' ';


# 3.


select
	*
from
	sakila.film_category;

select
	*
from
	sakila.category;


select
	sakila.category.name, count(sakila.film_category.film_id) as 'Total Movies'
from
	sakila.category
join
	sakila.film_category
on
	sakila.category.category_id = sakila.film_category.category_id
group by
	sakila.category.name;
  
  
  
# 4.

	
select 
	*
from
	sakila.actor;
        
select
	*
from 
	sakila.film;
    

SELECT
    sakila.actor.first_name,
    sakila.actor.last_name,
    COUNT(*) AS Appearances
FROM
    sakila.actor
        JOIN
    sakila.film_actor ON sakila.actor.actor_id = sakila.film_actor.actor_id
GROUP BY sakila.actor.actor_id
ORDER BY Appearances DESC
LIMIT 1;



# 5


SELECT
    sakila.customer.first_name,
    sakila.customer.last_name,
    COUNT(*) AS Rentals
FROM
	sakila.customer
JOIN
    sakila.rental 
ON 
	sakila.customer.customer_id = sakila.rental.customer_id
GROUP BY 
	sakila.customer.customer_id
ORDER by 
	Rentals desc
LIMIT 
	1;
	


# Bonus



select
	sakila.film.title, count(*) AS Rentals
from
	sakila.film
join
    sakila.inventory on sakila.film.film_id = sakila.inventory.film_id
join
	sakila.rental on sakila.inventory.inventory_id = sakila.rental.inventory_id
group by
	sakila.film.film_id
order by
	Rentals desc
limit 1;



select 
	*
from
	sakila.inventory
where 
	sakila.inventory.inventory_id 
		in 
			(select inventory_id from sakila.rental);





























  