CREATE DATABASE ecommercedriven;

/* users (already created)*/
CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "adresses" (
    "id" SERIAL PRIMARY KEY,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "adress_id" INTEGER NOT NULL REFERENCES "adresses"("id")
);

/* products */
CREATE TABLE "sizes" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "categories" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "images" (
    "id" SERIAL PRIMARY KEY,
    "url" TEXT NOT NULL
);

CREATE TABLE "products" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "size_id" INTEGER NOT NULL REFERENCES "sizes"("id"),
    "category_id" INTEGER NOT NULL REFERENCES "categories"("id"),
    "image_id" INTEGER NOT NULL REFERENCES "images"("id")
);

/* orders */
CREATE TABLE "orders_state" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "orders" (
    "id" SERIAL PRIMARY KEY,
    "date" DATE NOT NULL DEFAULT NOW(),
    "user_id" INTEGER NOT NULL REFERENCES "users"("id"),
    "adress_id" INTEGER NOT NULL REFERENCES "adresses"("id"),
    "state_id" INTEGER NOT NULL REFERENCES "orders_state"("id")
);

CREATE TABLE "orders_product" (
    "id" SERIAL PRIMARY KEY,
    "price_product" INTEGER NOT NULL,
    "purchases" INTEGER NOT NULL DEFAULT 0,
    "product_id" INTEGER NOT NULL REFERENCES "products"("id"),
    "order_id" INTEGER NOT NULL REFERENCES "orders"("id")
);