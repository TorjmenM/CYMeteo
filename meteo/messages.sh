# Messaging, Verbose and debug functions
#!/bin/bash

#--------------------------------------------------- List of Error Messages -------------------------------------------------------
Help_Message="use --help to get help"
Wrong_Parameter="wrong Argument: " 
Wrong_Date="Year, Month and Day must be integer and Date should be valid  : "
Wrong_coordinates="coordinates must be valid : "
Missing_File="missing file name : "
Wrong_Option="wrong option after -"
Wrong_Geography_Exclusive="only one geographical location or coordinate ranges can be selected"
Wrong_SortMod_Exclusive="only one sort method can be selected"
Dates_range_exclusive="only one dates range is permitted"
Missing_Scope="missing scope. at least one parameter should be entered : -t1 -t2 -t3 -p1 -p2 -p3 -w -h -m"
Wrong_dates_range="wrong dates range : "
Wrong_coordinates_range="wrong coordinates_range : "
Processing_stopped="processing stopped "
Processing="processing "
Error_Data_Extraction="data extraction error; check datafile content. program aborted :"
Error_Data_sorting="data sorting error; check datafile content. program aborted :"
No_Data="no rows after filtering. nothing to process : "
Startfiltering="start generating filtered records for "
Filteredfilecreated="output filtered csv created ......... >"
Sortedfilecreated="output sorted and grouped csv created >"
Groupedfilecreated="output re-sorted on value csv created >"
Building="Building " 
Make_error="Unable to build "
LS="-----------------------------------------"
#-----------------------------------------------------------------------------------------------------------------------------------

#--------------------------------------------------- regular expressions -----------------------------------------------------------
#correct_coordinate="^-?([0-9]{1,2}|1[0-7][0-9]|180)(\.[0-9]{1,10})?$"
correct_longitude="^-?([0-9]{1,2}|1[0-7][0-9]|180)(\.[0-9]{1,10})?$"
correct_latitude="^-?([0-9]{1,2}|1[0-7][0-9]|180)(\.[0-9]{1,10})?$"


#correct_latitude="^(\+|-)?(?:90(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,6})?))$"
#correct_longitude="^(\+|-)?(?:180(?:(?:\.0{1,6})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,6})?))$"
#-----------------------------------------------------------------------------------------------------------------------------------
 
#------------------------------------------- debugging and messaging functions  ---------------------------------------------------- 
_debug="off"
Red='\033[0;31m'
Green='\033[0;32m'
NoColor='\033[0m'
LightCyan='\033[1;36m'

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

function echo_d {
	[ "$_debug" == "on" ] &&  echo -e "${Red}${BASH_SOURCE[1]}: line ${BASH_LINENO[0]}> $@${NoColor}"
}

function echo_g {
	echo -e "${Green}$0: $@${NoColor}"
}

function c_echo {
	echo -e "$color$0: $@${NoColor}"
}

function DisplayContext {
	# Display the Context
	color=$LightCyan
	c_echo $LS Context Summary $LS
	c_echo Filename  		: $filename
	c_echo Geo Filter		: $geo_filter
	c_echo Lon Filter		: $lon_filter
	c_echo Lat Filter		: $lat_filter
	c_echo Geo Column		: $geo_col
	c_echo Longitude Min 	: $lon_min
	c_echo Longitude Max 	: $lon_max
	c_echo Latitude Min  	: $lat_min
	c_echo Latitude Max  	: $lat_max
	c_echo Date Filter   	: $dat_filter
	c_echo Date Column   	: $dat_col
	c_echo Date Min      	: $dat_min
	c_echo Date Max      	: $dat_max
	c_echo Wind Angle Col  	: $ang_col
	c_echo Wind Speed Col	: $spd_col
	c_echo Scope is      	: $scope_list
	
	c_echo $LS-----  end   -----$LS	
}

function error_msg {
	echo $0: $@
	echo $0: $Help_Message
	return 1
}
