#!/usr/local/bin/gnuplot -persist

set title 'Temperature min,max,mean by Station' font ',16'
set xlabel 'Station' font ',12'
set ylabel 'Temperature' font ',12'
Shadecolor = "#00FFFF"
set datafile separator ";"
set autoscale noextend
set grid
set xtics rotate by 90 right
plot './tmp/g_s_t1_meteoall.csv' using 0:3:2:xtic(1) with filledcurve fc rgb Shadecolor title "Shadowed variation region",'' using 0:4 smooth mcspline lw 1 lc rgb '#80E0A080' title "Average Temperature"
reset
