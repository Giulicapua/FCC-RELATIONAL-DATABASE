#!/bin/bash

if [ "$1" = "test" ]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# helper para conseguir team_id (crea si no existe)
fetch_team_id() {
  TEAM_NAME="$1"
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")

  if [ -z "$TEAM_ID" ]; then
    $PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')" > /dev/null
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  fi

  printf "%s\n" "$TEAM_ID"
}

# cargar equipos unicos
cut -d',' -f3,4 games.csv | tail -n +2 | tr ',' '\n' | sort -u | while read -r TEAM; do
  fetch_team_id "$TEAM" >/dev/null
done

# cargar partidos
tail -n +2 games.csv | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
  WINNER_ID=$(fetch_team_id "$WINNER")
  OPPONENT_ID=$(fetch_team_id "$OPPONENT")

  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) \
         VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)" >/dev/null
done
