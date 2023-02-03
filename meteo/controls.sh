# Control functions
#!/bin/bash

# getcolumns locates my tag (i.e. t1 ou p3 ...) and returns the columns' numbers that are needed to sort and filter 
# these columns will be extracted further to pass the filtered file to the awk and C-program 

function GetCols {
	[[ -z $1 ]] && return 1;
	
	ScopeColumnsList=${ScopeDef##*$1:}					# search for argument $1 and get the right part of the string
	# failure in finding my tag	
	if [[ "$ScopeColumnsList" == "$ScopeDef" ]] ; then error_msg $Wrong_Parameter$ return 1 ; fi
	ScopeColumns=${ScopeColumnsList%% *}				# search for the space and get the left part of the string (i.e. 1-11 in case of t1 )	
	retval=$ScopeColumns								# retval used to return result to the caller of this function
	return 0
}

# CheckDate to check the arguments that are dates for filtering. 
# the date must exist then we need to check leap years and last day in every month
# expected date format is YYYY-MM-DD

function CheckDate {
	local d="$1"
    date "+%Y-%m-%d" -d "$d" > /dev/null  2>&1
    if [ $? != 0 ]
    then
		error_msg $Wrong_Date$d
		exit 1
    fi
	return 0
}	

function CheckArgs {
	while getopts $OptArgDef options; do				# Loop: Get the next option;
																	# options t p g a d f - take arguments.
		case "${options}" in
			# case of temperature or pressure scope. expecting 1, 2 or 3 after t or p. at least one scope! control is done at the end of the "while" loop
			t|p)
				echo_d ${options}"-"${OPTARG} 
				if ! [[ "${OPTARG}" -eq "1" || "${OPTARG}" -eq "2" || "${OPTARG}" -eq "3" ]] ; then     	# test temperature and pressure options : must be 1, 2 or 3
					error_msg $Wrong_Parameter${options}${OPTARG}
					exit
				fi
				scope_list+=${options}${OPTARG}" "				
				;;							
			# case of wind , height or moisture scopes 
			w|h|m|x) 	
				echo_d ${options} 
				scope_list+=${options}${OPTARG}" "
				;;
			# case of date filtering. expecting date range <dat_min> <dat_max>
			d) 	
				if [[ $dat_filter == 1 ]] ; then error_msg $Dates_range_exclusive; exit; fi
				
				eval "a1=\${$((OPTIND-1))}"
				eval "a2=\${$((OPTIND))}"
				OPTIND=$((OPTIND+1))
				
				# control dates range YYYY-MM-DD YYYY-MM-DD		
				dat_min=$a1
				dat_max=$a2				
				echo_d "dates: <$dat_min> <$dat_max>"
				
				if ! CheckDate $dat_min || ! CheckDate $dat_max ; then  error_msg ${Wrong_dates_range}$range ; exit; fi
				echo_d "dates are correct"
				dat_filter=1				
				;;
			# case of longitude or latitude filtering. expecting coordinates range <float> <float>
			g)	
				# Control if we already have a geo oe area option
				if [[ $lon_filter == 1 ]] ; then error_msg $Wrong_Geography_Exclusive; exit; fi
				
				# get the next arg as we need min and max
				eval "a1=\${$((OPTIND-1))}"; eval "a2=\${$((OPTIND))}" ; OPTIND=$((OPTIND+1))
				
				echo_d $a1-$a2
				if [[ $a1 =~ $correct_longitude ]] && [[ $a2 =~ $correct_longitude ]] ; then echo_d "coordinates are correct" ; else error_msg $Wrong_coordinates; return 1; fi
				
				lon_min=$a1; lon_max=$a2;
				lon_filter=1; geo_filter=1
				;;
			a)	
				if [[ $lat_filter == 1 ]]  ; then error_msg $Wrong_Geography_Exclusive; exit; fi
				
				# get the next arg as we need min and max
				eval "a1=\${$((OPTIND-1))}" ; eval "a2=\${$((OPTIND))}" OPTIND=$((OPTIND+1))
				
				if [[ $a1 =~ $correct_latitude ]] && [[ $a1 =~ $correct_latitude ]] ; then echo_d "coordinates are correct" ; else error_msg $Wrong_coordinates$1; return 1; fi ;
				
				lat_min=$a1; lat_max=$a2;
				lat_filter=1 geo_filter=1
				;;
			f) 	
				echo_d file-${OPTARG} 										 
				filename=${OPTARG}
				# test existance of input file
				if ! [ -f $filename ] ; then
					error_msg $Missing_File$filename	# check that file exists
					exit
				fi
				;;
			# case of geography filtering using frames as this information is absent in the input file and has to be generated
			F|G|S|A|O|Q) 
				if [[ $geo_filter == 1 ]] ; then error_msg $Wrong_Geography_Exclusive; exit; fi
				case "${options}" in
					F)	lat_min=40  ; lat_max=51  ; lon_min=-5 ; lon_max=10  ;;
					G)	lat_min=0   ; lat_max=6   ; lon_min=-54; lon_max=-50 ;;
					S)	lat_min=45  ; lat_max=50  ; lon_min=-60; lon_max=-53 ;;
					A)	lat_min=11  ; lat_max=16  ; lon_min=-65; lon_max=-57 ;;
					O)	lat_min=-26 ; lat_max=-10 ; lon_min=35 ; lon_max=61  ;;
					Q)	lat_min=-75 ; lat_max=-41 ; lon_min=36 ; lon_max=131 ;;
				esac
				geo_filter=1; lon_filter=1; lat_filter=1
				;;
			# case of all options with -- prefixe like help or the sorting mode (avl,abr,tab) (case sensitive)
			-) 	echo_d ${OPTARG} 
				# test arguments with --
				case ${OPTARG} in	
					# display the README.md file
					"help")		cat README.md | more; exit;;
					# display version number
					"version" | "v" ) 	echo meteo $version; exit;;
					# set progress on
					"progress" | "p") progress="on" ;;
					# multiplot
					"verbose" | "debug" | "v" | "d") _debug="on" ;;
					# multiplot
					"multiplot" | "m" ) display_mode=2 ;; 
					# sort method	
					"avl"|"abr"|"tab") if [[ -z $sort_mod ]]; then sort_mod=${OPTARG}; else error_msg $Wrong_SortMod_Exclusive; return 1 ; fi ;;
					# any other case is out of scope	
					*) 	error_msg $Wrong_Parameter${options}${OPTARG}; exit ;;
				esac		
				;;
			# any other case which means a wrong option has been entered
			*) 	error_msg $Wrong_Parameter${options}${OPTARG}
				exit ;;
		esac
	done
	
	if [[ -z "${scope_list}" ]] ; then
		error_msg $Missing_Scope
		exit
	fi
	
	if ! [[ -e "${filename}" ]] ; then
		error_msg $Missing_File${filename}
		exit
	fi
	
	# check if csort executable is present in the current directory
	if [[ ! -e $csort ]]; then 
		color=$LightCyan;
		c_echo $Missing_File$csort; 
		c_echo $Building$csort"...";
		if !(make ) ; then 
			error_msg $Make_error$csort;
			exit;
		fi
	fi
	
	return 0
}
