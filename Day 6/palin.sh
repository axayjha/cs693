read a;
b=""
for (( i=0; i<${#a}; i++ ));
do
	b="${a:$i:1}$b" ;
done

[ "$a" = "$b" ] && echo "palindrome" || echo "not a palindrome";
