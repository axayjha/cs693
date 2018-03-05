echo -n "Enter a number: "
read n
flag="prime"
for (( i=2; i < $n; i++))
do
	if [ "$(($n % i))" -eq "0" ]
		then
		flag="not prime";
		break;
	fi

done

echo $flag;