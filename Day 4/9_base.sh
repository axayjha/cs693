echo -n "Enter the number: "
read n
echo -n "Enter input base: "
read ib
echo -n "Enter the output base: "
read ob
[ $ib -le 1 ] && echo "Input base cannot be less than 2" && exit;
[ $ob -le 1 ] && echo "Output base cannot be less than 2" && exit;

for (( i=0; i<${#n}; i++ ));
do
	if [ ${n:$i:1} -ge $ib ];
	then
		echo "Input has a digit greater than base";
		exit;
	fi
done

a="obase="$ob"; ibase="$ib"; $n"
echo $a|bc
