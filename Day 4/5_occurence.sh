echo -n "Enter a string: "
read str 
echo -n "Enter a char: "
read chr 

echo "$str" | grep -o "$chr" | wc -l