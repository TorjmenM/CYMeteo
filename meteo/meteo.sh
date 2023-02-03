# meteo.sh
#!/bin/bash

# version number
 version="1.0.1"

# C-Program Name
csort="./csort"
Makefile="Makefile"

# tmp files path_tmp
path_tmp="./tmp/"

# script directory
path_script=$(dirname "$0")"/"

#gnuplot scipt files extension
gp_ext=".gp"	

#field-separator
field_separator=";"

#Columns separator
col_sep=","

###################    List of Definitions : Scope Arguments, Filtering Arguments, Sort Mode, Help  #################################################
# mapping of all permitted tags and their corresponding needed columns                                                                              #
# ScopeDef syntax <scope>:[key1,key2...]-[val1,val2...]  - key or val represents the column number in the source file with a suffix [a|b] to split  #
#                                                          coordinates into longitude/latitude or dates into day/hour                               #
# suffix : a,b when coordinates or dates are splitted "a" means first column (day) and "b" means second column (time)
#          for coordinates, "a" means latitude and "b" is longitude as they come in the source file
#
#####################################################################################################################################################
#ScopeDef="t1:1-11g \			# station_id - temperature -> Max:1, Min:2, Avg:4 -> flagstats = 1+2+4 =7
#		  t2:2a,2b-11g \		# day,hour	 - temperature -> Avg:4 -> flagstats = 4
#		  t3:2b,1,2a-11 \		# hour,station,day - temperature 
#		  p1:1-7g \				# station_id - pressure -> Max:1, Min:2, Avg:4 -> flagstats = 1+2+4 =7
#		  p2:2a,2b-7g \			# day,hour	 - pressure -> Max:1, Min:2, Avg:4 -> flagstats = 1+2+4 =7
#		  p3:2b,1,2a-7 \		# hour,station,day - pressure 
#		  w:1-10a,10b,4g,5g \	# station - longitude, latitude, vect_x, vect_y -> vect_x_avg, vect_y_avg -> Avg:4 flagstats=4
#		  h:1-10b,10a,14r \		# station - longitude, latitude, altitude -> sorted by altitude decreasing 
#		  m:1-10b,10a,6gr"		# station - longitude, latitude, moisture -> moisture_max (sorted by moisture decreasing) -> Avg: flagstats=1
#####################################################################################################################################################
ScopeDef="t1:1-11g \
		  t2:2a,2b-11g \		
		  t3:2b,1,2a-11 \		
		  p1:1-7g \				
		  p2:2a,2b-7g \			
		  p3:2b,1,2a-7 \		
		  w:1-10a,10b,4g,5g \	
		  h:1-10b,10a,14r \		
		  m:1-10b,10a,6g \
		  x:1-6g"	

StatsDef="t1:7 t2:4 t3:0 p1:7 p2:4 p3:0 w:4 h:0 m:1 x:7"	

############################################################# Plot Definition #######################################################################
# mapping of all permitted tags and their corresponding description (type of graph, title, labels, columns ...                                      #
#####################################################################################################################################################
PlotDef="t1:filledcurve-Temperature.min,max,mean.by.Station-Temperature-Station|\
	     t2:lines-Average.temperature-Temperature-Time|\
		 t3:multilines-Temperature.by.hour.and.station-Temperature-Date|\
		 p1:filledcurve-Pressure.min,max,mean.by.station-Pressure-Date|\
		 p2:lines-Average.pressure-Pressure-Time|\
		 p3:multilines-Pressure.by.hour.and.station-Pressure-Date|\
		 h:matrix-Altitude-Latitude-Longitude-4 \
		 m:matrix-maximum.moisture-Latitude-Longitude-4 \
		 w:vector-average.wind-Latitude-Longitude\
		 x:filledcurve-Humidité.min.max.mean.by.Station-Humidité-Station" 
		 
OptArgDef="t:p:whmxFGSAOQg:a:d:f:-:"

display_mode=1		# (1): to display plots one after one 
					# (2): to display plots in frames in one page

# to check all passed arguments and set the different contexts 
# Scope Arguments, Filtering Arguments, Sort Mode, Help, filename
# Context is defined as 
filename=""

# specific column numbers to locate coordinates, dates,dat_col speed and wind orientation columns
geo_col=10; lon_col=10b; lat_col=10a; dat_col=2; day_col=2a; tim_col=2b; spd_col=5g; ang_col=4g;

# for geo filtering
geo_filter=""; lon_filter=""; lat_filter=""; lon_min=""; lon_max=""; lat_min=""; lat_max="";

# for date filtering
dat_filter=""; dat_min=""; dat_max=""; 

# list containing the list of all scopes required by the user. sort_mode "avl", "abr" or tab. retval used becaus shell functions can only return an integer
scope_list=""; sort_mod=""; retval="";

#progress twitle in awk
progress=""

###################################################################################################################################################################
source messages.sh		# includes all messages, debug, verbose and display functions                                                                             #
###################################################################################################################################################################

###################################################################################################################################################################
source controls.sh		# includes all control functions for arguments                                                                                            #
###################################################################################################################################################################

###################################################################################################################################################################
source process.sh		# includes all processing functions : filtering, sorting                                                                                  #
###################################################################################################################################################################

###################################################################################################################################################################
source display.sh		# includes all display functions generating .dem files for gnuplot then calling gnuplot                                                   #                             
###################################################################################################################################################################

# entry function : main
function main {
	# first check arguments
	# clear 
	
	display_mode=1;
	
	if CheckArgs $@ ; then 	
		# create a tmp directory for tmp files
		mkdir -p $path_tmp;			
		# if all OK then prepare the data for the different scopes and process
		if  ! PrepScopeData ; then exit; fi				
	
		# if all OK proceed to the gnuplot for display. for that prepare .gnu files using the required .mod files 
		if  ! GenPlotScripts; then exit; fi
		
		# call gnuplot to display
		DisplayPlots $display_mode
		
		# clean data and exit
		#rm -r $path_tmp;
	fi
}

# call main to start the script 
main $@

