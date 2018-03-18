echo -n "Enter the number: "
read n
n=`echo "$n" | tr [:lower:] [:upper:]`

echo -n "Enter input base: "
read ib
ib=`echo "$ib" | tr [:lower:] [:upper:]`
if ! [[ $ib =~ ^-?[0-9]+$ ]];
then
	echo "Input base should be a valid base10 number"
	exit;
fi


echo -n "Enter the output base: "
read ob
ob=`echo "$ob" | tr [:lower:] [:upper:]`
if ! [[ $ob =~ ^-?[0-9]+$ ]];
then
	echo "Output base should be a valid base10 number"
	exit;
fi

if [ $ib -le 1 ] || [ $ib -gt 16 ];
then
	echo "Input base out of bounds";
	exit;
fi
if [ $ob -le 1 ] || [ $ob -gt 16 ];
then
	echo "Output base out of bounds";
	exit;
fi

for (( i=0; i<${#n}; i++ ));
do	
 	dig="${n:$i:1}";
	dig="obase="10"; ibase="$ib"; $dig"
	dig=`echo $dig|bc`
	if [ $dig -ge $ib ];
	then
		echo "Input has a digit greater than base";
		exit;
	fi
done




a="obase="$ob"; ibase="$ib"; $n"
echo $a|bc
