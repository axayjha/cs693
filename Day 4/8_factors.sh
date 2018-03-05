echo -n "Enter a number: "
read num
echo -n "Factors: "
for (( i=1; i <= $num; i++))
do
	if [ "$(($num % i))" -eq "0" ]
		then
		echo -n $i " ";
	fi

done
echo