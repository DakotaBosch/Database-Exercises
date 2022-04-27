#! /bin/bash

if [[ $1 == "test" ]]
then
	PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
	PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

#create temp alter
echo $($PSQL "CREATE  TABLE temp(year int, round text, winner text, opponent text, winnerg int, opponentg int);")

#pop temp
echo $($PSQL "\copy temp from  'games.csv' csv header;")

#populate teams
echo $($PSQL "insert into teams(name) SELECT DISTINCT opponent from temp union select distinct winner from temp;") 

#create id columns
echo $($PSQL "ALTER TABLE temp ADD COLUMN wid int, ADD COLUMN oid int;")

#calculate new columns
echo $($PSQL "UPDATE temp SET wid = team_id FROM teams WHERE (teams.name=temp.winner);")
echo $($PSQL "UPDATE temp SET oid = team_id FROM teams WHERE (teams.name=temp.opponent);")

#pop games
echo $($PSQL "insert into games(year, round, winner_id, opponent_id,winner_goals,opponent_goals) select year, round, wid, oid, winnerg, opponentg from temp;")

#delete temp
echo $($PSQL "DROP table temp;")

#useful
#ALTER SEQUENCE <tablename>_<id>_seq RESTART WITH 1
#truncate <tablename> cascade

