CREATE DATABASE IF NOT EXISTS lab_3;
USE lab_3;

CREATE TABLE Attraction (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NULL,
    priority_pass bool NULL,
    max_amount_of_visitors int NOT NULL,
    dysney_park_id int NOT NULL,
    CONSTRAINT Attraction_pk PRIMARY KEY (id,dysney_park_id)
);

-- Table: Show
CREATE TABLE `Show` (
    name varchar(100) NULL,
    id int NOT NULL AUTO_INCREMENT,
    date date NOT NULL,
    max_amount_of_visitors int NOT NULL,
    dysney_park_id int NOT NULL,
    CONSTRAINT Show_pk PRIMARY KEY (id,dysney_park_id)
);

-- Table: customer
CREATE TABLE customer (
    id int NOT NULL AUTO_INCREMENT,
    fisrst_name varchar(50) NOT NULL,
    second_name varchar(50) NOT NULL,
    birthday date NULL,
    CONSTRAINT customer_pk PRIMARY KEY (id)
);

-- Table: dysney_park
CREATE TABLE dysney_park (
    id int NOT NULL AUTO_INCREMENT,
    city varchar(50) NOT NULL,
    street varchar(125) NOT NULL,
    max_amount_of_visitors int NULL,
    CONSTRAINT dysney_park_pk PRIMARY KEY (id)
);

-- Table: employee
CREATE TABLE employee (
    id int NOT NULL AUTO_INCREMENT,
    first_name varchar(50) NOT NULL,
    second_name varchar(50) NOT NULL,
    type_of_job char(50) NOT NULL,
    Attraction_id int NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (id)
);

-- Table: tickets
CREATE TABLE tickets (
    id int NOT NULL AUTO_INCREMENT,
    price decimal(6,2) NOT NULL,
    priority_pass bool NOT NULL,
    use_date date NOT NULL,
    dysney_park_id int NOT NULL,
    customer_id int NOT NULL,
    CONSTRAINT tickets_pk PRIMARY KEY (id,dysney_park_id,customer_id)
);

SELECT dysney_park.max_amount_of_visitors
FROM dysney_park

LEFT JOIN tickets ON dysney_park = tickets.dysney_park_id
GROUP BY tickets.use_date 

HAVING COUNT(tickets.id) <= dysney_park.max_amount_of_visitors;

-- foreign keys
-- Reference: Attraction_dysney_park (table: Attraction)
ALTER TABLE Attraction ADD CONSTRAINT Attraction_dysney_park FOREIGN KEY Attraction_dysney_park (dysney_park_id)
    REFERENCES dysney_park (id);

-- Reference: Show_dysney_park (table: Show)
ALTER TABLE `Show` ADD CONSTRAINT Show_dysney_park FOREIGN KEY Show_dysney_park (dysney_park_id)
    REFERENCES dysney_park (id);

-- Reference: employee_Attraction (table: employee)
ALTER TABLE employee ADD CONSTRAINT employee_Attraction FOREIGN KEY employee_Attraction (Attraction_id)
    REFERENCES Attraction (id);

-- Reference: tickets_customer (table: tickets)
ALTER TABLE tickets ADD CONSTRAINT tickets_customer FOREIGN KEY tickets_customer (customer_id)
    REFERENCES customer (id);

-- Reference: tickets_dysney_park (table: tickets)
ALTER TABLE tickets ADD CONSTRAINT tickets_dysney_park FOREIGN KEY tickets_dysney_park (dysney_park_id)
    REFERENCES dysney_park (id);

-- End of file.

