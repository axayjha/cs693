echo -n "Enter a number: "
read num

summ=0

while [ "$num" -ne "0" ];
do
	i="$(($num % 10))";
	num="$(($num/10))";
	summ="$(($summ + $i))";
done
 echo $summ