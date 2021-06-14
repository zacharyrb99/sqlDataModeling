-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e7FBJX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "planets" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "orbit_duration_years" float   NOT NULL,
    "galaxy_id" int   NOT NULL,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "galaxy" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_galaxy" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "moons" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "planet_id" int   NOT NULL,
    CONSTRAINT "pk_moons" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_galaxy_id" FOREIGN KEY("galaxy_id")
REFERENCES "galaxy" ("id");

ALTER TABLE "moons" ADD CONSTRAINT "fk_moons_planet_id" FOREIGN KEY("planet_id")
REFERENCES "planets" ("id");

