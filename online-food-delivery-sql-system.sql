create database project_online_food_system;
use project_online_food_system;
create table customers (
customer_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone varchar(15) unique,
address varchar(100) not null,
city varchar(50) not null

);
create table restaurants(
 restaurants_id int primary key auto_increment,
 restaurants_name varchar(50) not null,
 city varchar(50) not null,
 rating decimal(2,1)
);
create table menu(
item_id int primary key auto_increment,
item_name varchar(100) not null,
category varchar(50) not null,
price decimal(10,2) not null ,
restaurants_id int,
 foreign key(restaurants_id) references restaurants(restaurants_id)
);
create table orders(
 order_id int primary key auto_increment,
 order_date date not null,
 order_status ENUM('pending','delivered','cancelled') NOT NULL,
 customer_id int not null,
 restaurants_id int not null,
  foreign key(customer_id) references customers(customer_id),
   foreign key(restaurants_id) references restaurants(restaurants_id)
);
create table order_items(
order_id int,
item_id int,
quantity int not null,
primary key (order_id, item_id),
 foreign key(order_id) references orders(order_id),
  foreign key(item_id) references menu(item_id)
);
create table payments (
payment_id int primary key auto_increment,
order_id int not null,
payment_method ENUM('card','cash','upi') not null,
payment_status ENUM('paid','failed','pending') NOT NULL,
 foreign key(order_id) references orders(order_id)
);
CREATE TABLE delivery_partners (
    delivery_partner_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);
create table delivery(
delivery_id int primary key auto_increment,
delivery_time time not null,
delivery_status ENUM('pending','delivered','cancelled') NOT NULL,
order_id int not null,
 delivery_partner_id INT NOT NULL,
foreign key(order_id) references orders(order_id),
FOREIGN KEY (delivery_partner_id) REFERENCES delivery_partners(delivery_partner_id)
);
INSERT INTO customers (first_name,last_name,phone,address,city) VALUES
('Rahul','Sharma','9000000001','Street 1','Delhi'),
('Aman','Verma','9000000002','Street 2','Mumbai'),
('Priya','Singh','9000000003','Street 3','Delhi'),
('Neha','Kapoor','9000000004','Street 4','Chandigarh'),
('Arjun','Mehta','9000000005','Street 5','Pune'),
('Riya','Das','9000000006','Street 6','Kolkata'),
('Karan','Malhotra','9000000007','Street 7','Delhi'),
('Simran','Kaur','9000000008','Street 8','Amritsar'),
('Rohit','Yadav','9000000009','Street 9','Lucknow'),
('Anjali','Gupta','9000000010','Street 10','Jaipur'),
('Vikas','Shah','9000000011','Street 11','Ahmedabad'),
('Sneha','Patil','9000000012','Street 12','Mumbai'),
('Manish','Jain','9000000013','Street 13','Delhi'),
('Pooja','Bansal','9000000014','Street 14','Chandigarh'),
('Deepak','Arora','9000000015','Street 15','Ludhiana'),
('Nikhil','Saini','9000000016','Street 16','Delhi'),
('Megha','Agarwal','9000000017','Street 17','Kanpur'),
('Yash','Chopra','9000000018','Street 18','Mumbai'),
('Divya','Reddy','9000000019','Street 19','Hyderabad'),
('Sahil','Khan','9000000020','Street 20','Bhopal'),
('Varun','Joshi','9000000021','Street 21','Delhi'),
('Komal','Thakur','9000000022','Street 22','Shimla'),
('Aditya','Nair','9000000023','Street 23','Kochi'),
('Isha','Malik','9000000024','Street 24','Delhi'),
('Harsh','Gupta','9000000025','Street 25','Noida'),
('Payal','Sharma','9000000026','Street 26','Delhi'),
('Rakesh','Verma','9000000027','Street 27','Mumbai'),
('Tanya','Singh','9000000028','Street 28','Delhi'),
('Gaurav','Kapoor','9000000029','Street 29','Chandigarh'),
('Alok','Mehta','9000000030','Street 30','Pune');

INSERT INTO restaurants (restaurants_name,city,rating) VALUES
('Pizza Hub','Delhi',4.5),
('Burger Point','Mumbai',4.2),
('Spicy Kitchen','Chandigarh',4.7),
('Food Palace','Delhi',4.3),
('Taste Town','Pune',4.4),
('Royal Bites','Kolkata',4.1),
('Urban Tadka','Delhi',4.6),
('Desi Flavors','Amritsar',4.8),
('Quick Eat','Lucknow',4.0),
('City Dine','Jaipur',4.3),
('Flavor House','Ahmedabad',4.2),
('Mumbai Express','Mumbai',4.5),
('Delhi Delights','Delhi',4.6),
('Chandigarh Cafe','Chandigarh',4.4),
('Punjab Grill','Ludhiana',4.7);

INSERT INTO menu (item_name,category,price,restaurants_id) VALUES
('Margherita Pizza','veg',250,1),
('Farmhouse Pizza','veg',300,1),
('Cheese Burger','non-veg',150,2),
('Veg Burger','veg',120,2),
('Paneer Tikka','veg',280,3),
('Chicken Tikka','non-veg',350,3),
('Veg Biryani','veg',200,4),
('Chicken Biryani','non-veg',280,4),
('Pasta Alfredo','veg',220,5),
('Cold Coffee','drinks',120,6),
('Noodles','veg',180,7),
('Spring Roll','veg',150,7),
('Butter Chicken','non-veg',400,8),
('Dal Makhani','veg',250,8),
('Fries','veg',100,9),
('Sandwich','veg',130,10),
('Pizza Combo','veg',500,11),
('Chicken Wings','non-veg',300,12),
('Ice Cream','dessert',90,13),
('Lassi','drinks',80,14);

INSERT INTO orders (order_date,order_status,customer_id,restaurants_id) VALUES
('2024-02-01','delivered',1,1),
('2024-02-02','pending',2,2),
('2024-02-03','cancelled',3,3),
('2024-02-04','delivered',4,4),
('2024-02-05','delivered',5,5),
('2024-02-06','pending',6,6),
('2024-02-07','delivered',7,7),
('2024-02-08','delivered',8,8),
('2024-02-09','pending',9,9),
('2024-02-10','delivered',10,10),
('2024-02-11','delivered',11,11),
('2024-02-12','pending',12,12),
('2024-02-13','cancelled',13,13),
('2024-02-14','delivered',14,14),
('2024-02-15','delivered',15,15),
('2024-02-16','pending',16,1),
('2024-02-17','delivered',17,2),
('2024-02-18','delivered',18,3),
('2024-02-19','pending',19,4),
('2024-02-20','delivered',20,5),
('2024-02-21','delivered',21,6),
('2024-02-22','pending',22,7),
('2024-02-23','cancelled',23,8),
('2024-02-24','delivered',24,9),
('2024-02-25','delivered',25,10),
('2024-02-26','pending',26,11),
('2024-02-27','delivered',27,12),
('2024-02-28','delivered',28,13),
('2024-02-29','pending',29,14),
('2024-03-01','delivered',30,15),
('2024-03-02','delivered',1,2),
('2024-03-03','pending',2,3),
('2024-03-04','delivered',3,4),
('2024-03-05','delivered',4,5),
('2024-03-06','pending',5,6),
('2024-03-07','delivered',6,7),
('2024-03-08','delivered',7,8),
('2024-03-09','pending',8,9),
('2024-03-10','delivered',9,10),
('2024-03-11','delivered',10,11),
('2024-03-12','pending',11,12),
('2024-03-13','cancelled',12,13),
('2024-03-14','delivered',13,14),
('2024-03-15','delivered',14,15),
('2024-03-16','pending',15,1),
('2024-03-17','delivered',16,2),
('2024-03-18','delivered',17,3),
('2024-03-19','pending',18,4),
('2024-03-20','delivered',19,5),
('2024-03-21','delivered',20,6);

INSERT INTO order_items VALUES
(1,1,2),(2,3,1),(3,5,1),(4,7,3),(5,9,2),
(6,10,1),(7,11,2),(8,13,1),(9,15,3),
(10,16,2),(11,17,1),(12,18,2),
(13,19,1),(14,20,3),(15,2,2),
(16,4,1),(17,6,2),(18,8,1);

INSERT INTO payments (order_id,payment_method,payment_status) VALUES
(1,'card','paid'),(2,'upi','pending'),(3,'cash','failed'),
(4,'card','paid'),(5,'upi','paid'),(6,'cash','paid'),
(7,'card','paid'),(8,'upi','pending'),(9,'cash','paid'),
(10,'card','paid'),(11,'upi','paid'),(12,'cash','pending'),
(13,'card','failed'),(14,'upi','paid'),(15,'cash','paid'),
(16,'card','pending'),(17,'upi','paid'),(18,'cash','paid'),
(19,'card','paid'),(20,'upi','pending'),
(21,'card','paid'),(22,'upi','paid'),(23,'cash','failed'),
(24,'card','paid'),(25,'upi','paid'),(26,'cash','pending'),
(27,'card','paid'),(28,'upi','paid'),(29,'cash','paid'),
(30,'card','pending'),
(31,'card','paid'),(32,'upi','paid'),(33,'cash','failed'),
(34,'card','paid'),(35,'upi','paid'),(36,'cash','pending'),
(37,'card','paid'),(38,'upi','paid'),(39,'cash','paid'),
(40,'card','paid'),(41,'upi','pending'),(42,'cash','paid'),
(43,'card','failed'),(44,'upi','paid'),(45,'cash','paid'),
(46,'card','pending'),(47,'upi','paid'),(48,'cash','paid'),
(49,'card','paid'),(50,'upi','pending'),
(1,'card','paid'),(2,'upi','paid'),(3,'cash','failed'),
(4,'card','paid'),(5,'upi','paid'),(6,'cash','paid'),
(7,'card','paid'),(8,'upi','pending');

INSERT INTO delivery_partners (name,phone) VALUES
('Rohit','7000000001'),
('Karan','7000000002'),
('Vikas','7000000003'),
('Amit','7000000004'),
('Suresh','7000000005');

INSERT INTO delivery (delivery_time,delivery_status,order_id,delivery_partner_id) VALUES
('12:00:00','delivered',1,1),
('12:30:00','pending',2,2),
('13:00:00','cancelled',3,3),
('13:30:00','delivered',4,4),
('14:00:00','delivered',5,5),
('14:30:00','pending',6,1),
('15:00:00','delivered',7,2),
('15:30:00','delivered',8,3),
('16:00:00','pending',9,4),
('16:30:00','delivered',10,5),
('17:00:00','delivered',11,1),
('17:30:00','pending',12,2),
('18:00:00','cancelled',13,3),
('18:30:00','delivered',14,4),
('19:00:00','delivered',15,5),
('19:30:00','pending',16,1),
('20:00:00','delivered',17,2),
('20:30:00','delivered',18,3),
('21:00:00','pending',19,4),
('21:30:00','delivered',20,5),
('22:00:00','delivered',21,1),
('22:30:00','pending',22,2),
('23:00:00','cancelled',23,3),
('23:30:00','delivered',24,4),
('23:45:00','delivered',25,5);

-- queries

-- 1. total number of customers 
select count(*)as total_customers from customers;
-- 2. list all restaurants in delhi
select * from restaurants where city="Delhi";
-- 3. show all orders with status delivered
select*from orders where order_status="Delivered";
-- 4. find all menu items price >200
select * from menu where price>200.00;
-- 5. count total orders per customer
select c.first_name ,c.last_name ,c.customer_id ,
count(o.order_id)as total_orders from customers c left join orders o 
on c.customer_id=o.customer_id
group by c.customer_id ,c.first_name,c.last_name;
-- 6. top 5 customers by number of orders
select c.first_name ,c.last_name ,c.customer_id ,
count(o.order_id)as total_orders from customers c left join orders o 
on c.customer_id=o.customer_id
group by c.customer_id ,c.first_name,c.last_name 
order by total_orders desc limit 5
;
-- 7. total revenue 
SELECT SUM(m.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN menu m ON oi.item_id = m.item_id
WHERE o.order_status = 'delivered';
-- 8.most ordered food item 
select m.item_name,m.item_id ,sum(oi.quantity)as total_ordered_food_item
from menu m left join order_items oi
on m.item_id=oi.item_id
group by m.item_id , m.item_name
order by total_ordered_food_item desc ;
-- 9. Show all orders with customer name + restaurant name
select c.first_name ,c.last_name,c.customer_id ,r.restaurants_id,r.restaurants_name ,o.order_id
from customers c join orders o on c.customer_id =o.customer_id
join restaurants r on r.restaurants_id=o.restaurants_id
;
-- 10.Restaurant with highest rating
SELECT restaurants_name, rating 
FROM restaurants 
ORDER BY rating DESC 
LIMIT 1;

-- 11. Customers who never placed an order
select c.first_name ,c.last_name,c.customer_id from customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- 12. Highest spending customer
select c.first_name ,c.last_name,c.customer_id ,sum(m.price*oi.quantity) as total_bill
from customers c join orders o on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id
join menu m on oi.item_id=m.item_id
group by  c.first_name ,c.last_name,c.customer_id
order by total_bill desc limit 1;

-- 13. Monthly revenue trend
SELECT 
DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(m.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN menu m ON oi.item_id = m.item_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month
;




