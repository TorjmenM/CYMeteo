# display.sh includes functions to prepare gnuplot files and call gnuplot for display
# uses templates for each scope that are defined in PlotDef string
#!/bin/bash

# get the plot parameters of this scope 

function GetPlotArgs {
	[[ -z $1 ]] && return 1
	
	_PlotParams=${PlotDef##*$1:}					# search for argument $1 and get the right part of the string
	
	if [[ "$_PlotParams" == "$PlotDef" ]] 			# failure in finding my tag	
	then
		error_msg $Wrong_Parameter$1
		return 1
	fi
	
	PlotParams=${_PlotParams%%|*}					# search for the space and get the left part of the string (i.e. 1-11 in case of t1 )
	
	retval=$PlotParams								# retval used to return result to the caller of this function
	return 0
}

# generating the plotscript for the scope passed as $1 using PlotDef
function GenPlotScript {
	# find the corrsponding template
	GetPlotArgs $1

	list_params=(${retval//[-]/ });
	
	# echo_d "List of Plot parameters : ${list_params[@]}"
	graph_model=${list_params[0]}
	i=1
	
	sed_arg=""
	for param in ${list_params[@]}
	do
		_param=${param//./ };
		sed_arg=$sed_arg" -e 's/\${V"$i"}/$_param/g'" 
		i=$(($i+1))                              
	done
	
	plot_filename=$path_tmp"p_"$1"_"$filename
	plot_filename=${plot_filename%.*}$gp_ext
	
	g_s_ext_filename=$path_tmp"g_s_"$1"_"$filename
	
	echo_d "data file for gnuplot :"$g_s_ext_filename
	# echo_d "sed -e s/\${filename}/$filename/g $sed_arg $graph_model.mod > $plot_filename"

	# generate the plot script from the template
	eval  "sed -e 's/\${filename}/g_s_$1_$filename/g' $sed_arg ./gp/$graph_model.mod > $plot_filename"
	
	return 0
}


# Loop over the different scopes and generate a .gnu gnuplot script file for each
function GenPlotScripts {
	# loop for each scope
	# loop over all required scopes
	list_plots=""
	for scope in $scope_list 
	do
		# generate plot script for each scope 
		if ! ( GenPlotScript $scope $list_plots ) ; then 
			# we need to exit as process_scope is abnormal
			echo_d $Processing_stopped
			return 1		# do not exit, keep going for the next scopes at least
		fi
	done
	return 0
}


# now that plot scrips are generated we call gnuplot to display them
function DisplayPlots {

	# MergePlotScripts $display_mode
	allplots_filename=$path_tmp${filename%.*}$gp_ext
	for scope in $scope_list 
	do
		plot_filename=$path_tmp"p_"$scope"_"$filename
		plot_filename=${plot_filename%.*}$gp_ext
		if ! [[ -e "$plot_filename" ]]; then error_msg $Missing_File$plot_filename return 1; fi
	
		# all good we can call gnuplot for display 
		if [[ $1 ==  1 ]] ; then 
			gnuplot -p $plot_filename; 
		else	
			cat $plot_filename >> $allplots_filename
		fi
	done
	
	if [[ $1 ==  2 ]] ; then 
		# add  a multiplot command to the gnuplot script merged file 
		
		IFS=', ' read -r -a array <<< $scope_list
		nb_plots=${#array[@]}
		
		lines=$(echo "sqrt($nb_plots-1)+1" | bc)
		columns=$((($nb_plots / $lines) + ($nb_plots % $lines > 0)))
		
		cmd="sed -i '1i set multiplot layout "$lines$col_sep$columns"' $allplots_filename"
		
		eval $cmd
		
		# get screen resolution and unzoom to 90%
		# Xaxis=$(echo "$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)*0.9"|bc)
		# Yaxis=$(echo "$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)*0.9"|bc)
		
		# call gnuplot passing the window position and the merged plot file
		# cmd="gnuplot -p -e 'set terminal x11 size "$Xaxis,$Yaxis" position 50,10;' $allplots_filename"
		cmd="gnuplot -p -e 'set terminal qt size 1200,800 position 50,10;' $allplots_filename"
		eval $cmd
	fi
	
	return 0
}
