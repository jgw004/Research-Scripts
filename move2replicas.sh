#!/bin/bash
## This is meant to create new replica directories and move any necessary files from the original\
### directory to all replica directories. 

### This script calls run_jobs.sh after the changes are made to the files.
TOP_PATH=$(pwd)

a=("dir1" "dir2" "dir3" "dir4" "dir5" "dir6" "dir7")
for i in ${a[@]} ; do

RETRIEVE_PATH="${i}7kms/ch*/namd"

for k in 1 2 3 4 5 6 7 8 ; do

################################
######CREATING REPLICAS#########
################################
mkdir ${i}/Rep$k

PUT_PATH="${i}7kms/Rep$k/ch*/namd"

echo "-- copying all files and directories to ${i}7kms - Rep$k "
cp -r $TOP_PATH/$RETRIEVE_PATH $TOP_PATH/$PUT_PATH

##############################
######CHECK DIRECTORIES#######
##############################

echo "---------------"
echo "---- ${i} - Rep$k -------- "

ls $PUT_PATH/step4_equilibration1.inp


done
done


