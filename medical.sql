-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e7FBJX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "doctors" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "specialty" text   NOT NULL,
    CONSTRAINT "pk_doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "patients" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "birthday" date   NOT NULL,
    CONSTRAINT "pk_patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "diseases" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "visits" (
    "id" serial   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "visit_date" date   NOT NULL,
    CONSTRAINT "pk_visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "diagnosis" (
    "id" serial   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    CONSTRAINT "pk_diagnosis" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "visits" ADD CONSTRAINT "fk_visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "doctors" ("id");

ALTER TABLE "visits" ADD CONSTRAINT "fk_visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patients" ("id");

ALTER TABLE "diagnosis" ADD CONSTRAINT "fk_diagnosis_visit_id" FOREIGN KEY("visit_id")
REFERENCES "visits" ("id");

ALTER TABLE "diagnosis" ADD CONSTRAINT "fk_diagnosis_disease_id" FOREIGN KEY("disease_id")
REFERENCES "diseases" ("id");

