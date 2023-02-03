#!/usr/local/bin/gnuplot -persist

set title '${V2}' font ',16'
set xlabel '${V4}' font ',12'
set ylabel '${V3}' font ',12'
Curvecolor = "#80E0A080"
set datafile separator ";"
set autoscale noextend
set xtics rotate by 45 right
set timefmt '%Y%m%d%H'
set xdata time
set format x '%Y/%m/%d:%H'
set grid
#smooth bezier
plot './tmp/${filename}' using 1:2 with lines title "Average ${V3}" lc rgb Curvecolor lw 1 
reset
