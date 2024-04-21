#!/bin/bash
### This script calls run_jobs.sh after the changes are made to the files.
RUN_FILE="run_file"
TOP_PATH=$(pwd)

# Naming your directories
a=("dir1" "dir2" "dir3" "dir4" "dir5" "dir6" "dir7")
for i in ${a[@]} ; do

# Name the path to run the batch file
BATCH_PATH="${i}/Rep$k/path/way"

cd $BATCH_PATH
echo "------ ${i} -------"

## change file contents of your run_file based on line contents
sed -i "s/\(#SBATCH -J \)wild_type/\1${i}_$k/" "$RUN_FILE"	    ##job name
sed -i "s/\(#SBATCH -N \)64/\152/" "$RUN_FILE"			        ##node
sed -i "s/\(#SBATCH -n \)64/\152/" "$RUN_FILE"			        ##node number
sed -i "s/\(#SBATCH -p \)development/\1normal/" "$RUN_FILE"      ##job type
sed -i "s/\(#SBATCH -t \)24/\148/" "$RUN_FILE"			        ##run-time (hours)
sed -i "s/\(ibrun namd2 .*\)step5_production26\.inp/\1step5_production27.inp/" "$RUN_FILE"       ##input file name
sed -i "s/\(ibrun namd2 .*\)step5.26_production\.log/\1step5.27_production.log/" "$RUN_FILE"     ##log file name


####################
##### CHECKING #####
## Stores the run_file contents of the grepped parts from the last iteration
grep -Ei 'sbatch -N|SBATCH -t|ibrun namd2' $RUN_FILE > check-contents.txt
cp check-contents.txt $TOP_PATH

#echo "----${i}----"
#grep -Ei "ibrun namd2" $RUN_FILE
#echo ""
#ls $TOP_PATH/$BATCH_PATH/step5.26_production.log

####################
cd $TOP_PATH

#diff check-contents.txt $REP_PATH/check-contents.txt


done

echo ""
cat check-contents.txt
echo ""
echo "Changes to '$RUN_FILE' were applied successfully!"
echo ""
#####################
./run_jobs.sh


