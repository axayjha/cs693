yr=$1

if  [ "$(($yr % 100))" -ne "0" ] && [ "$(($yr % 4))" -eq "0" ]  || [ "$(($yr % 400))" -eq "0" ]
then
	echo "leap yr"
else
	echo "nope"
fi
   
