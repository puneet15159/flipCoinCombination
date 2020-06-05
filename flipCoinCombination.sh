#!/bin/bash

declare -A dic
counter=10

dic[H]=0
dic[T]=0

while (( counter > 0 ))
do
	flip=$((RANDOM%2))
	if [[ flip -eq 1 ]]
	then
    		#echo "heads"
		dic[H]=$((${dic[H]}+1))
	else
    		#echo "tails"
		dic[T]=$((${dic[T]}+1))
	fi
	((counter--))
done
echo "${!dic[@]}"
echo "${dic[@]}"

function calc(){ awk "BEGIN { print "$*" }"; }

echo "heads percentage"
calc ${dic[H]}/10*100

echo "tails percentage"
calc ${dic[T]}/10*100
