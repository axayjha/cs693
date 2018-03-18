#!/bin/bash
#
# Base conversion program
# Akshay
# 18/03/18

echo -n "Enter the number: "
read n
# need to convert the input number to upper case
# as bc only understand upper case chars for
# digits beyond 9
n=`echo "$n" | tr [:lower:] [:upper:]`

echo -n "Enter input base: "
read ib
# making sure input base has no chars
if ! [[ $ib =~ ^-?[0-9]+$ ]];
then
	echo "Input base should be a valid base10 number"
	exit;
fi


echo -n "Enter the output base: "
read ob
# making sure output base has no chars
if ! [[ $ob =~ ^-?[0-9]+$ ]];
then
	echo "Output base should be a valid base10 number"
	exit;
fi

# making sure both bases are in [2, 16]
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

# checking if any digit in the numbers is >= input base
for (( i=0; i<${#n}; i++ ));
do	
	# converting the digit to base10 first
 	dig="${n:$i:1}";
	dig="obase="10"; ibase="$ib"; $dig"
	dig=`echo $dig|bc`

	# now comparing with input base
	if [ $dig -ge $ib ];
	then
		echo "Input has a digit greater than input base";
		exit;
	fi
done

# Now that all expected errors are handled, doing the final conversion
a="obase="$ob"; ibase="$ib"; $n"
echo $a|bc
