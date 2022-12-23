CREATE DATABASE modelagemlocadora;

CREATE TABLE "phones"(
    "id" SERIAL PRIMARY KEY,
    "number" TEXT NOT NULL
);

CREATE TABLE "states"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "categories"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "countries"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "cities"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "state_id" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "adresses"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" TEXT NOT NULL,
    "city_id" INTEGER NOT NULL REFERENCES "cities"("id"),
    "postal_code" TEXT NOT NULL
);

CREATE TABLE "customers"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "adress_id" INTEGER NOT NULL REFERENCES "adresses"("id")
);

CREATE TABLE "customers_phones"(
    "id" SERIAL PRIMARY KEY,
    "customer_id" INTEGER NOT NULL REFERENCES "customers"("id"),
    "phone_id" INTEGER NOT NULL REFERENCES "phones"("id")
);

CREATE TABLE "rentals"(
    "id" SERIAL PRIMARY KEY,
    "customer_id" INTEGER NOT NULL REFERENCES "customers"("id"),
    "rental_date" DATE DEFAULT NOW() NOT NULL,
    "return_date" DATE DEFAULT NULL,
    "rental_rating" INTEGER NOT NULL
);

CREATE TABLE "movies"(
    "id" SERIAL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "category_id" INTEGER NOT NULL REFERENCES "categories"("id")
);

CREATE TABLE "dvds"(
    "id" SERIAL PRIMARY KEY,
    "code" INTEGER NOT NULL,
    "bar_code" TEXT NOT NULL,
    "movie_id" INTEGER NOT NULL REFERENCES "movies"("id")
);

CREATE TABLE "dvds_rental"(
    "id" SERIAL PRIMARY KEY,
    "movie_rating" INTEGER NOT NULL,
    "dvd_id" INTEGER NOT NULL REFERENCES "dvds"("id"),
    "rental_id" INTEGER NOT NULL REFERENCES "rentals"("id")
);

CREATE TABLE "actors"(
    "id" SERIAL PRIMARY KEY,
    "name" INTEGER NOT NULL,
    "birthday" DATE NOT NULL,
    "country_id" INTEGER NOT NULL REFERENCES "countries"("id")
);

CREATE TABLE "actors_movies"(
    "id" SERIAL PRIMARY KEY,
    "actor_id" INTEGER NOT NULL REFERENCES "actors"("id"),
    "movie_id" INTEGER NOT NULL REFERENCES "movies"("id")
);