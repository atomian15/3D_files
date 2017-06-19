#!/bin/sh

mkdir -p AI0/f

for file in `\find . -maxdepth 1 -type f | grep -E ".*ZX.*AI0_f.stp$"` ; do
  cp $file AI0/f
done  

cd AI0/f

cnt=0
dir_num=0

for file in `\find . -maxdepth 1 -type f | sort | grep -E "stp$"` ; do
 temp=${file%u*}
 temp=${temp##*_}
 if test $((temp)) -eq $cnt; then
   if [ $cnt -eq 0 ]; then
     ((dir_num++))
     mkdir -p "$dir_num"
     mv $file $dir_num
   else 
     mv $file $dir_num
   fi
    # echo $file
    # echo $dir_num
    # echo $cnt
     ((cnt++))
 else
   cnt=0
   if [ $((temp)) -eq 0 ]; then
     ((dir_num++))
     mkdir -p "$dir_num"
     mv $file $dir_num
     ((cnt++))
   fi
 fi
 #echo $file
done
cd ../../

