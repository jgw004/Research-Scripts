#!/bin/bash
### This script can be continued from 'runrep_jobs.sh'

#################################
RUN_FILE="run_file"
TOP_PATH=$(pwd)

# Naming directories
a=("dir1" "dir2" "dir3" "dir4" "dir5" "dir6" "dir7")
for i in "${a[@]}" ; do

for k in 1 2 3 4 5 6 7 8 ; do       #number of replicas

REP_PATH="${i}/Rep$k/path/way"

cd $TOP_PATH/$REP_PATH              #absolute pathway
echo "-- ${i} - R$k"

## Change file conents of *$RUN_FILE
#sed -i "s/\(#SBATCH -J \)wild_R1/\1${i}_$k/" "$RUN_FILE"	    ##job name
#sed -i "s/\(#SBATCH -N \)4/\16/" "$RUN_FILE"			        ##node
#sed -i "s/\(#SBATCH -n \)4/\16/" "$RUN_FILE"			        ##node number
#sed -i "s/\(#SBATCH -p \)normal/\1development/" "$RUN_FILE"    ##type
#sed -i "s/\(#SBATCH -t \)6/\124/" "$RUN_FILE"			        ##run-time
#sed -i "s/\(ibrun namd2 .*\)step4_equilibration1.inp/\1step4_equilibration2.inp/" "$RUN_FILE"
#sed -i "s/\(ibrun namd2 .*\)step4.1_equilibration\.log/\1step4.2_equilibration.log/" "$RUN_FILE"


####################
##### CHECKING #####
## Stores the run_file contents of the grepped parts from the last iteration
grep -Ei 'sbatch -N|SBATCH -t|ibrun namd2' $RUN_FILE > checkrep-contents.txt

cp checkrep-contents.txt $TOP_PATH  #to compare after theyre done
#mv charmm-gui$k old$k

cd $TOP_PATH

#diff check-contents.txt $REP_PATH/check-contents.txt


done
done

####################
echo ""
cat checkrep-contents.txt
echo ""
echo " ==  All changes to '$RUN_FILE' were applied successfully!"
echo ""

#####################
./runrep_jobs.sh


