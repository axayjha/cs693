if [ $# -lt 3 ];
then
	echo "insufficient params";
	exit;
fi	

n=$1

if ! [[ $n =~ ^-?[a-fA-F0-9]+$ ]];
then
	echo "invalid number!";
	exit;
fi

ib=$2

if ! [[ $ib =~ ^-?[0-9]+$ ]];
then
	echo "invalid input base";
	exit;
fi

ob=$3
if ! [[ $ob =~ ^-?[0-9]+$ ]];
then
	echo "invalid output base";
	exit;
fi

n="` echo $n | tr [:lower:] [:upper:] `"

if [ $ib -lt 2 ] || [ $ib -gt 16 ]; 
then
	echo "input base out of bounds";
	exit;
fi

if [ $ob -lt 2 ] || [ $ob -gt 16 ]; 
then
	echo "output base out of bounds";
	exit;
fi
	
for (( i=0; i<${#n}; i++ ));
do
	dig="${n:$i:1}";	
	
	if [[ $dig =~ ^-?[a-fA-F0-9]+$ ]] 2> /dev/null;
	then
		dig="obase=10; ibase=$ib; "$dig"";
		dig="` echo $dig| bc `"
		if [ $dig -gt $ib ] 2> /dev/null;
		then
			echo "a digit in the number is greater than input base ";
			exit;
		fi	
	fi
done


a="obase="$ob"; ibase="$ib"; $n"
echo $a|bc	

	
