-- Crear el schema personalizado
CREATE SCHEMA IF NOT EXISTS "proyecto_final_2";

-- Dar permisos
GRANT USAGE ON SCHEMA "proyecto_final_2" TO anon, authenticated, service_role;
ALTER ROLE authenticator SET search_path TO public, "proyecto_final_2";

-- Crear las tablas
CREATE TABLE "proyecto_final_2".authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50)
);

CREATE TABLE "proyecto_final_2".categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE "proyecto_final_2".books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL REFERENCES "proyecto_final_2".authors(author_id),
    category_id INT NOT NULL REFERENCES "proyecto_final_2".categories(category_id),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0
);

CREATE TABLE "proyecto_final_2".customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE "proyecto_final_2".orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES "proyecto_final_2".customers(customer_id),
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL
);

CREATE TABLE "proyecto_final_2".order_details (
    detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES "proyecto_final_2".orders(order_id),
    book_id INT NOT NULL REFERENCES "proyecto_final_2".books(book_id),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);
