CREATE DATABASE modelagemcurso;

CREATE TABLE "students"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "cpf" VARCHAR(11) NOT NULL UNIQUE,
    "email" VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE "class_code"(
    "id" SERIAL PRIMARY KEY,
    "code" TEXT NOT NULL
);

CREATE TABLE "class"(
    "id" SERIAL PRIMARY KEY,
    "students_id" INTEGER REFERENCES "students"("id"),
    "class_code_id" INTEGER REFERENCES "class_code"("id"),
    "start" DATE DEFAULT NOW() NOT NULL,
    "end" DATE DEFAULT NULL
);

CREATE TABLE "modules"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT DEFAULT NULL
);

CREATE TABLE "projects"(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT DEFAULT NULL,
    "modules_id" INTEGER REFERENCES "modules"("id")
);

CREATE TYPE "grade_types" AS ENUM (
    'Abaixo das expectativas',
    'Dentro das Expectativas',
    'Acima das Expectativas'
);

CREATE TABLE "projects_students"(
    "id" SERIAL PRIMARY KEY,
    "date" DATE DEFAULT NOW() NOT NULL,
    "grade" grade_types NOT NULL,
    "students_id" INTEGER REFERENCES "students"("id"),
    "projects_id" INTEGER REFERENCES "projects"("id")
);