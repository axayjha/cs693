echo -n "Enter a string: ";
read str;
[ "$str" = "` echo "$str"|rev `" ] && echo "palindrome" || echo "not a palindrom";