#!/bin/bash

if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Loop through the CSV file
while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
    if [[ "$OPPONENT" != "opponent" ]]
    then
     team_name1=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER';")
     if [[ -z "$team_name1" ]]; then
      $PSQL "INSERT INTO teams (name) VALUES ('$WINNER');"
     fi
    fi

   if [[ "$WINNER" != "winner" ]]
    then
    team_name2=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT';")
    if [[ -z "$team_name2" ]]; then
      $PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');"
    fi
     team_name1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';");
     team_name2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
      $PSQL "INSERT INTO games(winner_id, opponent_id, winner_goals, opponent_goals, year, round) VALUES ($team_name1, $team_name2, $WINNER_GOALS, $OPPONENT_GOALS, $YEAR, '$ROUND');"

   fi

  #insert year

  #insert round

  #insert winner_id

  #insert opponent_id

  #insert winner_goals

  #insert opponent_goals 
done < games.csv
