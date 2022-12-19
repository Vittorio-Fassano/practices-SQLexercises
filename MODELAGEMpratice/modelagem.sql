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
