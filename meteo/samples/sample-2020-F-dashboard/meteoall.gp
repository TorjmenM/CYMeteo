set multiplot layout 3,3
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
plot './tmp/g_s_t2_meteoall.csv' using 1:2 with lines title "Average Temperature" lc rgb Curvecolor lw 1 
reset
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
#!/usr/local/bin/gnuplot -persist

set title 'Pressure min,max,mean by station' font ',16'
set xlabel 'Date' font ',12'
set ylabel 'Pressure' font ',12'
Shadecolor = "#00FFFF"
set datafile separator ";"
set autoscale noextend
set grid
set xtics rotate by 90 right
plot './tmp/g_s_p1_meteoall.csv' using 0:3:2:xtic(1) with filledcurve fc rgb Shadecolor title "Shadowed variation region",'' using 0:4 smooth mcspline lw 1 lc rgb '#80E0A080' title "Average Pressure"
reset
#!/usr/local/bin/gnuplot -persist

set title 'Average pressure' font ',16'
set xlabel 'Time' font ',12'
set ylabel 'Pressure' font ',12'
Curvecolor = "#80E0A080"
set datafile separator ";"
set autoscale noextend
set xtics rotate by 45 right
set timefmt '%Y%m%d%H'
set xdata time
set format x '%Y/%m/%d:%H'
set grid
#smooth bezier
plot './tmp/g_s_p2_meteoall.csv' using 1:2 with lines title "Average Pressure" lc rgb Curvecolor lw 1 
reset
#!/usr/local/bin/gnuplot -persist

set title 'Pressure by hour and station' font ',16'
set xlabel 'Date' font ',12'
set ylabel 'Pressure' font ',12'
set autoscale noextend
set xtics rotate by 45 right
set timefmt '%Y%m%d'
set xdata time
set grid
set format x '%Y/%m/%d'
system("awk -F ';' '{ if ((a != substr($1,1,7)) && (NR!=1)) { print \"\";} a=substr($1,1,7); print substr($1,1,2),substr($1,3,5),substr($1,8,8),$2 }' ./tmp/g_s_p3_meteoall.csv > ./tmp/data.csv") 
set datafile separator " "
set palette defined (0 "blue",2 "green",4 "yellow",6 "orange",8 "red")
set cbrange [0:23]
plot './tmp/data.csv' using 3:4:1 with lines lt palette title "Pressure per date by hour/station. Colour per hour"
reset
#!/usr/local/bin/gnuplot -persist

set title 'average wind map' font ',16'
set xlabel 'Longitude' font ',12'
set ylabel 'Latitude' font ',12'
set xtics geographic
set ytics geographic
set format x "%D %E"
set format y "%D %N"
set datafile separator ";"
set grid
set autoscale noextend

# normalizing dx and dy values
stats './tmp/g_s_w_meteoall.csv' u 3:2 nooutput
scale = sqrt((STATS_max_x-STATS_min_x)**2 + (STATS_max_y-STATS_min_y)**2)

Wind(x,y)=sprintf("Intensity %.2f - Orientation %.2f°",sqrt(column(x)**2+column(x)**2),atan(column(y)/column(x))*180/pi)

set xrange [STATS_min_x-2:STATS_max_x+2]
set yrange [STATS_min_y-2:STATS_max_y+2]

set key bmargin center horizontal Left reverse enhanced autotitle nobox
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault
set palette defined
set yzeroaxis
set xzeroaxis

plot 	'./tmp/g_s_w_meteoall.csv' using 3:2:(column(5)*scale/50):(column(4)*scale/50):(sqrt(column(4)**2 + column(5)**2)) \
							with vectors filled head lw 1 lc palette title 'average wind direction and amplitude', \
		'./tmp/g_s_w_meteoall.csv'	using 3:2:(Wind(4,5)) with labels hypertext point pt 6 ps 0.6 lt -1 notitle,\
		'world110m.dat' using 1:2 with lines lc rgb "blue" notitle

reset

#!/usr/local/bin/gnuplot -persist

system("cat ./tmp/g_s_h_meteoall.csv | awk -F';' '{if (last_key != $1) {print \"\"} print $0; last_key = $1}' | tr '[;]' ' ' > ./tmp/meteo_blank.csv")

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
set dgrid3d 30,30
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
#!/usr/local/bin/gnuplot -persist

system("cat ./tmp/g_s_m_meteoall.csv | awk -F';' '{if (last_key != $1) {print \"\"} print $0; last_key = $1}' | tr '[;]' ' ' > ./tmp/meteo_blank.csv")

set title 'Stations maximum moisture map' font ',16'
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
set dgrid3d 30,30
set hidden3d
set pm3d interpolate 3,3 flush begin nohidden3d 
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault

splot './tmp/meteo_blank.csv' using 2:3:4  with pm3d title 'maximum moisture Map'

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
