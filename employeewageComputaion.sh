#!/bin/bash

echo "Welcome to Employee Wage Computation Program"
eclatre -a arr
wagePerHr=20
fullHr=20
partHr=4
wage=0
dailywage=0

isAbsent=0
isPart=1
isFull=2
day=0
totalHrs=0

function wageHrs(){
local hrs=0
if [[ $attendance -eq 0 ]];
then
hrs=$(( $1+0 ))
echo $hrs
elif [[ $attendance -eq  1 ]];
then
hrs=$(( $1+partHr ))
echo $hrs
elif [[ $attendance -eq  2 ]];
then
hrs=$(( $1+$fullHr ))
echo $hrs
fi
}

while [[ $day -lt 20 ]];
do

attendance =$((RANDOM%3))
case  $attendance in
0) wage=$(($wage+0))
dailywage=0
;;
1)wage=$(( $wage+ ($wagePerHr*$partHr) ))
dailywage=$(($wagePerHr*$partHr))
;;
3)wage=$(( $wage+ ($wagePerHr*$fullHr) ))
dailywage=$(($wagePerHr*$fullHr))
;;
*) echo "Attendance Error"
esac
arr["Day "$day]=$dailwage
totalHrs='wageHrs $totalHrs'
if[[ $totalHrs -eq 100 ]];
then
break
fi
((day++))
done

totalWagesofmonth=$(($(calculateWage $totalEmployeeHours)))
echo "Daily wages:${dailyWage[@]}"
echo "Total wages:" $totalWagesofmonth 
