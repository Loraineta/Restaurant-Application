-- Create the Restaurants table
CREATE TABLE Restaurants (
    restaurant_id INT NOT NULL PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    address VARCHAR(100),
	phone_number VARCHAR(20),
    website VARCHAR(100),
    email VARCHAR (100)
); 

-- Create the Menus table
CREATE TABLE Menus (
    menu_id INT NOT NULL PRIMARY KEY,
    menu_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    dietary_info VARCHAR(100),
    restaurant_id INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT NOT NULL PRIMARY KEY,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    restaurant_id INT NOT NULL,
    menu_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (menu_id) REFERENCES Menus(menu_id)
   );
   
   -- Create the Customers table
CREATE TABLE Customers (
    customer_id INT NOT NULL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(100),
    email VARCHAR(100),
    loyalty_info VARCHAR(100)
);

   -- Add foreign key to order table --
ALTER TABLE orders
ADD FOREIGN KEY(customer_id) REFERENCES Customers(customer_id);

-- Create the Reviews table
CREATE TABLE Reviews (
    review_id INT NOT NULL PRIMARY KEY,
    review_date DATE NOT NULL,
    review_rating INT NOT NULL,
    review_comment TEXT,
    restaurant_id INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- altering review table --
SELECT * FROM reviews;

ALTER TABLE reviews 
ADD customer_id INT NOT NULL;

ALTER TABLE reviews
ADD CONSTRAINT FK_customer_id
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- alter menus table --

ALTER TABLE menus
DROP COLUMN dietary_info;

-- alter resturant table --

ALTER TABLE restaurants
DROP COLUMN address; 

ALTER TABLE restaurants
DROP COLUMN website;


 
-- insert info into database ---

INSERT INTO Restaurants (restaurant_id, restaurant_name, phone_number, email)
VALUES 
    (1, 'Dishoom', '+44 20 7420 9320', 'hello@dishoom.com'),
    (2, 'Hoppers', '+44 20 3319 8110', 'info@hopperslondon.com'),
    (3, 'Padella', '+44 20 7407 8555', 'info@padella.co'),
    (4, 'Brigadiers', '+44 20 3319 8140', 'info@brigadierslondon.com'),
    (5, 'Sabor', '+44 20 3319 8130', 'reservations@saborrestaurants.co.uk'),
    (6, 'Bao', '+44 20 3019 2200', 'info@baolondon.com'),
    (7, 'Flat Iron', '+44 20 3862 8210', ''),
    (8, 'Duck & Waffle', '+44 20 3640 7310', ''),
    (9, 'The Wolseley', '+44 20 7499 6996', 'info@thewolseley.com'),
    (10, 'The Ledbury', '+44 20 7792 9090', 'info@theledbury.com'),
    (11, 'Hakkasan Hanway Place', '+44 20 7927 7000', ''),
    (12, 'Din Tai Fung', '+44 20 3908 9099', 'info@dintaifung-uk.com'),
    (13, 'The Palomar', '+44 20 7439 8777', ''),
    (14, 'Ikoyi', '+44 20 3583 4660', 'info@ikoyilondon.com'),
    (15, 'Cafe Spice Namaste', '+44 20 7488 9242', 'info@cafespice.co.uk'),
    (16, 'Casa do Frango', '+44 20 3879 9252', ''),
    (17, 'Kyms Chinese', '+44 20 7220 7088', ''),
    (18, 'St. John Bread and Wine',  '+44 20 3301 8069', ''),
    (19, 'The River Cafe', '+44 20 7386 4200', ''),
    (20, 'Kervan Sofrasi', '+44 20 8888 1422', '');
    
    INSERT INTO Menus (menu_id, restaurant_id, menu_name, description, price)
VALUES
    (1, 1, 'Jackfruit Biryani', 'Sturdy, savoury jackfruit and delicately saffron’d rice', 15.50),
    (2, 1, 'Dishoom Chicken Tikka', 'Laced with ginger, turmeric, garlic and green chilli.', 11.90),
    (3, 1, 'Spicy Lamb Chops', 'Two chops of generous proportions Lie overnight in a special marinade of lime juice', 17.50),
    (4, 2, 'Lamb Kothu Roti', ' jumble of shredded Gothamba roti, meat and vegetables and Jaffna curry powder', 15),
    (5, 2, 'Pumpkin and Spinach Kari', 'Sri-Lankin curry made with explsoive flavour', 10),
    (6, 3, 'Chicken Fettucine', 'spicy fettucine accompanied with liver,sage and marsala', 13),
    (7, 3, 'Bruschetta', 'tasty starter topped with black iberiko tomatoes and wild oregano', 8.50),
    (8, 4, 'BBQ butter chicken wings', 'spicy, hot wings topped with coriander and cheese ', 12.50),
    (9, 4, 'Goat Tikki Bun Kebabs ', 'spiced tenderized minced goat meat, fragant and filled with flavour', 14),
    (10, 5, 'Segovian suckling pig', 'roasted in speciality oven to create glaze,served with rice', 12.99),
    (11, 5, 'Kung Pao Chicken', 'Spicy Sichuan-style chicken stir-fried with peanuts and vegetables served with steamed rice', 11.99),
    (12, 6, 'Confit Pork', 'Tender seasoned pork served with roast potatoes ', 13.99),
    (13, 6, 'Roast Beef', 'Slow-roasted beef served with roast potatoes, and gravy', 11.99),
    (14, 7, 'Steak', 'flat iron steak to your liking', 13),
    (15, 7, 'Smoked Chilli Cheesburger', 'using flat iron herd beef seved with thin cut chips ', 13),
    (16, 8, 'Smoked Salmon', 'In combination with smoked fennel,yoghurt and orange dressing', 14),
    (17, 8, 'Duck and Waffle', 'crispy leg confit,fried duck egg and mustard maple syrup', 24),
    (18, 9, 'Smoked Haddock Kedgeree', 'cooked flaked fish and boiled rice,served with a poached egg', 24.75),
    (19, 9, 'Roast Anjou chicken', 'pommes boulangère and sauce sauternes', 16.99),
    (20, 10, 'Poole Bay mackerel', 'falvoured with blood orange,myoha giner and coriander capers', 26.50),
    (21, 11, 'Peking Duck', 'The award-winning Irish duck produces a tender dish, full of flavour with succulent meat and crispy skin', 48),
    (22, 12, 'Oriental Salad', 'unique chilled appetiser is made with julienne seaweed,beansprouts,tofu and rice vermicelli.', 11.99),
    (23, 13, 'Persian Lemon chicken', 'Flavoursome roast chicken served with pumpkin couscous ', 20),
    (24, 14, 'Dambu Mama', 'longhorn beef and comes atop a delicate tartlet of whipped bone marrow pancake', 27.50),
    (25, 15, 'Parsee Lamb Dhannshaak ', 'lamb cooked with pureed lentils & vegetables. Served with caramelised onion, rice, spiced meat ball and red onion salad', 17),
    (26, 16, 'Piri Piri Chicken', 'Half chicken grilled over wood charcoal,brushed with our secret piri-piri blend', 25),
    (28, 17, 'slow poached Soy chciken', 'authentic flavours of braised chicken smothered in soy and onions', 18.99),
    (29, 18, 'Hake, Wild Garlic and Capers', 'white flaky mild flavoured fish seasoned with garlic', 27.50),
    (30, 19, 'Asparagi', 'English asparagus with anchovy butter & parmesan', 31),
    (31, 20, 'Mixed meat platter', 'beef,chicken and lamb served with rice and salad', 24.99);
    
    INSERT INTO Customers (customer_id, customer_name,phone_number, email, loyalty_info)
VALUES
    (101, 'Leah James', '+44 20 3743 2302', 'leahjames@gmail.com', 'Gold'),
    (102, 'Edward Ford', '+44 20 2345 6789', 'Edward Ford@gmail.com', 'Silver'),
    (103, 'David Lee', '+44 20 3456 7890', 'davidlee@hotmail.co.uk', 'Platinum'),
    (104, 'Sophie Brown', '+44 20 4567 8901', 'sophiebrown@hotmail.co.uk', NULL),
    (105, 'Peter Green',  '+44 20 6789 0123', 'petergreen@gmail.com', 'Gold'),
    (106, 'Emma Brown', '+44 20 1234 5678', 'emmabrown@gmail.com', NULL),
    (107, 'William Femilade', '+44 20 2345 6789', 'williamfemi@hotmail.com', 'Gold'),
    (108, 'Lucy Wilson', '+44 20 3456 7890', 'lucywilson@yahoo.com', 'Silver'),
    (109, 'Oliver Clark', '+44 20 4567 8901', 'oliverclark@gmail.com', NULL),
    (110, 'Ava Perez', '+44 20 6789 0123', 'avaperez@gmail.com', 'Gold'),
    (111, 'Noah Turner', '+44 20 7890 1234', 'noahturner@yahoo.com', 'Platinum'),
    (112, 'Temi Efo', '+44 20 9012 3456', 'temie@yahoo.com', NULL),
    (113, 'James Garcia','+44 20 5478 9780', 'jamesgarcia@hotmail.co.uk', 'Gold'),
    (114, 'Isabella Martin', '+44 20 2345 6789', 'isabellamartin@gmail.com', 'Silver'),
    (115, 'Benjamin Rodriguez', '+44 20 3456 7890', 'benjaminrodriguez@hotmail.co.uk', NULL),
    (116, 'Mia Perez','+44 20 4567 8901', 'miaperez@hotmail.co.uk', 'Gold'),
    (117, 'Daniel Davis', '+44 20 6789 0123', 'danieldavis@yahoo.com', 'Platinum'),
    (118, 'Emily Johnson','+44 20 7890 1234', 'emilyjohnson@hotmail.com', NULL),
    (119, 'Lucas Hernandez', '+44 20 9012 3456', 'lucashernandez@hotmail.com', 'Gold'),
    (120, 'Danai Aielo', '+44 20 1234 5678', 'danaiaielo@gmail.com', 'Silver');

INSERT INTO Orders (order_id, order_date, order_time, total_price, restaurant_id, menu_id, customer_id)
VALUES
(1, '2023-02-20', '12:30:00', 15.50, 1, 1, 101),
(2, '2023-02-22', '19:00:00', 14.00, 4, 9, 102),
(3, '2023-02-22', '20:15:00', 18.99, 17, 28, 103),
(4, '2023-02-26', '13:45:00', 8.50, 3, 1, 102),
(5, '2023-02-27', '18:30:00', 13.00, 7, 14, 112),
(6, '2023-02-28', '12:15:00', 11.90, 1, 2, 104),
(7, '2023-03-01', '19:45:00', 16.99, 9, 19, 105),
(8, '2023-03-02', '14:00:00', 31.00, 19, 30, 106),
(9, '2023-03-02', '20:00:00', 14.00, 8, 16, 117),
(10, '2023-03-02', '12:45:00', 15.00, 2, 4, 108),
(11, '2023-03-02', '19:30:00', 48.00, 11, 21, 109),
(12, '2023-03-02', '14:15:00', 13.00, 7, 15, 110),
(13, '2023-03-03', '20:15:00', 48.00, 11, 21, 111),
(14, '2023-03-04', '12:30:00', 10.00, 2, 5, 112),
(15, '2023-03-07', '19:45:00', 17.00, 15, 25, 107),
(16, '2023-03-07', '13:00:00', 13.99, 6, 12, 103),
(17, '2023-03-07', '20:30:00', 25.00, 16, 26, 114),
(18, '2023-03-11', '14:45:00', 26.50, 10, 20, 105),
(19, '2023-03-11', '19:00:00', 16.99, 9, 19, 116),
(20, '2023-03-13', '12:00:00', 13.00, 3, 6, 119),
(21, '2023-03-14', '20:00:00', 26.50, 10, 20, 116),
(22, '2023-03-14', '19:30:00', 27.50, 14, 24, 105),
(23, '2023-03-14', '20:00:00', 27.50, 18, 29, 111),
(24, '2023-03-16', '12:15:00', 13.00, 3, 6, 119),
(25, '2023-03-16', '13:00:00', 11.99, 5, 11, 110),
(26, '2023-03-16', '18:45:00',48.00, 11, 21, 120),
(27, '2023-03-18', '14:30:00', 24.00, 8, 17, 102),
(28, '2023-03-18', '19:15:00', 48.00, 11, 21, 112),
(29, '2023-03-19', '20:00:00', 25.00, 16, 26, 106),
(30, '2023-03-19', '17:45:00', 12.50, 4, 8, 113),
(41, '2023-03-21', '19:30:00', 13.00, 7, 15, 117);

INSERT INTO Reviews (review_id, review_date,review_rating, review_comment, restaurant_id, customer_id)
VALUES
(1, '2023-02-22', 4, 'Great food and service!', 1, 101),
(2, '2023-02-24',3, 'Decent food, but could be better.', 17, 103),
(3, '2023-03-04', 5, 'Amazing experience! Will definitely come back.', 9, 105),
(4, '2023-03-08',2, 'Disappointing food and slow service.', 15, 107),
(5, '2023-03-03', 4, 'Loved the atmosphere and food.', 11, 109),
(6, '2023-03-05', 5, 'One of the best meals Ive had in London!', 11, 111),
(7, '2023-03-19',3, 'Average food and service, but good value for money.', 4, 113),
(8, '2023-03-12', 4, 'Delicious food and friendly staff.', 9, 116),
(9, '2023-03-21', 2, 'Terrible experience. Food was cold and service was rude.', 7, 117),
(10, '2023-03-13', 5, 'Excellent food and service. Highly recommend!', 3, 119),
(11, '2022-03-20', 3.5, 'The food was decent, but nothing special.', 5, 110),
(12, '2022-03-17', 4.5, 'Excellent food and service. Would definitely recommend!', 11,120 ),
(13, '2022-03-08', 2.5, 'The service was slow and the food was mediocre.', 6,103),
(14, '2022-03-05', 5, 'Amazing food and service!', 2,108),
(15, '2022-03-10', 4, 'Great atmosphere and delicious food.', 15, 107);

Select * FROM restaurants;
select * FROM menus;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM reviews;

-- using join and create view to combine restaurant and menu table to show list of resturants , the dishes they have and price --

CREATE VIEW restaurant_menu_prices
 AS
SELECT restaurants.restaurant_name, menus.menu_name, SUM(Menus.price) AS total_price
FROM Restaurants
INNER JOIN Menus ON restaurants.restaurant_id = menus.restaurant_id
GROUP BY restaurants.restaurant_name, menus.menu_name;

SELECT * FROM restaurant_menu_prices;

-- using stored function to return high rated restaurants ---

DELIMITER //
CREATE FUNCTION high_rate_restaurant(
	review_rating INT 
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE great_rating VARCHAR(20);
    IF review_rating > 4 THEN
		SET great_rating = 'TRUE';
	ELSE 
		SET great_rating = 'FALSE';
	END IF;
    RETURN (great_rating);
END;


SELECT 
	high_rate_restaurant(review_rating) AS 'highly rated',
    restaurants.restaurant_name
FROM reviews
JOIN restaurants
ON reviews.restaurant_id = restaurants.restaurant_id;



-- retrieve total orders for all resturants to see which had most orders --

SELECT restaurant_name, 
    (SELECT COUNT(*) FROM Orders WHERE Orders.restaurant_id = Restaurants.restaurant_id) AS total_orders 
FROM Restaurants
ORDER BY total_orders DESC;


SELECT * FROM restaurant_menu_prices;

SELECT 
	high_rate_restaurant(review_rating) AS 'highly rated',
    restaurants.restaurant_name
FROM reviews
JOIN restaurants
ON reviews.restaurant_id = restaurants.restaurant_id;









