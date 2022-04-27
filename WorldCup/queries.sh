#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
x=$($PSQL "SELECT SUM(winner_goals) FROM games;")
echo $x
echo -e "\nTotal number of goals in all games from both teams combined:"
echo $($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games;")

echo -e "\nAverage number of goals in all games from the winning teams:"
echo $($PSQL "SELECT AVG(winner_goals) from games;")

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo $($PSQL "SELECT ROUND(AVG(winner_goals), 2) from games;")

echo -e "\nAverage number of goals in all games from both teams:"
echo $($PSQL "SELECT AVG(winner_goals + opponent_goals) from games;")

echo -e "\nMost goals scored in a single game by one team:"
echo $($PSQL "SELECT MAX(winner_goals) from games;")

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo $($PSQL "SELECT COUNT(*) from games where winner_goals > 2;")

echo -e "\nWinner of the 2018 tournament team name:"
echo $($PSQL "SELECT name from teams JOIN games ON teams.team_id=games.winner_id and year= 2018 and round = 'Final';")

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo $($PSQL "select name from teams join games on (teams.team_id=games.winner_id or teams.team_id=games.opponent_id) and year = 2014 and round = 'Eighth-Final' order by name;")

echo -e "\nList of unique winning team names in the whole data set:"
echo $($PSQL "select distinct name from teams join games on teams.team_id = games.winner_id order by name;")

echo -e "\nYear and team name of all the champions:"
echo $($PSQL "select games.year, teams.name from teams join games on round = 'Final' and games.winner_id = teams.team_id;")

echo -e "\nList of teams that start with 'Co':"
echo $($PSQL "select name from teams where name like 'Co%';")
