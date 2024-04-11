#!/bin/bash
#1 - make sure {run_script} is set.
#2 - make sure current {input_file} and previous {input_file} are able to communicate.

RUN_FILE="run_file"

a=("dir1" "dir2" "dir3" "dir4" "dir5" "dir6" "dir7")
for i in "${a[@]}" ; do

#########################
##### Replicates ######
for k in 1 2 3 4 5 6 7 8 ; do       #number of replicas

TOP_PATH=$(pwd)
REP_PATH="${i}/Rep$k/path/way"      #absolute pathway

echo "-------${i} Rep$k---------"
cd $TOP_PATH/$REP_PATH
sbatch $RUN_FILE
cd $TOP_PATH

#########################

#ls $REP_PATH/*{inp,log}
#tail -2 $REP_PATH/some_file

#echo "--------------------"

#########################
##### Input Scripts #####
#cp input.sh input_equil_generator.inp $TOP_PATH/$REP_PATH
#cd $REP_PATH

#./input.sh
#cd $TOP_PATH

#########################


########
#head -2 $REP_PATH/step4*1.restart.xsc
#grep 'step4*' $REP_PATH/$RUN_FILE
########

########
#echo "######${i}######"
#tail -15  $REP_PATH/step5.3_production.log
#echo ""
#echo "################"
#######

echo ""

done
done

