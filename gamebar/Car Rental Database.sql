CREATE DATABASE car_rental;

USE car_rental;

CREATE TABLE categories(
	id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL,
    daily_rate DOUBLE(3,2),
    weekly_rate DOUBLE(3,2),
    monthly_rate DOUBLE(3,2),
    weekend_rate DOUBLE(3,2)
);

CREATE TABLE cars(
	id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    plate_number INT,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL,
    car_year YEAR,
    category_id INT,
    doors INT,
    picture TEXT,
    car_condition VARCHAR(40),
    available BOOLEAN
);

CREATE TABLE employees (
	id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    title VARCHAR(20) NOT NULL,
    notes TEXT
);

CREATE TABLE customers (
	id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    driver_licence_number BIGINT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(40) NOT NULL,
    zip_code INT,
    notes TEXT
);

CREATE TABLE rental_orders (
	id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    employee_id INT,
    customer_id INT,
    car_id INT,
    car_condition VARCHAR(40),
    tank_level DOUBLE(10,2),
    kilometrage_start DOUBLE(10,2),
    kilometrage_end DOUBLE(10,2),
    total_kilometrage DOUBLE(10,2),
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied DOUBLE(10,2),
    tax_rate DOUBLE(10, 2),
    order_status VARCHAR(20),
    notes TEXT
);

INSERT INTO cars(plate_number, make, model, car_year, doors, picture, car_condition, available) VALUES
(1234, 'Germany', 'BMW', 2004, 4, 'pic', 'good', false),
(12345, 'Germany', 'Mercedes', 2011, 4, 'pic', 'great', true),
(123445, 'Italy', 'Lamborghini', 2023, 2, 'pic', 'really great', true);

INSERT INTO categories(category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES
('Sports car', 7.2, 5.5, 5.3, 6.3),
('Coupe', 7.4, 5.4, 5.4, 6.4),
('Luxury', 7.5, 5.6, 5.6, 6.7);

INSERT INTO employees(first_name, last_name, title, notes) VALUES
('Sergey', 'Soprunov', 'SEO', 'Some notes'),
('Ivan', 'Ivanov', 'Programmer', 'Note.....'),
('Olga', 'Razumovska', 'Teacher', 'There is some notes here written');

INSERT INTO customers(driver_licence_number, full_name, address, city, zip_code) VALUES
(47431234, 'Sergey Igorevich Soprunov', 'Any street', 'Burgas', 8123),
(43544754, 'Ivan Ivanovich Ivanov', 'Elms str.', 'Florida', 0321),
(31243234, 'Olga Mihailovna Razumovska', 'street', 'Sofia', 3245);

INSERT INTO rental_orders(employee_id, customer_id, car_id, car_condition, tank_level, 
kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days,
rate_applied, tax_rate, order_status) VALUES
(1, 1, 2, 'good', 5.54, 19.23, 43.2, 130, '2003-03-02', '2003-03-04', 2, 7.2, 10.3, 'good'),
(2, 2, 3, 'great', 4.54, 13.23, 123.2, 130, '2013-04-05', '2013-04-05', 1, 3.2, 13.3, 'great'),
(3, 3, 1, 'bad', 1.54, 4.23, 13.2, 110, '2023-01-04', '2023-01-04', 1, 1.2, 1.3, 'bad');



