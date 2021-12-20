-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/HLvxML
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS loc,ranking;
DROP TABLE IF EXISTS nfl_draft;
DROP TABLE IF EXISTS ncaa_conferences;
DROP TABLE IF EXISTS ncaa_teams;
DROP TABLE IF EXISTS nba_draft;
DROP TABLE IF EXISTS nba_player;
DROP TABLE IF EXISTS nfl_player;
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
    "wranking" INT   NOT NULL,
	"nranking" INT   NOT NULL,
    "year" INT   NOT NULL
);

CREATE TABLE "nfl_player" (
    "player_id" Serial   NOT NULL,
    "i_id" INT,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_nfl_player" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "nfl_draft" (
    "player_id" INT   NOT NULL,
    "pick" INT   NOT NULL,
    "round" INT   NOT NULL,
    "year" INT   NOT NULL
);

CREATE TABLE "ncaa_conferences" (
    "c_id" SERIAL   NOT NULL,
    "c_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_ncaa_conferences" PRIMARY KEY (
        "c_id"
     )
);

CREATE TABLE "ncaa_teams" (
    "i_id" INT   NOT NULL,
    "c_id" INT   NOT NULL,
    "t_name" VARCHAR   NOT NULL
);

CREATE TABLE "nba_player" (
    "player_id" Serial   NOT NULL,
    "i_id" INT   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_nba_player" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "nba_draft" (
    "player_id" INT   NOT NULL,
    "pick" INT   NOT NULL,
    "round" INT   NOT NULL,
    "year" INT   NOT NULL
);

ALTER TABLE "loc" ADD CONSTRAINT "fk_loc_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

ALTER TABLE "ranking" ADD CONSTRAINT "fk_ranking_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

ALTER TABLE "nfl_draft" ADD CONSTRAINT "fk_nfl_draft_player_id" FOREIGN KEY("player_id")
REFERENCES "nfl_player" ("player_id");

ALTER TABLE "ncaa_teams" ADD CONSTRAINT "fk_ncaa_teams_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

ALTER TABLE "nba_player" ADD CONSTRAINT "fk_nba_player_i_id" FOREIGN KEY("i_id")
REFERENCES "universities" ("id");

ALTER TABLE "nba_draft" ADD CONSTRAINT "fk_nba_draft_player_id" FOREIGN KEY("player_id")
REFERENCES "nba_player" ("player_id");

