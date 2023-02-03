#!/usr/local/bin/gnuplot -persist

set title 'Average temperature' font ',16'
set xlabel 'Time' font ',12'
set ylabel 'Temperature' font ',12'
Curvecolor = "#80E0A080"
set datafile separator ";"
set autoscale noextend
set xtics rotate by 45 right
set timefmt '%Y%m%d%H'
set xdata time
set format x '%Y/%m/%d:%H'
set grid
#smooth bezier
plot './tmp/g_s_t2_meteo.csv' using 1:2 with lines title "Average Temperature" lc rgb Curvecolor lw 1 
reset
