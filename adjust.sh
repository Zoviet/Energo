#!/bin/bash
i1=$(arecord -f S16_LE -D hw:CARD=Device,DEV=0 -qd 2 volt1 && sox volt1 -n stat &> volt1.d && sed '9q;d' volt1.d  | sed 's/.*:\(.*\)$/\1/g' &)
i2=$(arecord -f S16_LE -D hw:CARD=Device_1,DEV=0 -qd 2 volt2 && sox volt2 -n stat &> volt2.d && sed '9q;d' volt2.d  | sed 's/.*:\(.*\)$/\1/g' &) 
i3=$(arecord -f S16_LE -D hw:CARD=Device_2,DEV=0 -qd 2 volt3 && sox volt3 -n stat &> volt3.d && sed '9q;d' volt3.d  | sed 's/.*:\(.*\)$/\1/g' &)
wait
echo $i1
echo $i2
echo $i3

