read name
flag=0
for user in ` ls /home `
do
   if [ "$name" = "$user" ];
	then
		flag=1;
		break;
	fi
done
[ $flag -eq 1 ] && echo "Is a user" || echo "not a user";
