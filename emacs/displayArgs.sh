#!/bin/bash

if [ $# -eq 0 ]
then
    echo "argument required"
    exit -1
fi

shift

while [ $# -gt 0 ]
do
    echo $1
    shift
done
