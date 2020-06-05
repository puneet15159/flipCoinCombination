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
echo "-------------------------SINGLET COMBINATION--------------------------"
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
counter=20

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
calc ${dic1[HH]}/20*100

echo "HT percentage"
calc ${dic1[HT]}/20*100

echo "TT percentage"
calc ${dic1[TT]}/20*100

echo "TH percentage"
calc ${dic1[TH]}/20*100

#---------------------TRIPLET COMBINATION------------------------------

declare -A dic2
dic2[HHH]=0
dic2[HHT]=0
dic2[HTT]=0
dic2[TTT]=0
dic2[TTH]=0
dic2[THH]=0
counter=30

while (( counter > 0 ))
do
        flip=$((RANDOM%6))
        if [[ flip -eq 0 ]]
        then 
                dic2[HHH]=$((${dic2[HHH]}+1))
        elif [[ flip -eq 1 ]]
        then
                dic2[HHT]=$((${dic2[HHT]}+1))
        elif [[ flip -eq 2 ]]
        then
                dic2[HTT]=$((${dic2[HTT]}+1))
        elif [[ flip -eq 3 ]]
        then
                dic2[TTT]=$((${dic2[TTT]}+1))
	elif [[ flip -eq 4 ]]
        then
                dic2[TTH]=$((${dic2[TTH]}+1))
        elif [[ flip -eq 5 ]]
        then
                dic2[THH]=$((${dic2[THH]}+1))

        fi
        ((counter--))
done

echo "-------------------------TRIPLET COMBINATION--------------------------"
echo "${!dic2[@]}"
echo "${dic2[@]}"

echo "HHH percentage"
calc ${dic2[HHH]}/30*100

echo "HHT percentage"
calc ${dic2[HHT]}/30*100

echo "HTT percentage"
calc ${dic2[HTT]}/30*100

echo "TTT percentage"
calc ${dic2[TTT]}/30*100

echo "TTH percentage"
calc ${dic2[TTH]}/30*100

echo "THH percentage"
calc ${dic2[THH]}/30*100
