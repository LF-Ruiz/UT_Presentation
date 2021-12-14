-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/HLvxML
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS loc, ranking;
DROP TABLE IF EXISTS universities;
 


CREATE TABLE "universities" (
    "id" Serial   NOT NULL,
    "institution" VARCHAR   NOT NULL,
    CONSTRAINT "pk_universities" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "loc" (
    "i_id" INT   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "zip" VARCHAR   NOT NULL
);

CREATE TABLE "ranking" (
    "i_id" INT   NOT NULL,
    "wranking" INT   NULL,
	"nranking" INT	NULL,
    "year" INT   NOT NULL
);

ALTER TABLE "loc" ADD CONSTRAINT "fk_loc_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

ALTER TABLE "ranking" ADD CONSTRAINT "fk_ranking_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");


