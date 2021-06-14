-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e7FBJX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "songs" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "producer_id" int   NOT NULL,
    "artist_id" int   NOT NULL,
    "duration" int   NOT NULL,
    "release" date   NOT NULL,
    CONSTRAINT "pk_songs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "singers" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_singers" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "producer" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_producer" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "songs" ADD CONSTRAINT "fk_songs_producer_id" FOREIGN KEY("producer_id")
REFERENCES "producer" ("id");

ALTER TABLE "songs" ADD CONSTRAINT "fk_songs_artist_id" FOREIGN KEY("artist_id")
REFERENCES "singers" ("id");

