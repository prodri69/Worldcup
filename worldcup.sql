psql --username=freecodecamp --dbname=postgres
CREATE DATABASE worldcup
\c worldcup
    #create table teams
CREATE TABLE teams(
  team_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL);
   #create table games
CREATE TABLE games (
    game_id SERIAL PRIMARY KEY NOT NULL,
    year INT NOT NULL,
    round VARCHAR(30) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL
);
  #create a foreign key for winner_id
ALTER TABLE games
ADD FOREIGN KEY (winner_id) REFERENCES teams(team_id);
  #create a foreign key for opponents_id
ALTER TABLE games
ADD FOREIGN KEY (opponent_id) REFERENCES teams(team_id);


