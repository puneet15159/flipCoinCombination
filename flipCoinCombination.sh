#!/bin/bash

declare -A dic
counter=10

#---------------------SINGLET COMBINATION------------------------------------------

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
echo "-------------------SINGLET COMBINATION-------------------"
echo "${!dic[@]}"
echo "${dic[@]}"

function calc(){ awk "BEGIN { print "$*" }"; }

echo "heads percentage"
calc ${dic[H]}/10*100

echo "tails percentage"
calc ${dic[T]}/10*100

#---------------------------DOUBLET COMBINATION------------------------------------

declare -A dic1
dic1[HH]=0
dic1[HT]=0
dic1[TT]=0
dic1[TH]=0
counter=10

while (( counter > 0 ))
do
        flip=$((RANDOM%4))
        if [[ flip -eq 0 ]]
        then
                #echo "heads"
                dic1[HH]=$((${dic1[HH]}+1))
        elif [[ flip -eq 1 ]]
	then
                #echo "tails"
                dic1[HT]=$((${dic1[HT]}+1))
	elif [[ flip -eq 2 ]]
	then
		dic1[TT]=$((${dic1[TT]}+1))
	elif [[ flip -eq 3 ]]
	then
		dic1[TH]=$((${dic1[TH]}+1))
        fi
        ((counter--))
done
echo "-------------------------DOUBLET COMBINATION--------------------------"
echo "${!dic1[@]}"
echo "${dic1[@]}"

echo "HH percentage"
calc ${dic1[HH]}/10*100

echo "HT percentage"
calc ${dic1[HT]}/10*100

echo "TT percentage"
calc ${dic1[TT]}/10*100

echo "TH percentage"
calc ${dic1[TH]}/10*100


