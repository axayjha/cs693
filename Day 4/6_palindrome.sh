echo -n "Enter a number: "
read num
numrev=$( echo $num|rev )

if [ "$num" -eq "$numrev" ]
then
	echo "palindrome";
else
	echo "not a palindrom";

fi