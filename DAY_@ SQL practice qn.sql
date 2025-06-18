--Create tables

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    salary DECIMAL(10,2),
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    region VARCHAR(50) NOT NULL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    log_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    message VARCHAR(255) NOT NULL,
    log_year INT NOT NULL
);


CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2),
);

create Table student(
name varchar(50),
address varchar(50),
gender varchar(5),) 

INSERT INTO student VALUES
('sujata','ktm', 'F'),
('safal', 'PKR', 'M'),
('namru', 'USA', 'F'),
('sujata','ktm', 'F'),
('namru','USA', 'F');

select * from student