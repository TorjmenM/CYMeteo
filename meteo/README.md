meteo(1)                                                                              User Commands                                                                                          meteo(1)

NAME
	meteo.sh - process and display data from a weather csv file and displays graphs and data

SYNOPSIS
	./meteo.sh [OPTION]... [FILE]...[SCOPE]...

DESCRIPTION
	This manual page documents the meteo bash script.  

	User needs to run the ./meteo.sh command from ./meteo directory 
	To make the csort command : run "make" from ./meteo  

	If --debug option is given, debug messages will be displayed in red 
	If --help option is given, this will display this ReadMe
	If we encounter any wrong argument or wrong input data, the entire command is aborted
	One to many scopes can be queried in one execution; in which case the filters will apply to all scopes equally
	In case user enter exclusive options like (i) filters on geographical coordinates and filter on area (F, G, S, A, O, Q] 
	or (ii) many filters on dates or (iii) or many sorting modes; the command will abort
	-f option and at least one of the scope options (-t1, -t2, -t3, -p1, -p2, -p3, -w, -h, -m) are mandatory 	   

FILE	
	-f filename
		a meteo CSV file as specified in the Project CY-METEO (v1.02) Filière préING2. 2022-2023
		by E. ANSERMIN - R. VERIN - R. GRIGNON

SCOPE
	-t<mode> 
		(t)emperatures		
	-p<mode>
		atmospheric (p)ressure
				
		<mode> indicates the pattern of the data and the graphs 
		1 :  output is min, max and average temperature (or pressure) per station sorted by ascending station number 
		2 :  output is average temperature (or pressure) per ascending date/hour 
		3 :  output temperature (or pressure) by ascending date/hour and by ascending station number
	-w : (w)ind 
		output is the average wind speed and direction sorted by station number

	-h: (h)eight
		output is ascending altitude per station number 
				
	-m : (m)oisture
		output is the maximum moisture per station number sorted by descending moisture
				
OPTIONS
	-d <min> <max>
		filters all records to match date between date_min and date_max.
		date format is YYYY-MM-DD

	-F|G|S|A|O|Q     
		geograhical areas. only one area can be selected
		filters all records to match area 
		option -F : (F)rance : France métropolitaine + Corse
		option -G : (G)uyane française
		option -S : (S)aint-Pierre et Miquelon : ile située à l’Est du Canada
		option -A : (A)ntilles
		option -O : (O)céan indien
		option -Q : antarcti(Q)ue
		
	-g <min> <max>: 
		lon(g)itude. filters all records to match longitude frame (min, max). this option is exclusive with the geograpfical area options
	-a <min> <max> : 
		l(a)titude. filters all records to match latitude frame (min, max). this option is exclusive with the geograpfical area options

	--avl	
		sort data using an AVL type structure (default option if avl if not selected)
	--abr	
		sort data using an AVL type structure
	--tab	
		sort data using an AVL type structure
	   
	--help	
		displays this help
	--debug | --verbose | --d | --v	
		explain what is being done
	--progross | --p
		show progress bar in awk
	--multiplot | --m
		to display all the plots in one window
	--version || --v
		output version information and exit

AUTHOR
	Written by Mehdi Torjmen and Moutie Zahrez

REPORTING BUGS
	Please contact Mehdi Torjmen (mehdi.torjmen@gmail.com)

COPYRIGHT
	This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       

CY Tech                                                                              January 2023                                                                                          meteo(1)