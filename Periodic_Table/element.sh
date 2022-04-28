#! /bin/bash

PSQLp="psql -U freecodecamp -d periodic_table -t --no-align -c"

echo "Please provide an element as an argument"
read element

name=( $($PSQLp "select name from elements;") )
symbol=( $($PSQLp "select symbol from elements;") )
anum=( $($PSQLp "select atomic_number from elements;") )

if [[ "$name" == *"$element"* ]]
then
	symbol=( $($PSQLp "select symbol from elements where symbol = '$symbol';") )
	anum_number=( $($PSQLp "select atomic_number from elements where symbol = '$symbol';") )
elif [[ "$anum" == *"$element"* ]]
then
	name=( $($PSQLp "select name from elements where atomic_number = '$anum';") )
	symbol=( $($PSQLp "select symbol from elements where atomic_number = '$anum';") )
elif [[ "$symbol" == *"$element"* ]]
then
	name=( $($PSQLp "select name from elements where symbol = '$symbol';") )
	anum=( $($PSQLp "select atomic_number from elements where symbol = '$symbol';") )
	
else 
	echo "I could not find that element in the database." 
fi


#anum=( $($PSQLp "select atomic_number from elements where name = "$name"; ))

name=( $($PSQLp "select name from elements where atomic_number = '$anum';"))
symbol=( $($PSQLp "select symbol from elements where atomic_number = '$anum';"))
tid=( $($PSQLp "select type_id from properties where atomic_number = '$anum';"))
typ=( $($PSQLp "select type from types where type_id = '$tid';"))
mass=( $($PSQLp "select atomic_mass from properties where atomic_number = '$anum';"))
melt=( $($PSQLp "select melting_point_celsius from properties where atomic_number = '$anum';"))
boil=( $($PSQLp "select boiling_point_celsius from properties where atomic_number = '$anum';"))

echo The element with atomic number "$anum" is "$name" "(""$symbol""). It's a" "$typ", with a mass of "$mass" amu. "$name" has a melting point of "$melt" celsius and a boiling point of "$boil" celsius.
