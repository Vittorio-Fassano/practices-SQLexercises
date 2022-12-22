CREATE DATABASE modelagemagencia;

CREATE TABLE "airports_code"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "airports" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "airports_code_id" INTEGER REFERENCES "airports_code"("id")
);

CREATE TABLE "flights_code" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "flights" (
    "id" SERIAL PRIMARY KEY,
    "flights_code_id" INTEGER REFERENCES "flights_code"("id"),
    "departure_airport" INTEGER REFERENCES "airports"("id"),
    "arrival_airport" INTEGER REFERENCES "airports"("id"),
    "departure_time" TIME NOT NULL,
    "arrival_time" TIME NOT NULL
);

CREATE TABLE "airlines_code" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "airlines" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "airlines_code_id" INTEGER REFERENCES "airlines_code"("id"),
    "flights_id" INTEGER REFERENCES "flights"("id")
);