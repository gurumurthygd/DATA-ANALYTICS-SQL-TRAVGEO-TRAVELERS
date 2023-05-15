-- 1.a)	Create a schema named Travego. 

create database travego;
use travego;

-- 1.b) b.	Create the tables mentioned above with the mentioned column names. 

CREATE TABLE passenger(
Passenger_id DOUBLE,
Passenger_name VARCHAR(100),
Category VARCHAR(100),
Gender VARCHAR(100),
Boarding_City VARCHAR(100),
Destination_City VARCHAR(100),
Distance double,
Bus_Type VARCHAR(100)
);

CREATE TABLE price(
id DOUBLE,
Bus_type VARCHAR(100),
Distance DOUBLE,
Price DOUBLE
);


-- 1.c)	Insert the data in the newly created tables using sql script or using MySQL UI.

INSERT INTO passenger values
(1, 'Sejal', 'AC', 'F ', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
(3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
(4, 'Khusboo ', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5, 'Udit', 'Non-AC ', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai ', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

INSERT INTO price VALUES
(1, 'Sleeper', 350, 770),
(2, 'Sleeper', 500, 1100),
(3, 'Sleeper', 600, 1320),
(4, 'Sleeper', 700, 1540),
(5, 'Sleeper', 1000, 2200),
(6, 'Sleeper', 1200, 2640),
(7, 'Sleeper', 1500, 2700),
(8, 'Sitting', 500, 620),
(9, 'Sitting', 600, 744),
(10, 'Sitting', 700, 868),
(11, 'Sitting', 1000, 1240),
(13, 'Sitting', 1500, 1860);


-- 2.a)	How many females and how many male passengers traveled a minimum distance of 600 KMs?

select gender,count(gender) from passenger where distance>=600 group by gender;

-- 2.b)	Find the minimum ticket price of a Sleeper Bus. 
select bus_type,min(price) from price group by bus_type having bus_type="sleeper";

-- 2.c)	Select passenger names whose names start with character 'S' 
select passenger_name from passenger having passenger_name like"s%";

-- 2.d)	Calculate price charged for each passenger
-- displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output. 

select a.passenger_name,a.boarding_city,a.destination_city,a.bus_type,b.price from passenger a
left join
price b
on a.distance=b.distance and a.bus_type=b.bus_type
group by passenger_name;

-- 2.e)	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  

select a.passenger_name,b.price from 
passenger a 
left join 
price b 
on a.passenger_id=b.id where a.bus_type="sitting" and a.distance="1000";


-- 2.f) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select a.passenger_name,b.bus_type,b.price from passenger a
 join price b 
 on a.distance=b.distance  where passenger_name="pallavi" ;
 
-- 2.g) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
 select distinct(distance) from passenger order by distance desc;
 
-- 2.h) h.	Display the passenger name and percentage of distance traveled by that passenger from the total distance
-- traveled by all passengers without using user variables

 select passenger_name,(distance*100)/(select sum(distance) from passenger) as percentage_traveled_by_each_passenger
 from passenger;
 