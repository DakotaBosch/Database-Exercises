#! /bin/bash

PSQL="psql -U freecodecamp -d number_guess -t --no-align -q -c"
usrs=( $($PSQL "select usr from scoreboard;"))
secret_number=$(( $RANDOM % 1001 ))

guesses=1
best=0
echo "Enter your username:"
read usr

if [[ "${usrs[@]}" == *"$usr"* ]]
then
	games=( $($PSQL "select games from scoreboard where usr = '$usr';" ))
	best=( $($PSQL "select best from scoreboard where usr = '$usr';"))
	usrt=( $($PSQL "select usr from scoreboard where usr = '$usr';"))
	echo Welcome back, $usrt! You have played $games games, and your best game took $best guesses.
else
	echo Welcome, $usr! It looks like this is your first time here.
	echo  $($PSQL "insert into scoreboard(usr) values('$usr');" )
fi

echo Guess the secret number between 1 and 1000:
read input


while ! [[ "$input" =~ ^[0-9]+$ ]]
do
	echo "That is not an integer, guess again:"
	read input
	((guesses++))
done

while [[ $input != $secret_number ]]
do	
	while [[ $input -lt $secret_number ]]
	do
		echo "It's" higher than that, guess again:
		read input
		while ! [[ "$input" =~ ^[0-9]+$ ]]
		do
			echo "That is not an integer, guess again:"
			read input
			((guesses++))
		done
		((guesses++))
	done

	while [[ $input -gt $secret_number ]]
	do
		echo "It's" lower than that, guess again:
		read input
		while ! [[ "$input" =~ ^[0-9]+$ ]]
		do
			echo "That is not an integer, guess again:"
			read input
			((guesses++))
		done	
		((guesses++))
	done
done

#echo "guesses =" $guesses "best = "$best
#update table
if [[ "guesses" -lt "best" ]] ||  [[ "best" -eq 0 ]]
then
	best=$guesses
fi

echo $($PSQL "update scoreboard set games = '$((games+1))', best = '$best' where usr = '$usr';" )
echo You guessed it in $guesses tries. The secret number was $secret_number. Nice job!


