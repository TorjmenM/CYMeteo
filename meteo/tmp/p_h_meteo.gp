#!/usr/local/bin/gnuplot -persist

system("cat ./tmp/g_s_h_meteo.csv | awk -F';' '{if (last_key != $1) {print \"\"} print $0; last_key = $1}' | tr '[;]' ' ' > ./tmp/meteo_blank.csv")

set title 'Stations Altitude map' font ',16'
set xlabel 'Longitude' font ',12'
set ylabel 'Latitude' font ',12'
set xtics geographic
set ytics geographic
set format x "%D %E"
set format y "%D %N"

set datafile separator " "
stats './tmp/meteo_blank.csv' u 2:3 nooutput
set xrange [STATS_min_x:STATS_max_x]
set yrange [STATS_min_y:STATS_max_y]

set pm3d map depthorder
set style fill  transparent
set autoscale noextend
set dgrid3d 50,50
set hidden3d
set pm3d interpolate 3,3 flush begin nohidden3d 
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault

splot './tmp/meteo_blank.csv' using 2:3:4  with pm3d title 'Altitude Map'

###########################################################################################

# set pm3d at s nohidden3d transparent
# replot 'world110m.dat' using 1:2:(100) with polygons fc bgnd
# splot 'world110m.dat' using 1:2:(100) with lines
# set key
# set dgrid3d
# set pm3d
# set datafile separator ";"
# plot 'world110m.dat' using 2:3 with lines lc rgb "black" notitle

reset
