set terminal jpeg size 2580,880
set xtics rotate by 310
set output "profile.jpg"
set title "Energo test"
set datafile separator ';'
set xlabel "Время"
set ylabel "кВт"
set autoscale fix
set boxwidth 0.9
datafile = 'summ.csv'
set style fill solid
plot datafile using 2:xtic(1) with boxes
