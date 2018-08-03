1)select all the customers who wil book more than 2 tickets
select c.name 
from customer c,ticket t
where t.cust_id=c.customer_id and noof_tickets>2;

2)give a 10% raise to salary of all the drivers
                 
update driver
set salary = 1.1*salary;

3)select all the items with item weight = 25kg
select * 
from courieroffice
where itemweight = '25kg';
4) select all the buses where bus name is 'VRL'

5)select all the drivers where salary greater than 25000
select salary from driver
group by salary
having count(*)>(select count(*)
                 from driver 
                 where salary>25000
);




6)selectall tha route nos having same ssource and destination

	7.select all the item_id serviced by busses with id='BUS06'

select item_id
from courier_servicedby
where bus_id='BUS06';



8)select all the busses chosen by the customers where bus type is ac slepper 

/*
/*
select c.name 
from customer c,tickets t
where t.cust_id=c.customer_id and noof_tickets>2;

update driver
set salary = 1.1*salary;

select  *
from courieroffice
where itemweight = '25kg';

select *
from bus
where buscompanyname='VRL';


select *
from route
where source='kundapur' and  destination = 'thirupathi';

select *
from customer c,tickets t
where t.noof_tickets=0 and c.customer_id=t.cust_id;


select item_id
from courier_servicedby
where B_id='BUS06';


select max(salary)
from driver;


select *
from bus b,customer_choose  c,customer c1
where bus_type='AC_sleeper' and b.bus_id=c.B_id and c.cust_id = c1.customer_id;

*/






*/

/*complex queries*/


1)update the salary of all drivers who drives the the bus in route no 'R8' by 20%.


2)give a 20% discount to all the customers who have booked more than two tickets














































/*
select c.name 
from customer c,tickets t
where t.cust_id=c.customer_id and noof_tickets>2;

update driver
set salary = 1.1*salary;

select  *
from courieroffice
where itemweight = '25kg';

select *
from bus
where buscompanyname='VRL';


select *
from route
where source='kundapur' and  destination = 'thirupathi';

select *
from customer c,tickets t
where t.noof_tickets=0 and c.customer_id=t.cust_id;


select item_id
from courier_servicedby
where B_id='BUS06';


select max(salary)
from driver;


select *
from bus b,customer_choose  c,customer c1
where bus_type='AC_sleeper' and b.bus_id=c.B_id and c.cust_id = c1.customer_id;


complex


update driver dd 
set salary = 1.2*salary
where dd.driver_id in ( select dd.driver_id
               from bus b,drives d,route r
               where d.d_id = dd.driver_id and d.B_id = b.bus_id and b.bus_id = r.B_id and r.R_no = 'R8');



UPDATE discountdetails dd
set discount_amount = 1.2*discount_amount
where dd.discount_id in(select dd.discount_id from billing_details bd,tickets t
                        where dd.discount_id = bd.dis_id and bd.pnr_no = t.pnr and t.noof_tickets>2);



cancel all the tickets that the customer book for the bus that goes in route no 4
delete from tickets
where  pnr in (select pnr 
                 from tickets 
                 where Route_no = 'R4'); 

select all the customers who courier is serviced by bus_id = '  ' and busname = vrl 


select all the customers who haven't booked any tickets in vrl bus 



give the booking details and billing details of all the customers who have booked the tickets via paytm */  

