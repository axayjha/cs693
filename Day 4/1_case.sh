ch=$1
case $ch in 
	'1') ls -la;;
	'2') echo "hello";;
	'3') echo "hello" < cat new;;
	*) echo "unknown option";
esac