#!/bin/bash
### This script calls run_jobs.sh after the changes are made to the files.

TOP_PATH=$(pwd)

# Naming your directories
a=("dir1" "dir2" "dir3")
for i in ${a[@]} ; do

# Name the path to run the batch file
BATCH_PATH="${i}7kms/ch*/namd"

cd $BATCH_PATH
echo "------ ${i} -------"

## change file contents of your {run_file} based on line contents
sed -i "s/\(#SBATCH -J \)wild_type/\1${i}_$k/" "run_file"	    ##job name
sed -i "s/\(#SBATCH -N \)64/\152/" "run_file"			        ##node
sed -i "s/\(#SBATCH -n \)64/\152/" "run_file"			        ##node number
sed -i "s/\(#SBATCH -p \)development/\1normal/" "run_file"      ##job type
sed -i "s/\(#SBATCH -t \)24/\148/" "run_file"			        ##run-time (hours)
sed -i "s/\(ibrun namd2 .*\)step5_production26\.inp/\1step5_production27.inp/" "run_file"       ##input file name
sed -i "s/\(ibrun namd2 .*\)step5.26_production\.log/\1step5.27_production.log/" "run_file"     ##log file name

## replace file conents of step5.1.*_development.inp
#sed -i "s/\(outputName[[:space:]]\+step5\.1\.\)40_development/\1${k}_development/" "$file_path_input"


####################
##### CHECKING #####
grep -Ei 'sbatch -N|SBATCH -t|ibrun namd2' run_file > check-contents.txt
cp check-contents.txt $TOP_PATH  #to compare after theyre done

#echo "----${i}----"
#grep -Ei "ibrun namd2" run_file
#echo ""
#ls $TOP_PATH/$BATCH_PATH/step5.26_production.log

####################
cd $TOP_PATH

#diff check-contents.txt $REP_PATH/check-contents.txt


done

echo ""
cat check-contents.txt
echo ""
echo "Changes to 'run_file' were applied successfully!"
echo ""
#####################
./run_jobs.sh


