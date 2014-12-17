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

--Q5
select distinct a.name 
as Agent, c.name 
as Customer
from orders o, agents a, customers c
where a.city = c.city 
	and o.cid = c.cid
	and o.aid = a.aid;

--Q6
select customers.name as "customer_name", agents.name as "agent_name",customers.city
from customers,
     agents
where customers.city = agents.city
order by "customer_name" asc

--Q7
select distinct c.name, c.city
from customers c
inner join orders o
on o.cid=c.cid
inner join products p
on o.pid=p.pid
where c.city in(select city 
		 from products
		 group by city
		 order by count(quantity)
		 limit1)
		 


