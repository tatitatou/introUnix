#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Bad argument number"
    echo "$(basename $0) delay start"
    exit -1
fi

DELAY=$1
START=$2

#CPT=$START
#while [ $CPT -ne -1 ]
#do
#    sleep $DELAY
#    echo $CPT
#    CPT=$(( $CPT - 1  ))
#done

for i in $(seq $START)
do
    sleep $DELAY
    echo $(( $START - $i + 1))
done
echo $(($START - $i)) 
