#!/bin/bash
#1 - make sure {run_script} is set.
#2 - make sure current {input_file} and previous {input_file} are able to communicate.

RUN_FILE="run_file"
TOP_PATH=$(pwd)

## List each directory
a=("dir1" "dir2" "dir3" "dir4" "dir5" "dir6" "dir7")
for i in "${a[@]}" ; do

BATCH_PATH="${i}/pathway"

echo "-------${i}---------"			# shows the current dir

cd $BATCH_PATH
sbatch $RUN_FILE 
cd $TOP_PATH 

#########################
##### Replicates #####

#for k in 1 2 3 4 5 6 7 8 ; do
#
#DIR_REP="absolute/${i}/Rep$k/pathway"
#
#echo "-------${i} Rep$k---------"		# show current dir of replica
#
#cd $DIR_REP
#sbatch $RUN_FILE
#cd $TOP_PATH

##########################
###### Misc. Checks ######

#echo "### ${i} $k ###"

#ls $DIR_PATH/*{inp,log}
#tail -2 $DIR_PATH/step5_production{??}.log	# specify file number

#head -2 $DIR_PATH/step5*{?}.restart.xsc	# specify file number

##########

echo ""

done
#done

