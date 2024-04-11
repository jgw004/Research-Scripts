#!/bin/bash
### This script can be continued from run_jobs.sh

######CLI Check###############
#for a in "WT7kms" "Alpha7kms" ; do for k in 1 2 3 ; do cd /work2/09231/jgw004/frontera/7kms/$a/Rep$k/ch*/namd/ ; {command} ; done ; done
#################################


# Naming directories
a=("WT7kms" "Alpha7kms" "Gamma7kms" "D614G7kms" "Delta7kms" "Epsilon7kms" "Moderna7kms")
#a=("Beta7kms")
for i in ${a[@]} ; do

for k in 1 2 3 ; do

TOP_PATH="/work2/09231/jgw004/frontera/7kms"
REP_PATH="${i}/Rep$k/ch*/namd"

cd $TOP_PATH/$REP_PATH
echo "-- ${i} - R$k"

## replace file conents of *ad_run_fr
#sed -i "s/\(#SBATCH -J \)wild_R1/\1${i}_$k/" "ad_run_fr"	##job name
sed -i "s/\(#SBATCH -N \)04/\16/" "ad_run_fr"			##node
sed -i "s/\(#SBATCH -n \)04/\16/" "ad_run_fr"			##node number
#sed -i "s/\(#SBATCH -p \)normal/\1development/" "ad_run_fr"    ##type
#sed -i "s/\(#SBATCH -t \)06/\124/" "ad_run_fr"			##run-time
#sed -i "s/\(ibrun namd2 .*\)step4_equilibration1.inp/\1step4_equilibration2.inp/" "ad_run_fr"
#sed -i "s/\(ibrun namd2 .*\)step4.1_equilibration\.log/\1step4.2_equilibration.log/" "ad_run_fr"

## replace file conents of step5.1.*_development.inp
#sed -i "s/\(outputName[[:space:]]\+step5\.1\.\)40_development/\1${k}_development/" "$file_path_input"


####################
##### CHECKING #####
grep -Ei 'sbatch -N|SBATCH -t|ibrun namd2' ad_run_fr > checkrep-contents.txt

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
echo " ==  All changes to 'ad_run_fr' were applied successfully!"
echo ""

#####################
./runrep_jobs.sh


