drop database bus;
create database bus;
\c bus;

create table customer(name varchar(15),
			customer_id varchar(15),
			dob date,
			email varchar(25) not null,
			occupation varchar(15),
			gender varchar(15),
			primary key(customer_id));

create table discountdetails(discount_id varchar(15),
			discount_amount int,
			primary key(discount_id));

			
create table tickets(noof_tickets int,
			departuretime varchar(15) ,
			seatno varchar(15),
			pnr varchar(15),
			Route_no varchar(5), 
			cust_id varchar(15),	
			primary key(pnr),
			foreign key(cust_id) references customer(customer_id)
			
);
create table billing_details ( bill_id varchar(15),
			  bill_status varchar(15),
			bill_date date,
			totalamount float,

pnr_no varchar(15),
bank_name varchar(15),
bank_locations varchar(15),
payment_mode varchar(15),
dis_id varchar(20),
primary key(bill_id),
foreign key(dis_id)references discountdetails(discount_id),
foreign key(pnr_no)references tickets(pnr)  on delete set null);

create table booking_details (book_id varchar(15),
		amount float,
		bookingstatus varchar(15),
		securitydeposit float,
		bill_id varchar(15),
	primary key(book_id),
	foreign key(bill_id) references billing_details(bill_id)
);
create table depot(
		depot_name varchar(15),
		depot_id varchar(15),
	        primary key(depot_id)

);				
create table bus(
	bus_id varchar(15),
	buscompanyname varchar(15),
	depot_id varchar(15),
        bus_type varchar(50),
	primary key(bus_id),
	foreign key(depot_id) references depot(depot_id) on delete set null

);

create table driver(
    driver_id varchar(15),name varchar(15),salary float,dob date,
    gender varchar(10),
    primary key(driver_id));

create table courieroffice(
	companyname varchar(15),
	item_id varchar(15),
	itemweight varchar(15),
	dateofreach date,
	primary key(item_id) 
);

create table courier_servicedby(
item_id varchar(15)
,B_id varchar(15)
,item_no int 
,item_weight int
,primary key(item_id),
foreign key(B_id) references bus(bus_id),
foreign key(item_id) references courieroffice(item_id) on delete set null
);



create table customer_goesto(

item_id varchar(15),cust_id varchar(15),item_no int,primary key(item_id ,cust_id),foreign key(item_id) references courieroffice(item_id) ,foreign key(cust_id) references customer(customer_id)

);


create table customer_choose(

cust_id varchar(15),B_id varchar(15),
primary key(B_id,cust_id),foreign key(cust_id) references customer(customer_id),foreign key(B_id) references bus(bus_id)

);

create table bank_locations(

bill_id varchar(15),bank_location varchar(50),primary key(bill_id),foreign key(bill_id) references billing_details(bill_id)

);

create table route(

B_id varchar(15),R_no varchar(5),source varchar(15),destination varchar(15),distance float,date_of_journey date ,foreign key(B_id) references bus(bus_id)

);


create table drives(
B_id varchar(15),
d_id varchar(15),
D_name varchar(20),
salary float,
dob date,
primary key(B_id,d_id),
foreign key(B_id) references bus(bus_id),foreign key(d_id) references driver(driver_id)
);

/*INSERTION OF VALUES BEGINS HERE*/



			
insert into customer values('lokesh','201701','1996-11-04','lokesh@gmail.com','buisness','male');
insert into customer values('sanjith','201702','1995-10-24','sanjith@gmail.com','painter','male');
insert into customer values('abdul','201703','1988-09-14','abdul@gmail.com','cab driver','male');
insert into customer values('adbullah','201704','1991-06-20','adbullah@gmail.com','engineer','male');
insert into customer values('sanjana','201705','1997-04-27','sanju@gmail.com','doctor','female');
insert into customer values('Aishwarya','201706','1997-05-27','aish@gmail.com','doctor','female');
insert into customer values('sanjay','201707','1995-11-24','sanjay@gmail.com','painter','male');
insert into customer values('abhijay','201708','1988-12-14','abdhiajy@gmail.com','cab driver','male');
insert into customer values('adbu','201709','1991-06-21','adbu@gmail.com','engineer','male');
insert into customer values('sanjana','201710','1997-04-22','sanjana@gmail.com','mechanic','female');
insert into customer values('Akanksha','201711','1996-05-17','akanksha@gmail.com','doctor','female');
insert into customer values('sandesh','201712','1999-11-24','sandseh@gmail.com','buisiness','male');
insert into customer values('karan','201713','1988-09-10','karan@gmail.com','cab driver','male');
insert into customer values('adbullah','201714','1991-07-20','adbullah@gmail.com','engineer','male');
insert into customer values('sanjana','201715','2000-05-27','sanju@gmail.com','doctor','female');
insert into customer values('Aishwarya','201716','1997-05-27','aish@gmail.com','housewife','female');




insert into discountdetails values('101A',75);
insert into discountdetails values('101B',105);
insert into discountdetails values('101C',100);
insert into discountdetails values('101D',50);
insert into discountdetails values('101E',80.50);
insert into discountdetails values('101F',81.50);
insert into discountdetails values('101G',105);
insert into discountdetails values('101H',100);
insert into discountdetails values('101I',50);
insert into discountdetails values('101J',80.50);
insert into discountdetails values('101K',82.50);
insert into discountdetails values('101L',100);
insert into discountdetails values('101M',100);
insert into discountdetails values('101N',100);
insert into discountdetails values('101O',25.50);
insert into discountdetails values('101P',81.50);


insert into tickets values(3,'21:57:00','l5','PNR005','R8','201704');
insert into tickets values(4,'21:55:00','l4','PNR004','R7','201701');
insert into tickets values(2,'21:49:00','l3','PNR001','R6','201702');
insert into tickets values(1,'21:05:00','l2','PNR002','R5','201704');
insert into tickets values(4,'21:42:00','l7','PNR011','R4','201705');
insert into tickets values(6,'21:43:00','l6','PNR091','R4','201706');
insert into tickets values(1,'21:05:00','l2','PNR025','R5','201704');
insert into tickets values(1,'21:42:00','l1','PNR035','R4','201705');
insert into tickets values(1,'21:43:00','l6','PNR045','R4','201706');
insert into tickets values(2,'21:49:00','l3','PNR046','R6','201702');
insert into tickets values(1,'21:05:00','l2','PNR047','R5','201714');
insert into tickets values(4,'21:42:00','l4','PNR048','R4','201709');
insert into tickets values(6,'21:43:00','l9','PNR049','R2','201716');
insert into tickets values(1,'21:05:00','l2','PNR050','R5','201704');
insert into tickets values(1,'21:42:00','l5','PNR052','R1','201705');
insert into tickets values(7,'21:43:00','l6','PNR051','R4','201712');




insert into billing_details values('B01','paid','2017-05-14','700.50','PNR004','karnataka bank','bangalore','credit');
insert into billing_details values('B02','due=500', '2017-06-24','600.50','PNR011','state bank','udupi','paytm');
insert into billing_details values('B03','paid','2017-07-22','750','PNR002','icici bank','bangalore','credit');
insert into billing_details values('B04','paid','2017-08-04','700','PNR001','karnataka bank','dharwad','paytm');
insert into billing_details values('B05','due=700','2017-12-04','800.50','PNR004','karnatakabank','bangalore','credit');
insert into billing_details values('B06','paid','2017-05-24','750.50','PNR005','icici bank','bangalore','debit');
insert into billing_details values('B07','due=500', '2017-06-24','600.50','PNR035','state bank','udupi','paytm');
insert into billing_details values('B08','paid','2017-07-22','750','PNR045','icici bank','bangalore','credit');
insert into billing_details values('B09','paid','2017-08-04','700','PNR046','karnataka bank','dharwad','paytm');
insert into billing_details values('B10','due=700','2017-12-14','800.50','PNR004','karnatakabank','bangalore','credit');
insert into billing_details values('B11','paid','2017-05-04','750.50','PNR005','icici bank','bangalore','debit');
insert into billing_details values('B12','due=500', '2017-04-24','600.50','PNR011','state bank','udupi','paytm');
insert into billing_details values('B13','paid','2017-07-23','750','PNR047','icici bank','gadag','credit');
insert into billing_details values('B14','paid','2017-08-04','700','PNR001','karnataka bank','dharwad','paytm');
insert into billing_details values('B15','due=700','2017-12-04','800.50','PNR004','karnatakabank','bangalore','credit');
insert into billing_details values('B16','paid','2017-05-24','750.50','PNR048','icici bank','bangalore','debit');




insert into booking_details values('BK01','700.50','confirmed','500','B01');
insert into booking_details values('BK02','600.50','confirmed','500','B02');
insert into booking_details values('BK03','700.00','no','750','B01');
insert into booking_details values('BK04','800.50','confirmed','1000','B04');
insert into booking_details values('BK05','750.00','no','500','B03');
insert into booking_details values('BK06','800.50','confirmed','450','B05');
insert into booking_details values('BK07','600.50','confirmed','500','B02');
insert into booking_details values('BK08','700.00','no','750','B01');
insert into booking_details values('BK09','800.50','confirmed','1000','B04');
insert into booking_details values('BK10','750.00','no','500','B03');
insert into booking_details values('BK11','800.50','confirmed','450','B15');
insert into booking_details values('BK12','600.50','confirmed','500','B16');
insert into booking_details values('BK13','600.00','no','755','B01');
insert into booking_details values('BK14','800.50','confirmed','1000','B04');
insert into booking_details values('BK15','750.00','no','500','B03');
insert into booking_details values('BK16','800.50','confirmed','450','B05');

insert into depot values('VRL','D01');
insert into depot values('VRL','D02');
insert into depot values('SUGAMA','D03');
insert into depot values('DURGAMBA','D04');
insert into depot values('VRL','D05');
insert into depot values('SRS','D06');
insert into depot values('VRL','D07');
insert into depot values('SUGAMA','D08');
insert into depot values('DURGAMBA','D09');
insert into depot values('SUMUKHA','D10');
insert into depot values('SRS','D11');
insert into depot values('SOWMYA','D12');
insert into depot values('SUGAMA','D13');
insert into depot values('DURGAMBA','D14');
insert into depot values('BHARATHI','D15');
insert into depot values('SRS','D16');
			

insert into bus values('BUS01','VRL','D01','AC_sleeper');
insert into bus values('BUS03','SUGAMA','D04','AC_seater');
insert into bus values('BUS02','VRL','D02','NON_AC_sleeper');
insert into bus values('BUS05','SOWMYA','D04','AC_sleeper');
insert into bus values('BUS04','SRS','D03','NON_AC_sleeper');
insert into bus values('BUS06','VRL','D02','AC_sleeper');
insert into bus values('BUS07','SUGAMA','D04','AC_seater');
insert into bus values('BUS08','VRL','D02','NON_AC_sleeper');
insert into bus values('BUS09','Subha','D04','AC_sleeper');
insert into bus values('BUS10','SRS','D03','NON_AC_sleeper');
insert into bus values('BUS11','VRL','D02','AC_sleeper');
insert into bus values('BUS12','SUGAMA','D14','AC_seater');
insert into bus values('BUS13','VRL','D02','NON_AC_sleeper');
insert into bus values('BUS15','SOWMYA','D04','AC_sleeper');
insert into bus values('BUS14','SRS','D13','NON_AC_sleeper');
insert into bus values('BUS16','VRL','D12','AC_sleeper');



insert into courieroffice values('vinayaka','I01','20kg','2017-06-24');
insert into courieroffice values('vishnu ','I02','05kg','2017-06-22');
insert into courieroffice values('vinayaka','I04','25kg','2017-06-21');
insert into courieroffice values('ddtc','I03','10kg','2017-06-25');
insert into courieroffice values('krishna','I06','20kg','2017-06-26');
insert into courieroffice values('ganesha','I05','30kg','2017-06-25');
insert into courieroffice values('mohan','I07','300kg','2017-07-25');
insert into courieroffice values('charan','I10','300kg','2017-04-25');
insert into courieroffice values('vinayaka','I08','20kg','2017-06-24');
insert into courieroffice values('vishnu ','I09','05kg','2017-06-22');
insert into courieroffice values('vinayaka','I11','25kg','2017-05-21');
insert into courieroffice values('ddtc','I12','10kg','2017-06-25');
insert into courieroffice values('krishna','I13','20kg','2017-03-26');
insert into courieroffice values('ganesha','I14','30kg','2017-06-25');
insert into courieroffice values('mohan','I15','350kg','2017-07-24');
insert into courieroffice values('chalukya','I16','300kg','2017-05-25');



insert into courier_servicedby values('I02','BUS03','03','20');
insert into courier_servicedby values('I01','BUS05','04','05');
insert into courier_servicedby values('I03','BUS02','03','30');
insert into courier_servicedby values('I06','BUS04','05','10');
insert into courier_servicedby values('I04','BUS01','03','20');
insert into courier_servicedby values('I05','BUS06','06','20');
insert into courier_servicedby values('I07','BUS06','03','20');
insert into courier_servicedby values('I10','BUS06','06','20');
insert into courier_servicedby values('I08','BUS07','03','20');
insert into courier_servicedby values('I09','BUS05','04','05');
insert into courier_servicedby values('I11','BUS08','03','30');
insert into courier_servicedby values('I12','BUS04','05','10');
insert into courier_servicedby values('I13','BUS01','03','20');
insert into courier_servicedby values('I15','BUS09','06','20');
insert into courier_servicedby values('I16','BUS06','03','20');
insert into courier_servicedby values('I14','BUS16','06','20');


insert into driver values('DR01','Deva','30000','1988-03-02','male');
insert into driver values('DR03','Beva','30000','1987-06-03','male');
insert into driver values('DR02','Rama','20000','1965-05-13','male');
insert into driver values('DR05','Soma','22000','1988-06-24','male');
insert into driver values('DR04','Bhima','30000','1966-04-03','male');
insert into driver values('DR06','Krishna','25000','1988-06-30','male');
insert into driver values('DR13','Beva','30000','1987-06-03','male');
insert into driver values('DR12','Rama','20000','1986-05-13','male');
insert into driver values('DR15','Soma','22000','1988-06-24','male');
insert into driver values('DR14','shyama','30000','1985-04-03','male');
insert into driver values('DR16','Krishna','25000','1958-05-30','male');
insert into driver values('DR11','Beemanna','30000','1988-06-03','male');
insert into driver values('DR10','Rama','20000','1986-05-13','male');
insert into driver values('DR09','Somanna','22000','1990-06-24','male');
insert into driver values('DR08','Bhima','30000','1991-04-03','male');
insert into driver values('DR07','Krishna','25000','1988-06-30','male');


insert into drives values('BUS02','DR01','Deva','30000','1988-03-02');
insert into drives values('BUS01','DR03','Beva','30000','1987-06-03');
insert into drives values('BUS05','DR02','Rama','20000','1986-05-13');
insert into drives values('BUS04','DR05','Soma','22000','1988-06-24');
insert into drives values('BUS03','DR04','Bhima','30000','1985-04-03');
insert into drives values('BUS06','DR06','Krishna','25000','1988-06-30');
insert into drives values('BUS07','DR13','Beema','30000','1987-06-03');
insert into drives values('BUS15','DR16','Rama','20000','1986-05-13');
insert into drives values('BUS12','DR15','Soma','22000','1988-06-24');
insert into drives values('BUS13','DR14','Bhima','30000','1985-04-03');
insert into drives values('BUS16','DR12','Krishna','25000','1988-06-30');
insert into drives values('BUS11','DR11','Beva','30000','1987-06-03');
insert into drives values('BUS14','DR10','Rama','20000','1986-05-13');
insert into drives values('BUS10','DR09','Somanna','22000','1988-06-24');
insert into drives values('BUS09','DR08','Bhima','30000','1989-03-03');
insert into drives values('BUS08','DR07','Krishna','25000','1989-06-30');


insert into customer_goesto values('I01','201701',03);
insert into customer_goesto values('I06','201706',04);
insert into customer_goesto values('I04','201704',05);
insert into customer_goesto values('I05','201705',03);
insert into customer_goesto values('I03','201703',06);
insert into customer_goesto values('I02','201702',02);
insert into customer_goesto values('I07','201716',04);
insert into customer_goesto values('I08','201714',05);
insert into customer_goesto values('I14','201715',03);
insert into customer_goesto values('I09','201713',07);
insert into customer_goesto values('I16','201712',02);
insert into customer_goesto values('I10','201711',04);
insert into customer_goesto values('I11','201710',05);
insert into customer_goesto values('I15','201709',08);
insert into customer_goesto values('I13','201708',06);
insert into customer_goesto values('I12','201707',02);



insert into customer_choose values('201701','BUS05');
insert into customer_choose values('201702','BUS01');
insert into customer_choose values('201704','BUS04');
insert into customer_choose values('201703','BUS03');
insert into customer_choose values('201706','BUS06');
insert into customer_choose values('201705','BUS02');
insert into customer_choose values('201707','BUS07');
insert into customer_choose values('201708','BUS08');
insert into customer_choose values('201709','BUS09');
insert into customer_choose values('201710','BUS10');
insert into customer_choose values('201711','BUS12');
insert into customer_choose values('201712','BUS11');
insert into customer_choose values('201714','BUS14');
insert into customer_choose values('201713','BUS13');
insert into customer_choose values('201716','BUS15');
insert into customer_choose values('201715','BUS16');



insert into   route values('BUS01','R8','kundapur','thirupathi',1234,'2017-04-07');
insert into route values('BUS05','R4','bangalore','thirupathi',234,'2017-04-08');
insert into route values('BUS04','R9','kundapur','thirupathi',1423,'2017-04-07');
insert into   route values('BUS06','R2','kundapur','gulbarga',1234,'2017-04-09');
insert into   route values('BUS03','R6','kundapur','thirupathi',1034,'2017-04-10');
insert into   route values('BUS02','R1','Raichur','thirupathi',1204,'2017-04-07');
insert into route values('BUS15','R4','bangalore','thirupathi',234,'2017-04-09');
insert into route values('BUS04','R9','kundapur','thirupathi',1234,'2017-04-07');
insert into   route values('BUS16','R2','kundapur','gulbarga',1234,'2017-04-11');
insert into   route values('BUS03','R6','kundapur','shimoga',1034,'2017-04-12');
insert into   route values('BUS12','R1','Raichur','thirupathi',1204,'2017-04-08');
insert into route values('BUS05','R4','bangalore','thirupathi',234,'2017-04-11');
insert into route values('BUS04','R9','kundapur','gadag',1234,'2017-04-13');
insert into   route values('BUS06','R2','kundapur','gulbarga',1243,'2017-04-12');
insert into   route values('BUS03','R6','kundapur','thirupathi',1043,'2017-04-09');
insert into   route values('BUS02','R1','Raichur','thirupathi',1204,'2017-04-12');


/*give the booking details and billing details of all the customers who have booked the tickets via paytm */
select * 
from billing_details bd left join booking_details bkd
on payment_mode = 'paytm' and bd.bill_id = bkd.bill_id;

            

/*select all the names of customers who have more than 2 bookings for the same bill*/
select c.customer_id,c.name
from customer c
where exists (select bd.bill_id
       from booking_details bd,billing_details bbd ,tickets t
      where bd.bill_id = bbd.bill_id and bbd.pnr_no = t.pnr  and t.cust_id = c.customer_id
       group by bd.bill_id
       having count(*)>2);

/*list all the available buses from kundapur to thirupathi on 7th April*/



select buscompanyname,bus_type
from bus
where bus_id in(select B_id
from route
where source='kundapur' and destination='thirupathi' and date_of_journey = '2017-04-07' );


/*select all the customers who haven't booked any tickets in vrl bus */



select name
from customer
where customer_id in (select cc.cust_id
					from customer_choose cc
					where B_id not in (select bus_id
					from bus where buscompanyname='VRL'));
 





/*update the salary of all drivers who drives the the bus in route no 'R8' by 20%.*/


update driver dd 
set salary = 1.2*salary
where dd.driver_id in ( select dd.driver_id
               from bus b,drives d,route r
               where d.d_id = dd.driver_id and d.B_id = b.bus_id and b.bus_id = r.B_id and r.R_no = 'R8');



/*
give a 20% discount to all the customers who have booked more than two tickets*/

UPDATE discountdetails dd
set discount_amount = 1.2*discount_amount
where dd.discount_id  in (select c.customer_id from  tickets t,customer c
                        where t.cust_id = c.customer_id
                        and  noof_tickets>3
                        );




