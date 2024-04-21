#!/bin/bash
## Check the run times of simulations.
## Make individual files first to calculate, then append into one

##############################################
##DO NOT TOUCH OTHER THAN PRODUCTION NUMBERS##
##############################################
TOP_PATH=$(pwd)
num="25"

echo " "
##Variants###
a=("dir1" "dir2" "dir3" "dir4" "dir5" "dir6" "dir7")
for i in "${a[@]}" ; do

for k in 1 2 3 4 5 6 7 8; do

REP_PATH="${i}/Rep$k/path/way"

cd $REP_PATH
echo "-- ${i} - R$k"


##finds the first number at the beginning of a line starting with '[0-9]' and stores the value as a variable for global use.
run_time=$(grep -m 1 "^[0-9][0-9]*" step4_equilibration$num.restart.xsc | awk '{print $1}') ;

echo "   ns = $((run_time/500000))"
ls step4_equilibration$num.restart.xsc
#cat step4_equilibration.restart.xsc
#tail -5 step4.1*log

echo " ----------------------------------------- "


cd $TOP_PATH
echo ""

done
done 


