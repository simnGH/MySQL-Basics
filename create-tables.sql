USE ecommerce;
CREATE TABLE products
(
    product_id      INT NOT NULL AUTO_INCREMENT,
    title           VARCHAR(100) NOT NULL,
    sku             CHAR(8) NOT NULL,
    price           DECIMAL(9,4) NOT NULL,

    PRIMARY KEY     (product_id)
);

CREATE TABLE customers
(
    customer_id     INT NOT NULL AUTO_INCREMENT,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL,
    phone           CHAR(11) NOT NULL,

    PRIMARY KEY     (customer_id)
);

CREATE TABLE orders
(
    order_id        INT NOT NULL AUTO_INCREMENT,
    date_placed     TIMESTAMP NOT NULL,
    current_state   TINYINT NOT NULL,
    customer_id     INT NOT NULL,

    PRIMARY KEY     (order_id),
    FOREIGN KEY     (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_lines
(
    line_id         INT NOT NULL AUTO_INCREMENT,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL,
    order_id        INT NOT NULL,

    PRIMARY KEY     (line_id),
    FOREIGN KEY     (order_id) REFERENCES orders(order_id),
    FOREIGN KEY     (product_id) REFERENCES products(product_id)
);