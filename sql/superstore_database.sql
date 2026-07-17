drop table if exists fact_sales;
drop table if exists dim_customer;
drop table if exists dim_product;
drop table if exists dim_date;

create table dim_customer (
    customer_id    varchar(20) primary key,
    customer_name  varchar(100),
    segment        varchar(50),
    country        varchar(50),
    city           varchar(100),
    state          varchar(50),
    postal_code    varchar(10),
    region         varchar(50)
);

create table dim_product (
    product_id     varchar(20) primary key,
    category       varchar(50),
    sub_category   varchar(50),
    product_name   varchar(255)
);

create table dim_date (
    date           date primary key,
    year           int,
    quarter        int,
    month          int,
    month_name     varchar(20),
    day            int,
    weekday        varchar(20),
    week_of_year   int
);

CREATE TABLE fact_sales (
    row_id         int primary key,
    order_id       varchar(20),
    order_date     int references dim_date(date),
    ship_date      date,
    ship_mode      varchar(50),
    customer_id    varchar(20) references dim_customer(customer_id),
    product_id     varchar(20) references dim_product(product_id),
    sales          numeric(10,2),
    quantity       int,
    discount       numeric(4,2),
    profit         numeric(10,2),
    days_to_ship   int,
    profit_margin  numeric(6,4)
);


-- SELECT 'fact_sales' AS table_name, COUNT(*) FROM fact_sales
-- UNION ALL SELECT 'dim_customer', COUNT(*) FROM dim_customer
-- UNION ALL SELECT 'dim_product', COUNT(*) FROM dim_product
-- UNION ALL SELECT 'dim_date', COUNT(*) FROM dim_date;