#!/bin/bash
cd /var/www/Energo
d=$(date "+%d-%m-%Y")
systemctl stop energo.service
gnuplot -p profile.gnuplot
if ! [ -d $d ]; then
	mkdir $d
fi
cp profile.jpg $d'/'
cp *.csv $d'/'
echo | mutt alexandr@asustem.ru -s 'Энергоотчет: '$d -a profile.jpg -a summ.csv -a data.csv
systemctl start energo.service
