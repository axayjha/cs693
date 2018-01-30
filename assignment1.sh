#!/bin/bash

## OS Lab 1
## 29/01/18
## @author Akshay

#a
touch empty1 empty2 empty3 empty4 empty5
#b
cat > text
#c
cat text
#d
cp text newtext
#e
cat > matter
#f
echo cat text matter > txtmat
#g
rm text
#h
chmod 666 newtxt
#i
mv newtext oldtext
#j
mkdir mydir
#k
mv oldtext matter mydir
#l
mkdir mydir/newdir
#m
mv mydir/* mydir/newdir #will throw error but still do the job
#n
rm -i empty*
#o
rm -rf mydir
#p
date +%d/%m/%y
#q
who
#r
tree /*
#s
#whenever xyz is non empty
#t
#go to home
#u
who | wc -l

