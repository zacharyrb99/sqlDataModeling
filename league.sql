-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e7FBJX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "teams" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "team" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" serial   NOT NULL,
    "player_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "game_id" int   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "games" (
    "id" serial   NOT NULL,
    "team1_id" int   NOT NULL,
    "team2_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    "referee" int   NOT NULL,
    CONSTRAINT "pk_games" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "season" (
    "id" serial   NOT NULL,
    "start" date   NOT NULL,
    "end" date   NOT NULL,
    CONSTRAINT "pk_season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "results" (
    "id" serial   NOT NULL,
    "team_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    "result" text   NOT NULL,
    CONSTRAINT "pk_results" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_game_id" FOREIGN KEY("game_id")
REFERENCES "games" ("id");

ALTER TABLE "referees" ADD CONSTRAINT "fk_referees_game_id" FOREIGN KEY("game_id")
REFERENCES "games" ("id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_team1_id" FOREIGN KEY("team1_id")
REFERENCES "teams" ("id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_team2_id" FOREIGN KEY("team2_id")
REFERENCES "teams" ("id");

ALTER TABLE "season" ADD CONSTRAINT "fk_season_id" FOREIGN KEY("id")
REFERENCES "games" ("season_id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_game_id" FOREIGN KEY("game_id")
REFERENCES "games" ("id");

