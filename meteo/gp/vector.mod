#!/usr/local/bin/gnuplot -persist

set title '${V2} map' font ',16'
set xlabel '${V4}' font ',12'
set ylabel '${V3}' font ',12'
set xtics geographic
set ytics geographic
set format x "%D %E"
set format y "%D %N"
set datafile separator ";"
set grid
set autoscale noextend

# normalizing dx and dy values
stats './tmp/${filename}' u 3:2 nooutput
scale = sqrt((STATS_max_x-STATS_min_x)**2 + (STATS_max_y-STATS_min_y)**2)

Wind(x,y)=sprintf("Intensity %.2f - Orientation %.2f°",sqrt(column(x)**2+column(x)**2),atan(column(y)/column(x))*180/pi)

set xrange [STATS_min_x-2:STATS_max_x+2]
set yrange [STATS_min_y-2:STATS_max_y+2]

set key bmargin center horizontal Left reverse enhanced autotitle nobox
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault
set palette defined
set yzeroaxis
set xzeroaxis

plot 	'./tmp/${filename}' using 3:2:(column(5)*scale/50):(column(4)*scale/50):(sqrt(column(4)**2 + column(5)**2)) \
							with vectors filled head lw 1 lc palette title '${V2} direction and amplitude', \
		'./tmp/${filename}'	using 3:2:(Wind(4,5)) with labels hypertext point pt 6 ps 0.6 lt -1 notitle,\
		'world110m.dat' using 1:2 with lines lc rgb "blue" notitle

reset

