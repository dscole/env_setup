#!/bin/bash
pwd
ls
echo "called with: " $*
export DISPLAY=${1}:0.0
echo "DISPLAY=${DISPLAY}"
echo "startxwin = $(which startxwin)"
startxwin -- -listen tcp &
sleep 5
xhost + $1
