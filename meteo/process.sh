# process.sh includes all processing functions : filtering, sorting
#!/bin/bash

function GetIndex {
	sub=${cut_index#* $1:}
	[[ ${sub} == ${cut_index} ]] && retval="" || retval=${sub%% *};
	return 0
}

function Greater {
	a=$1; b=$2
	a=${a//[!0-9]/}; b=${b//[!0-9]/};
	if [[ $a == $b ]] ; then [[ $1 > $2 ]] && return 0 || return 1 ; fi
	[[ $a -gt $b ]] && return 0 || return 1;
} 

# Insertion sort function
function insertion_sort {
	local list=( "${cut_list[@]}" );	#create a duplicate to not touch cut_list
	local i=1; j=1;
	for ((i = 1; i < ${#list[@]}; i++)); do
		j=$i
		while [[ $j -gt 0 ]] && (Greater ${list[j-1]} ${list[j]}); do
			temp=${list[j]}
			list[j]=${list[j-1]}
			list[j-1]=$temp
			j=$((j-1))
		done
	done
	cut_list_sorted=( "${list[@]}" )
	return 0
}

# Remove duplicates in a list passed as argument $1
function Remove_Duplicates {
	list=$1;
	list=${list//[,]/ }
	clist="";
	for item in $list ; do	if [[ ${clist} == "" ]] ; then clist=$item$col_sep; else [[ ${clist#*$item,} == ${clist} ]] && clist=$clist$item$col_sep; fi ; done
	retval=${clist%,*};
	return 0
}

# processing a scope by extracting the needed columns from the input file.

###################################################################################################################################################################
# 
# Processing a scope by extracting the needed columns from the input file and filter , sort and group :
#       EXTRACTING & FILTERING :	using cut, tr, awk in ONE CALL 
#       SORTING:					using the C-program csort
#		GROUPING:					using the csort (inside the C-program) or awk if grouping (max,min,avg) are no
#
###################################################################################################################################################################

function ProcessScope {
	# find the list of columns to extract
	echo_g $LS   $Processing$scope   $LS
	
	# we need to use cut to extract the needed columns only 
	GetCols $1
	keys=${retval%%-*}				# get the keys columns. keys columns are those used for sorting and grouping using min , max, average or self (no grouping)
	values=${retval##*-}			# get the values colums. values columns are those used for display later by the C-program for calculation and grouping
	echo_d "Keys : [$keys]    values : [$values]"
	
	cut_columns=$keys$col_sep$values$col_sep
	
	# we need to adjust the new col numbers after cut for awk
	# cut_list is the cut_columns list with ' ' as separator
	
	[[ $dat_filter != "" ]] && [[ "${cut_columns##*$dat_col}" == "${cut_columns}" ]] && cut_columns=$cut_columns$day_col$col_sep$tim_col$col_sep;
	[[ $geo_filter != "" ]] && [[ "${cut_columns##*$geo_col}" == "${cut_columns}" ]] && cut_columns=$cut_columns$lon_col$col_sep$lat_col$col_sep;
	
	# remove duplicates from cut_columns
	Remove_Duplicates $cut_columns;
	cut_columns=$retval;
	
	# Now remove alpha characters from cut_columns
	cut_list=(${cut_columns//[,]/ })
	echo_d "cut list [${cut_list[@]}]"
	
	cut_columns=${cut_columns//[!0-9,]/}
	echo_d "Cut_columns : $cut_columns"

	#generate the cut_list_sort by calling insertion_sort
	insertion_sort  
	
	echo_d "initial list 	: ${cut_list[@]}"
	echo_d "final list 		: ${cut_list_sorted[@]}"
		
	# create a mapping in cut_index between old ranking and new one to use after after cut
	i=1; cut_index=" ";
	for col in ${cut_list_sorted[@]} ; do cut_index=$cut_index$col:$i" " ;  i=$(($i+1)) ;	done
	echo_d "cut_index is [$cut_index]" 
	
	# Now let's find the new geo_col, dat_col etc 
	# echo_d cut_geo_col	: from $geo_col to $cut_geo_col;
	GetIndex $day_col; cut_day_col=$retval;	echo_d cut_day_col	: from $day_col	to $cut_day_col; 	#day	included in date
	GetIndex $tim_col; cut_tim_col=$retval;	echo_d cut_tim_col	: from $tim_col	to $cut_tim_col;	#time 	included in date 
	GetIndex $spd_col; cut_spd_col=$retval; echo_d cut_spd_col	: from $spd_col	to $cut_spd_col;	#wind speed 
	GetIndex $ang_col; cut_ang_col=$retval; echo_d cut_ang_col	: from $ang_col	to $cut_ang_col;	#wind orientation
	GetIndex $lon_col; cut_lon_col=$retval; echo_d cut_lon_col	: from $lon_col	to $cut_lon_col;	#longitude
	GetIndex $lat_col; cut_lat_col=$retval; echo_d cut_lat_col	: from $lat_col	to $cut_lat_col;	#latitude

	# Now let's find the new keys and values 
	IFS=',' read -ra arr <<< "$keys"
	for i in "${arr[@]}"; do
		echo_d " call GetIndex ($i)"
		GetIndex $i
		echo_d " returned ($retval)"
		[[ -z $new_keys ]] && new_keys=$retval || new_keys=$new_keys$col_sep$retval
	done
	echo_d "new keys are [$new_keys]" 
	
	IFS=',' read -ra arr <<< "$values"
	for i in "${arr[@]}"; do
		echo_d " call GetIndex ($i)"
		GetIndex $i
		echo_d " returned ($retval)"
		[[ -z $new_values ]] && new_values=$retval || new_values=$new_values$col_sep$retval
	done
	
	echo_d "new keys are [$new_keys]"
	echo_d "new values are [$new_values]"
	echo_d "columns for cut [$cut_columns]"
	
	################################################### Call  cut| tr | awk ######################################################

	# filename for the output : input filename prefixed with $scope_
	ext_filename=$path_tmp$1"_"$filename
	# now cut and filter the input file using awk and passing the context to the filter.awk script file
#<< FILTERING start time
	start_time=$(date +%s)		
	cut -d $field_separator -f $cut_columns $filename | tr '[,|T]' ';'| \
	awk -F $field_separator -v progress="$progress" -v keys="$new_keys" -v values="$new_values" \
							-v day_col="$cut_day_col" -v tim_col="$cut_tim_col" -v lon_col="$cut_lon_col" -v lat_col="$cut_lat_col" -v spd_col="$cut_spd_col" -v ang_col="$cut_ang_col" \
							-v lon_filter="$lon_filter" -v lat_filter="$lat_filter" -v lat_min="$lat_min" -v lat_max="$lat_max" -v lon_min="$lon_min" -v lon_max="$lon_max" -v dat_filter="$dat_filter" -v dat_min="$dat_min" -v dat_max="$dat_max" \
					-f ./awk/filter.awk  > $ext_filename
	
	# if output file is missing, stop processing and send error
	if ! [[ -e "$ext_filename" ]]; then error_msg $Missing_File$ext_filename $Error_Data_Extraction $1; return 1; fi
	
	file_size=$(stat -c%s "$ext_filename")
	rows_count=$(wc -l < "$ext_filename")
#>> FILTERING end time 
	end_time=$(date +%s)
	
	# elapsed time with second resolution
	elapsed=$(( end_time - start_time ))

	echo_g $Filteredfilecreated" ["$ext_filename"] size: ["$file_size"] rows : ["$rows_count"] time : ["$elapsed"s]" 
	
	echo_d "file after filtering of $ext_filename" 
	echo_d "$keys;$values"
	
	# test if file is empty 
	if [[ "$rows_count" -eq 0 ]] ; then error_msg $No_Data$ext_filename; return 1; fi

	############################################## Prepare call to csort (C-program) ##############################################
	
	# check if a the current scope needs a reverse sorting either for keys or values after grouping
	[[ $keys == ${keys%r*} ]] && isreversekey="" || isreversekey="-r"
	[[ $values == ${values%r*} ]] && isreversevalue="" || isreversevalue="-r"
	
	[[ -z $sort_mod ]] && [[ mod="" || mod="-"$sort_mod ]]
	
	# find grouping columns to send to the csort function (C-program) for min, max, avg calculation
	# correction de take into account that the keys are merged by the filtering
	list_keys=(${keys//,/ });
	nbkeys=${#list_keys[@]}
	
	str=${values//,/ };
	#correction de take into account that the keys are merged by the filtering
	list_keys=${keys//,/ };
	
	i=1; 
	for item in $str ; do
		if [[ ${item%g*} != $item ]] ; then 
			j=$(($i+1)); col=${item%g*}; 
			grp_cols+=$j$col_sep; 
			echo_d "grp_col from [$col] to [$j]"; 
		fi
		if [[ ${item%r*} != $item ]] ; then 	# check if after grouping we need a sort on a grouped column in values. only one is permitted. we will take the last
			sortonvalue=$(($i+1)); 
			echo_d "sort on value with column [$sortonvalue] reverse mode is [$isreversevalue]"
		fi
		i=$(( $i +1 )); 
	done
	
	grp_cols=${grp_cols%,*}
	echo_d "grouping cols found in [$values]: [$grp_cols]"
	
	# filename for the sorted output : filtered output filename prefixed with "s_" 
	s_ext_filename=$path_tmp"s_"$1$"_"$filename
	g_s_ext_filename=$path_tmp"g_s_"$1"_"$filename
	
	# Preparing StatsDef flag : flagstats
	flag=${StatsDef##*$1:}									# search for argument $1 and get the right part of the string
	if [[ "$flag" == "$StatsDef" ]] ; then flagstats=0 ; fi		# failure in finding my tag
	flagstats=${flag%% *}									# search for the space and get the left part of the string (i.e. 7 in case of t1 )	
	
#<< SORTING start time
	##################################    Call csort C-PROGRAM    ############################
	# now calling the sort C program
	# Usage: csort [OPTION]... -f [FILE] -o [FILE] ...
	# Write sorted and merged data of FILE to outputfile .
	# Option:
	# 	-t, SEP                         use SEP instead of default ";" transition
	# 	-r  reverse                     reverse the result of comparisons
	# 	-d  debug                       run with debug mode
	# 	-f  [FILENAME]                  read input from the file specified
	# 	-o, [FILENAME]                  write result to FILE instead of standard output
	# 	-k, POS			                use POS column as unique index 
	# 									(default end of line).
	# 	-g, POS1[,POSn]                 list of columns used for stats and grouping
	# 									(default end of line).  
	# 	-s  [flag]                      flag [add MAX:1 MIN:2 AVG:4] as needed
	# 	--help 							to get help
	# 	--version 						to get version number
	##########################################################################################
	
	start_time=$(date +%s)

	if [ "$_debug" == "on" ] ; then debug="-d"; else debug=""; fi 
	
	echo_d  $debug -t $field_separator $isreversekey -f $ext_filename -o $s_ext_filename -k 1 -g $grp_cols -s $flagstats 
	$csort $debug -t $field_separator $isreversekey -f $ext_filename -o $s_ext_filename -k 1 -g $grp_cols -s $flagstats

#<< SORTING end time
	end_time=$(date +%s)
	elapsed=$(( end_time - start_time ))

	# if sorted output file is missing, stop processing and send error
	if ! [[ -e "$s_ext_filename" ]]; then error_msg $Missing_File$s_ext_filename $Error_Data_sorting $1; return 1; fi
	
	file_size=$(stat -c%s "$s_ext_filename")
	rows_count=$(wc -l < "$s_ext_filename")
	echo_g $Sortedfilecreated" ["$s_ext_filename"] size: ["$file_size"] rows : ["$rows_count"] time : ["$elapsed"s]" 
	
#<< SORTING ON VALUE start time 
	start_time=$(date +%s)
	if [[ $sortonvalue != "" ]] ; then 
		$csort $debug -t $field_separator $isreversevalue -f $s_ext_filename -o $g_s_ext_filename -k $sortonvalue
	else
		cp $s_ext_filename $g_s_ext_filename
	fi
#<< SORTING ON VALUE end time
	end_time=$(date +%s)
	elapsed=$(( end_time - start_time ))

	# if sorted output file is missing, stop processing and send error
	if ! [[ -e "$g_s_ext_filename" ]]; then error_msg $Missing_File$g_s_ext_filename $Error_Data_sorting $1; return 1; fi
	
	file_size=$(stat -c%s "$g_s_ext_filename")
	rows_count=$(wc -l < "$g_s_ext_filename")

	echo_g $Groupedfilecreated" ["$g_s_ext_filename"] size: ["$file_size"] rows : ["$rows_count"] time : ["$elapsed"s]" 
	echo_d "file after filtering sorting and merging of $g_s_ext_filename" 
	# head -n1 $g_s_ext_filename
	
	return 0
}

# after the context is set, we need to process the different scopes using the scope_list	
# preparing data consists in extracting the needed sns then sending them to the C program for sorting and grouping
function PrepScopeData {
	# clear	
	
	# displays the summary of the context : filename, filters, mode, ...
	DisplayContext								
	
	#remove and clean all temporary files in ./tmp
	rm -r $path_tmp* 2> /dev/null;
	
	##################################
	# THE LOOP : loop for each scope #
	# loop over all required scopes  #
	##################################

	for scope in $scope_list 
	do
		# process each scope 
		if ! (ProcessScope $scope ); then 
			# we need to exit as ProcessScope is abnormal
			echo_d $Processing_stopped
			return 1		# do not exit, keep going for the next scopes at least
		fi		
	done
	return 0
}

