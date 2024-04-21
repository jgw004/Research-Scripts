#!/bin/bash
## This script will calculate the total time in days, that your large number of simulations will take to finish.

echo "How many systems are in each group?"
read num_groups

echo "How many total groups (original + replicas)?"
read total_sys

echo "How many hours are you running each system?"
read runtime_sys

echo ""
###Show result
echo " >> Total Hours for Each System = [ $num_groups x $total_sys x $runtime_sys ]"
hours_per_system=$((num_groups*total_sys*runtime_sys))

echo ""
echo "How many jobs are running at a time?"
read running_jobs

echo ""
###Hours per job
echo " >> Hours Running @ Once = [ $hours_per_system / $running_jobs ]"
running_time=$((hours_per_system/running_jobs))

#echo ""
echo "---"
###Total Time for ALL
total_days=$((running_time/60))
echo "   Total Days to Complete = [ $total_days ]"
echo ""


