#!/bin/bash
## Check the run times of simulations.
## Make individual files first to calculate, then append into one

##############################################
##DO NOT TOUCH OTHER THAN PRODUCTION NUMBERS##
##############################################

num1="25"
num2="28"

TOP_PATH=$(pwd)
echo " "

##Variants###
a=("dir1" "dir2")
for i in "${a[@]}" ; do

CHECK_PATH="${i}/Rep$k/path/way"

cd $CHECK_PATH

echo "--------${i}------------------------------"

##finds the first number at the beginning of a line starting with '[0-9]' and stores the value as a variable for global use.
run_time=$(grep -m 1 "^[0-9][0-9]*" step5_production$num1.restart.xsc | awk '{print $1}') ;

echo "   ns = $((run_time/500000))"
ls step5_production$num1.restart.xsc
#tail -5 step4.1*log

echo " ----------------------------------------- "

cd $TOP_PATH

done
echo ""
#################################################

echo "   ##Other Variants##"
a=("dir3" "dir4" "dir5" "dir6" "dir7")
for i in "${a[@]}" ; do

CHECK_PATH="${i}/Rep$k/path/way"

cd $CHECK_PATH
echo "--------${i}------------------------------"

##finds the first number at the beginning of a line starting with '[0-9]' and stores the value as a variable for global use.
run_time=$(grep -m 1 "^[0-9][0-9]*" step5_production$num2.restart.xsc | awk '{print $1}') ;

echo "   ns = $((run_time/500000))"
ls step5_production$num2.restart.xsc
#tail -5 step4.1*log

echo " ----------------------------------------- "

cd $TOP_PATH

done


