CREATE DATABASE superstore

CREATE Table custumer(
    custumer_id VARCHAR(20) PRIMARY KEY
    custumer_name VARCHAR(100)
    sement VARCHAR(50)
    country VARCHAR(50)
    region VARCHAR(50)
)

CREATE Table products(
    product_id VARCHAR(20) PRIMARY KEY
    category VARCHAR(50)
    sub_category VARCHAR(50)
    product_name VARCHAR(50)
)

create Table orders(
    orders_id VARCHAR(50) PRIMARY KEY
    oreder_date DATE
    ship_date DATE
    adresa VARCHAR(50)
    city VARCHAR(50)
    quantity INT
    discount DECIMAL(10, 2)
    profit DECIMAL (10, 2)
    Foreign Key (custumer_id) REFERENCES (custumer_id)
    Foreign Key (product_id) REFERENCES (product_id)
)