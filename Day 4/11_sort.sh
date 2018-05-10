echo -n "Enter size of the array: "
read n
echo "Enter elements: "
i=0
while [ $i -lt $n ]
do
        read arr[$i]
        let i=i+1
done
echo ${arr[@]}
i=0
j=0
for((i=0;i<$n;i++))
do
        for((j=0;j<$n-1;j++))
        do
                let j1=j+1
                if [ ${arr[$j]} -ge ${arr[$j1]} ]
                then
                        temp=${arr[$j]};
                        arr[$j]=${arr[$j1]};
                        arr[$j1]=$temp;
                fi

        done

done
echo "Sorted array: "
echo ${arr[@]}



#### other method

#sorted=($(printf '%s\n' "${array[@]}"|sort))
#echo ${sorted[@]}