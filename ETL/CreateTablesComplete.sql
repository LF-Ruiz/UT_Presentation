-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/HLvxML
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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
    "ranking" INT   NOT NULL,
    "year" INT   NOT NULL
);

CREATE TABLE "nfl_colleges" (
    "player_id" SERIAL   NOT NULL,
    "i_id" INT   NOT NULL
);

CREATE TABLE "nfl_player" (
    "player_id" Serial   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_nfl_player" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "nfl_draft" (
    "player_id" INT   NOT NULL,
    "pick" INT   NOT NULL,
    "round" INT   NOT NULL
);

CREATE TABLE "ncaa_conferences" (
    "i_id" INT   NOT NULL,
    "c_id" SERIAL   NOT NULL,
    "c_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_ncaa_conferences" PRIMARY KEY (
        "c_id"
     )
);

ALTER TABLE "loc" ADD CONSTRAINT "fk_loc_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

ALTER TABLE "ranking" ADD CONSTRAINT "fk_ranking_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

ALTER TABLE "nfl_colleges" ADD CONSTRAINT "fk_nfl_colleges_player_id" FOREIGN KEY("player_id")
REFERENCES "nfl_player" ("player_id");

ALTER TABLE "nfl_colleges" ADD CONSTRAINT "fk_nfl_colleges_i_id" FOREIGN KEY("i_id")
REFERENCES "ncaa_conferences" ("i_id");

ALTER TABLE "nfl_draft" ADD CONSTRAINT "fk_nfl_draft_player_id" FOREIGN KEY("player_id")
REFERENCES "nfl_player" ("player_id");

ALTER TABLE "ncaa_conferences" ADD CONSTRAINT "fk_ncaa_conferences_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

