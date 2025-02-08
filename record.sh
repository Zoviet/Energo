#!/bin/bash
coef=0.33
v=230
if [ -e 'summ.csv' ]; then
	rm *.csv
	rm volt*
fi
while :
do
	d=$(date "+%d-%m-%Y %H:%M:%S")
	echo $d
	i1=$(arecord -D hw:CARD=Device,DEV=0 -qd 15 volt1 && sox volt1 -n stat &> volt1.d && sed '9q;d' volt1.d  | sed 's/.*:\(.*\)$/\1/g' &)
	i2=$(arecord -D hw:CARD=Device_1,DEV=0 -qd 15 volt2 && sox volt2 -n stat &> volt2.d && sed '9q;d' volt2.d  | sed 's/.*:\(.*\)$/\1/g' &) 
	i3=$(arecord -D hw:CARD=Device_2,DEV=0 -qd 15 volt3 && sox volt3 -n stat &> volt3.d && sed '9q;d' volt3.d  | sed 's/.*:\(.*\)$/\1/g' &)
	wait
	echo $d';'$i1';'$i2';'$i3';' >> data.csv
	echo $d';'$(bc<<<"scale=3;$i1*$coef*$v")';'$(bc<<<"scale=3;$i2*$coef*$v")';'$(bc<<<"scale=3;$i3*$coef*$v")';' >> data.csv
	echo $d';'$(bc<<<"scale=3;$i1*$i2*$i3*$coef*$v")';' >> summ.csv
done
	
