---SITING WANG
--Lab5

--Q1
select distinct agents.city
from agents,
     orders,
     customers
where agents.aid = orders.aid
and orders.cid = customers.cid
and customers.name = 'Tiptop';

--Q2
select distinct orders2.pid
from customers, 
     agents,
     orders orders1, 
     orders orders2
where orders1.aid = agents.aid
and orders1.cid=customers.cid
and orders2.aid=agents.aid
and customers.city = 'Kyoto'
order by pid asc;

--Q3
select name
from customers
where cid not in (select cid
                  from orders)
order by name asc


--Q4
select customers.name
from customers
left outer join orders 
on customers.cid = orders.cid
where orders.cid is null
order by customers.name asc

/*--Q5
select customers.name as "customer_name", agents.name as "agent_name"
from customers,
     orders,
     agents
where customers.cid = orders.cid
  and agents.aid = orders.aid
  and customers.city = agents.city
order by "customer_name" asc*/

--Q6
select customers.name as "customer_name", agents.name as "agent_name",customers.city
from customers,
     agents
where customers.city = agents.city
order by "customer_name" asc

/*--Q7
select city, sum(quantity) as "sum_quantity"
from products
group by city
order by sum_quantity asc
limit 1*/
