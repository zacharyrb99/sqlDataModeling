-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e7FBJX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "region" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "user" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "preferred_region" int   NOT NULL,
    CONSTRAINT "pk_user" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "posts" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "user" int   NOT NULL,
    "location" text   NOT NULL,
    "region" int   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "categories" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "post_id" int   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "user" ADD CONSTRAINT "fk_user_preferred_region" FOREIGN KEY("preferred_region")
REFERENCES "region" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_user" FOREIGN KEY("user")
REFERENCES "user" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_region" FOREIGN KEY("region")
REFERENCES "region" ("id");

ALTER TABLE "categories" ADD CONSTRAINT "fk_categories_post_id" FOREIGN KEY("post_id")
REFERENCES "posts" ("id");

