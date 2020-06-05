#!/bin/bash 

declare -A dic
counter=50

dic[H]=0
dic[T]=0

dic[HH]=0
dic[HT]=0
dic[TT]=0
dic[TH]=0

dic[HHH]=0
dic[HHT]=0
dic[HTT]=0
dic[TTT]=0
dic[TTH]=0
dic[THH]=0

while (( counter > 0 ))
do
	flip=$((RANDOM%12))

	if [[ flip -eq 0 ]]
	then
		dic[H]=$((${dic[H]}+1))

	elif [[ flip -eq 1 ]]
	then
		dic[T]=$((${dic[T]}+1))

	elif [[ flip -eq 2 ]]
        then
                dic[HH]=$((${dic[HH]}+1))

        elif [[ flip -eq 3 ]]
        then
                dic[HT]=$((${dic[HT]}+1))

        elif [[ flip -eq 4 ]]
        then
                dic[TT]=$((${dic[TT]}+1))

        elif [[ flip -eq 5 ]]
        then
                dic[TH]=$((${dic[TH]}+1))

	elif [[ flip -eq 6 ]]
        then
                dic[HHH]=$((${dic[HHH]}+1))

        elif [[ flip -eq 7 ]]
        then
                dic[HHT]=$((${dic[HHT]}+1))

        elif [[ flip -eq 8 ]]
        then
                dic[HTT]=$((${dic[HTT]}+1))

        elif [[ flip -eq 9 ]]
        then
                dic[TTT]=$((${dic[TTT]}+1))

        elif [[ flip -eq 10 ]]
        then
                dic[TTH]=$((${dic[TTH]}+1))

        elif [[ flip -eq 11 ]]
        then
                dic[THH]=$((${dic[THH]}+1))

	fi
	((counter--))
done
echo "${!dic[@]}"
echo "${dic[@]}"


for i in "${!dic[@]}"
do
	array[((count++))]=${dic[$i]}
done

max=0
for i in "${array[@]}"
do
	if [[ $i -ge $max ]]
	then
           max=$(($i))
	fi
done

for i in "${!dic[@]}"
do
	if [[ ${dic[$i]} -eq max ]]
	then
	     echo "Winning Combination is: $i"
	     break
	fi
done
