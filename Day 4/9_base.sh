echo -n "Enter the number: "
read n
echo -n "Enter input base: "
read ib
echo -n "Enter the output base: "
read ob
a="obase="$ob"; ibase="$ib"; $n"
echo $a|bc
