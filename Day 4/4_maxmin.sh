echo -n "Enter the number of elements: "
read n
echo -n "Enter the elements: "
for (( i=0; i < $n; i++))
do
	read arr[$i]
done

max="${arr[0]}"
min="${arr[0]}"

for (( i=0; i < $n; i++))
do
	if [ $max -lt  "${arr[$i]}" ]  
		then
			max="${arr[$i]}"		
	fi
	if [ $min -gt  "${arr[$i]}" ]  
		then
			min="${arr[$i]}"		
	fi
done

echo "Max = " $max
echo "Min = " $min