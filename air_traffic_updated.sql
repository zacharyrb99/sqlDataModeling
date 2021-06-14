-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e7FBJX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "tickets" (
    "id" serial   NOT NULL,
    "passenger_id" text   NOT NULL,
    "seat" int   NOT NULL,
    CONSTRAINT "pk_tickets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "flights" (
    "id" serial   NOT NULL,
    "ticket_id" int   NOT NULL,
    "departure" date   NOT NULL,
    "arrival" date   NOT NULL,
    "from_city" text   NOT NULL,
    "from_country" text   NOT NULL,
    "to_city" text   NOT NULL,
    "to_country" text   NOT NULL,
    CONSTRAINT "pk_flights" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "passengers" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_passengers" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_passenger_id" FOREIGN KEY("passenger_id")
REFERENCES "passengers" ("id");

ALTER TABLE "flights" ADD CONSTRAINT "fk_flights_ticket_id" FOREIGN KEY("ticket_id")
REFERENCES "tickets" ("id");

