#!/usr/local/bin/gnuplot -persist

set title 'Temperature by hour and station' font ',16'
set xlabel 'Date' font ',12'
set ylabel 'Temperature' font ',12'
set autoscale noextend
set xtics rotate by 45 right
set timefmt '%Y%m%d'
set xdata time
set grid
set format x '%Y/%m/%d'
system("awk -F ';' '{ if ((a != substr($1,1,7)) && (NR!=1)) { print \"\";} a=substr($1,1,7); print substr($1,1,2),substr($1,3,5),substr($1,8,8),$2 }' ./tmp/g_s_t3_meteoall.csv > ./tmp/data.csv") 
set datafile separator " "
set palette defined (0 "blue",2 "green",4 "yellow",6 "orange",8 "red")
set cbrange [0:23]
plot './tmp/data.csv' using 3:4:1 with lines lt palette title "Temperature per date by hour/station. Colour per hour"
reset
