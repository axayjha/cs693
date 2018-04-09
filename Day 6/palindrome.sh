read a && [ "$a" = "` echo "$a"|rev `" ] && echo "palindrome" || echo "not a palindrome";
