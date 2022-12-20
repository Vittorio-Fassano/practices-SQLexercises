CREATE DATABASE bankexercise;

CREATE TABLE states (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(30) NOT NULL
);

CREATE TABLE cities (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(30) NOT NULL,
    "state_id" INTEGER REFERENCES "states"("id")
);

CREATE TABLE customers (
    "id" SERIAL PRIMARY KEY,
    "full_name" VARCHAR(60) NOT NULL,
    "cpf" VARCHAR(11) NOT NULL UNIQUE,
    "email" VARCHAR(60) NOT NULL UNIQUE,
    "password" VARCHAR(20) NOT NULL
);

CREATE TYPE device_type AS ENUM ('landline', 'mobile');

CREATE TABLE customers_phone (
    "id" SERIAL PRIMARY KEY,
    "number" INTEGER NOT NULL,
    "type" device_type,
    "customer_id" INTEGER REFERENCES "customers"("id")
);

CREATE TABLE customers_addresses (
    "id" SERIAL PRIMARY KEY,
    "street" VARCHAR(80) NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" VARCHAR(30) NOT NULL,
    "postal_code" VARCHAR(15) NOT NULL,
    "customer_id" INTEGER REFERENCES "customers"("id"),
    "city_id" INTEGER REFERENCES "cities"("id")
);

CREATE TABLE bank_account (
    "id" SERIAL PRIMARY KEY,
    "agency" VARCHAR(10) NOT NULL,
    "account_number" VARCHAR(20) NOT NULL,
    "open_date" DATE DEFAULT NOW() NOT NULL,
    "close_date" DATE NOT NULL,
    "customer_id" INTEGER REFERENCES "customers"("id")
);

CREATE TYPE transaction_type AS ENUM ('deposit', 'withdraw');

CREATE TABLE transactions (
    "id" SERIAL PRIMARY KEY,
    "amount" INTEGER NOT NULL,
    "time" TIME DEFAULT NOW() NOT NULL,
    "description" TEXT NOT NULL,
    "type" transaction_type,
    "cancelled" BOOLEAN DEFAULT FALSE NOT NULL,
    "bank_account_id" INTEGER REFERENCES "bank_account"("id")
);

CREATE TABLE credit_cards (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(30) NOT NULL,
    "password" TEXT NOT NULL,
    "security_code" VARCHAR(3) NOT NULL,
    "expiration_month" VARCHAR(2) NOT NULL,
    "expiration_year" VARCHAR(4) NOT NULL,
    "limit" INTEGER NOT NULL,
    "bank_account_id" INTEGER REFERENCES "bank_account"("id")
);