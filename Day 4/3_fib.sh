echo -n "Enter a number: "
read n
n1=0;
n2=1;


for (( i=0; i < $n; i++))
do
	temp="$(($n1 + $n2))";
	n1=$n2;
	n2=$temp;
	
	echo $n1;
done
